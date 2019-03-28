<?php

namespace Modules\Chart\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Auth;
use App\Chat;
use App\Conversation;

class ChartController extends Controller{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index()
    {
        return view('chart::index');
    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        return view('chart::create');
    }

    /**
     * Store a newly created resource in storage.
     * @param  Request $request
     * @return Response
     */
    public function store(Request $request)
    {
    }

    /**
     * Show the specified resource.
     * @return Response
     */
    public function show()
    {
        return view('chart::show');
    }

    /**
     * Show the form for editing the specified resource.
     * @return Response
     */
    public function edit()
    {
        return view('chart::edit');
    }

    /**
     * Update the specified resource in storage.
     * @param  Request $request
     * @return Response
     */
    public function update(Request $request)
    {
    }

    /**
     * Remove the specified resource from storage.
     * @return Response
     */
    public function destroy()
    {
    }
   

    public function getChatListing($id){
        if(Auth::user()->id != $id){
            return response()->json([
                'msg'=> "Your are not Authenticated User!"
            ],402);
        }
        
		
        // selecting the list of all chat messages..
        $lists = \DB::select( \DB::raw("
                                        SELECT co1.id,
                                            co1.sender,
                                            co1.conType,
                                            co1.reciever,
                                            us.id 'uid',
                                            us.userName,
                                            us.name,
                                            us.image,
                                            us.email, 
                                            us.location,
                                            us.country,
                                            us.bio,
                                            us.userType,
                                            ch1.id 'chat_id',
                                            ch1.con_id,
                                            ch1.msg,
                                            ch1.deleted,
                                            ch1.seen,
                                            ch1.created_at,
                                            ch1.msg_sender
                                            
                                            FROM conversations  co1
                                                    INNER JOIN users us
                                                            ON ( CASE
                                                                    WHEN co1.sender <> $id
                                                                    THEN co1.sender
                                                                    
                                                                    WHEN co1.reciever <> $id
                                                                    THEN co1.reciever
                                                                END = us.id)
                                                    INNER JOIN chats ch1
                                                            ON ch1.con_id = co1.id
                                                    INNER JOIN (SELECT max(ch2.id) id,
                                                                    ch2.con_id
                                                                    FROM chats ch2
                                                                    GROUP BY ch2.con_id order by id desc) ch3
                                                            ON ch3.con_id = ch1.con_id
                                                                AND ch3.id = ch1.id
                                            WHERE $id IN (co1.sender,
                                                        co1.reciever)
                                            AND ch1.deleted != $id
                                            
                                            ") );

  		// IF THERE ARE DATA IN THE LISTS THEN RETRIVE THE DETAILS TOO
		$chat=[];
        
        $lists = json_decode(json_encode($lists), true);
        \Log::info($lists);
  		if(sizeof($lists)>0){
            $conId= $lists[0]['con_id'];
			$chat = Chat::where([['con_id', $conId],['deleted', '!=', $id]])->limit(5)->orderBy('id', 'desc')->get();
  		}
           Chat::where([['con_id', $conId],['seen', $id]])->update(['seen' => 0]);
           
          // NOW SEND SEEN NOTIFICATION TO OTHER USER...
        //   noti.sendSeenNoti($key, $c[sizeof($c)->msg_sender, 'seen');

        
  		return response()->json([
            'lists'=> $lists,
  			'chats'=> $chat,
          ],200);

    }

    public function chatHistory($key){
         $id = Auth::user()->id;
        // get the chat details where not equal to deleted and update seen
         $chat = Chat::where([['con_id', $key],['deleted', '!=', $id]])->limit(5)->orderBy('id', 'desc')->get();
        //   $c = $chat->toJSON();
        $c = json_decode(json_encode($chat), true);;
        // CHECK IF LAST MESSAGE IS SEEN OR NOT. IF seen===loggedin user id, mean it is not seen yet.
        if($c[sizeof($c)-1]['seen']==$id)// this mean my id is stored in seen column so its not seen yet
        {	
           Chat::where('con_id', $key)->update(['seen' => 0]);
           //Chat::where([['con_id', $key],['seen', $id]])->update(['seen' => 0]);
          // NOW SEND SEEN NOTIFICATION TO OTHER USER...
        //   noti.sendSeenNoti($key, $c[sizeof($c)->msg_sender, 'seen');

        }
        return response()->json([
  			'chats'=> $c,
          ],200);
    }
    public function createChat(Request $request){

		$data = $request->all();
        $uid =  Auth::user()->id;
        $rid = $data['reciever'];
		// CHECK IF THERE ANY PREVIOUS CONVERSATIONS OR NOT 
		$conversation =  Conversation::where([['sender',$uid],['reciever',$rid]])->orWhere([['reciever',$uid],['sender',$rid]])->first();
		if($conversation){
			// A PREVIOUS CONVERSATION IS FOUND 
			$chat =  Chat::create([
                'msg_sender' => $uid,
				'con_id' => $conversation->id,
				'msg' => $data['msg'],
				'seen' => $data['reciever']
            ]);
			//noti.sendMsgChat(conversation.id,$data.msg,$data.reciever,chat.id)
			return $chat; 
		}else{
			// create a new conversation...
			$obj = [
				'sender' => $uid, 
				'reciever' => $data['reciever']
            ];
            $con = conversation::create($obj);
			if($con){
				// now insert the message.. 
				
				$chat =  Chat::create([
                    'msg_sender' => $uid,
                    'con_id' => $con->id,
                    'msg' => $data['msg'],
                    'seen' => $data['reciever']
                ]);
				
				
				// LET THE OTHER USERS KNOW 
				//noti.sendMsgChat(con.id,data.msg,data.reciever,chat.id)
				return $chat ;
		    }
        }
   }
   public function updateSeen(Request $request){

    $uid = Auth::user()->id;
    $cond_id = $request->con_id;
    return  Chat::where([['con_id', $cond_id],['seen', $uid]])->update(['seen' => 0]);
	  
  }
}
