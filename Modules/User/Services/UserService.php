<?php
namespace Modules\User\Services;
use App\User;
use App\TimeSetting;
use Auth;
use DateTime;
use DateInterval;
use App\Classes\CommonClass;
use Illuminate\Http\Request;
use Modules\User\Query\UserQuery;
use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;

class UserService extends Controller {
    protected $query;
    protected $customhelper;
    public function __construct(UserQuery $query, CommonClass $customhelper){
        $this->query = $query;
        $this->customhelper = $customhelper;
    }
    public function test(){
       $user = $this->query->getAll();
      // \Log::info($user);
    }
    public function createUser($data){
       $user = $this->query->createUser($data);
      // \Log::info($user);
    }
    public function updateUser($data){
       return $this->query->updateUser($data);
      
    }
    public function deleteUser($data){
       return $this->query->deleteUser($data);
      
    }
    public function deleteCategory($data){
       return $this->query->deleteCategory($data);
      
    }
    public function getAllcat(){
       $user = $this->query->getAllcat();
       foreach ($user as $item) {
         $item['staus'] = true;
      }
       return $user;
      // \Log::info($user);
    }
    public function getAllService(){
       $service = $this->query->getAllService();
       return $service;

      // \Log::info($user);
    }
    public function getInfoBySearch($key){
       $service = $this->query->getInfoBySearch($key);
       return $service;
      // \Log::info($user);
    }
    public function getInfoBySearchCatagory($request){
       $str = $request->str;
       $cat = $request->cat;
       if($cat){
         return $this->query->getInfoBySearchCatagory($cat);
       }else{
         return $this->query->getAllServiceList();
       }
       
       $service = $this->query->getInfoBySearchCatagory($request);
       return $service;
    }
    public function getAllUserList(){
       $service = $this->query->getAllUserList();
       return $service;
    }
    public function getCurrentStep($key){
       return  $this->query->getCurrentStep($key);
       
    }
    public function insertService($data){

      $id = "";
      if(!Auth::check()){
         return response()->json([
                 'message' => "You are not Authenticate User!",
             ], 402);
      }
      $servicingTime =$data['servicingTime'];
      unset($data['servicingTime']);
      $dayError =[];
      $dayErrorFlag = false;
      $index = 0;
     foreach ($servicingTime as $item)  {
         if($item['isOn']===true){
            $startTime =  new DateTime($item['startTime']);
            $endTime =  new DateTime($item['endTime']);
            $sinceStart = $startTime->diff($endTime);
            $totalMinutes=($sinceStart->h*60)+$sinceStart->i;
            if($totalMinutes%$item['duration']!=0){
               $duration = $totalMinutes%$item['duration'];
               $dayError[$index]="Please correct time slots of ".$item['day']." ! you have $duration minutes extra!";
               $dayErrorFlag = true;
               $index++;
            }
         }
      }
      if($dayErrorFlag==true){
      return response()->json([
                  'dayError' => $dayError,
               ], 406);
      }
       $id = Auth::user()->id;
       $data[ 'user_id'] = $id;
       $service = $this->query->insertService($data);
       $index = 0;

       foreach ($servicingTime as $item)  {
         if($item['isOn']===true){
            $timeSetting=[
               "service_id" => $service->id,
               "day" => $item['day'],
               "startTime" => $item['startTime'],
               "endTime" => $item['endTime'],
               "duration" => $item['duration'],
             ];
           // \Log::info($item['isOn']);
            TimeSetting::create($timeSetting);
          } 

       }
       return $service;
    }

    public function addExtra($data){

      if(!Auth::check()){
         return response()->json([
            'message' => "Your are not Authenticate User!",
         ],402);
      }
      $service_id = $data[0]['service_id'];
      $user_id = $this->query->getServiceTableUserId($service_id);
      
      if($user_id['user_id']!=Auth::user()->id){
            return response()->json([
               'message' => "You are not Owner of this Job!"
            ],403);
      }
      $flag  = $this->query->addExtra($data);
      if(!$flag){
         return response()->json([
            'message' => "Server Problem!",
         ], 401);
      }
      return $this->query->updateSeriveStep($service_id,4);
    }

    public function addTag($data){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      $service_id = $data[0]['service_id'];
      $user_id = $this->query->getServiceTableUserId($service_id);

      if($user_id['user_id']!=Auth::user()->id){
          return response()->json([
            'message' => "You are not Owner of this Job!",
         ], 403);
      }
      $flag =  $this->query->addTag($data);
      if(!$flag) {
          return response()->json([
            'message' => "Server Problem!",
         ], 401);
      }
      return $this->query->updateSeriveStep($service_id,5);
    }
    public function saveImages($data){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      $service_id = $data[0]['service_id'];
      $user_id = $this->query->getServiceTableUserId($service_id);
     
      if( $user_id['user_id']!=Auth::user()->id){
         return response()->json([
            'message' => "You are not Owner of this Job!",
         ], 403);
      }

      $flag =  $this->query->saveImages($data);
      if(!$flag){
         return response()->json([
            'message' => "Server Problem!",
         ], 401);
      }
      return $this->query->updateSeriveStep($service_id,3);
    }
    public function updateSaveServiceImage($data){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      $service_id = $data[0]['service_id'];
      $user_id = $this->query->getServiceTableUserId($service_id);
     
      if( $user_id['user_id']!=Auth::user()->id){
         return response()->json([
            'message' => "You are not Owner of this Job!",
         ], 403);
      }

      return  $this->query->updateSaveServiceImage($data);

    }
    public function UpdateExtraServices($data){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      return  $this->query->UpdateExtraServices($data);

    }
    public function deleteExtraServices($data){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      return  $this->query->deleteExtraServices($data);

    }
    public function deleteTagService($data){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      return  $this->query->deleteTagService($data);

    }
    public function updateTag($data){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      return  $this->query->updateTag($data);

    }
    public function unlinkImage($data){
      return unlink($data['imageLink']);
    }
    public function getNewList(){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      $data['id'] = Auth::user()->id;
      $data['userType'] = Auth::user()->userType;
      
      $goru = $this->query->getNewList($data);
      foreach($goru as $d){
         if($d['extraService']){
             $d['extraService'] = json_decode($d['extraService']);
         }
      }
      return $goru;

    }
    public function getServiceList($id){
      return $this->query->getServiceList($id);
    }
    public function deleteService($data){
      return $this->query->deleteService($data['id']);
    }
    public function updateService($data){
      return $this->query->updateService($data);
    }
    public function categoryUpdate($data){
      return $this->query->categoryUpdate($data);
    }
    public function getAllServiceList(){
      return $this->query->getAllServiceList();
    }
    public function getBookingList($data){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      $data['id'] = Auth::user()->id;
      $data['userType'] = Auth::user()->userType;

     
      $goru = $this->query->getBookingList($data);
      foreach($goru as $d){
         if($d['extraService']){
             $d['extraService'] = json_decode($d['extraService']);
         }
      }
      return $goru;
    }

    public function getAllBookingList($data){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      $data['id'] = Auth::user()->id;
      $data['userType'] = Auth::user()->userType;
      return  $this->query->getAllBookingList($data);
    }
    public function getProfileInfo($id){
      return $this->query->getProfileInfo($id);
    }
    public function getCancleList($date){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      $id = Auth::user()->id;
      $type = (Auth::user()->userType==1)? "seller_id" : 'buyer_id';

      return $this->query->getCancleList($id,$date,$type);
    }
    public function getServiceDetailsById($id){
      $data = $this->query->getServiceDetailsById($id);
      foreach ($data['extra'] as $item) {
         $item['staus'] = false;
      }
      return $data;
    }
    public function getServiceDescritption($id){
      return $this->query->getServiceDescritption($id);
    }
    public function getServiceImages($id){
      return $this->query->getServiceImages($id);
    }
    public function getExtraServicebyId($id){
      return $this->query->getExtraServicebyId($id);
    }
    public function getTagbyId($id){
      return $this->query->getTagbyId($id);
    }
    public function insertCatagory($data){
      return $this->query->insertCatagory($data);
    }

    public function UpdateServiceDescription($data){
      $id = "";
      if(!Auth::check()){
         return response()->json([
                 'message' => "You are not Authenticate User!",
             ], 402);
      }
      $servicingTime =$data['servicingTime'];
      unset($data['servicingTime']);
      $dayError =[];
      $dayErrorFlag = false;
      $index = 0;
     foreach ($servicingTime as $item)  {
         if($item['isOn']===true){
            $startTime =  new DateTime($item['startTime']);
            $endTime =  new DateTime($item['endTime']);
            $sinceStart = $startTime->diff($endTime);
            $totalMinutes=($sinceStart->h*60)+$sinceStart->i;
            if($totalMinutes%$item['duration']!=0){
               $duration = $totalMinutes%$item['duration'];
               $dayError[$index]="Please correct time slots of ".$item['day']." ! you have $duration minutes extra!";
               $dayErrorFlag = true;
               $index++;
            }
         }
      }
      if($dayErrorFlag==true){
      return response()->json([
                  'dayError' => $dayError,
               ], 406);
      }
       $id = Auth::user()->id;
       if($data[ 'user_id'] != $id){
         return response()->json([
            'message' => "You are not Authenticate User!",
        ], 402);
       }
       $service = $this->query->UpdateServiceDescription($data);
       $this->query->deleteTimeSettings($data['id']);
       $index = 0;

       foreach ($servicingTime as $item)  {
         if($item['isOn']===true){
            $timeSetting=[
               "service_id" => $data['id'],
               "day" => $item['day'],
               "startTime" => $item['startTime'],
               "endTime" => $item['endTime'],
               "duration" => $item['duration'],
             ];
           // \Log::info($item['isOn']);
            TimeSetting::create($timeSetting);
          } 

       }
       return $service;
      
    }
    public function insertOrder($data){
      if(!Auth::check()){
         return response()->json([
           'message' => "You are not Authenticate User!",
        ], 402);
     }
      $data["buyer_id"]= Auth::user()->id;
      //$data["extraService"]= json_encode($data["extraService"]);

      return $this->query->insertOrder($data);
     
   }
    public function getslots($data){
      $todayDate = $data['date'];
      $service_id = $data['service_id'];
      $appointmentInfo = [];
      $todayName =  new DateTime($todayDate);
      $todayName = $todayName->format('l');
      $time =  $this->query->getTimebyDay($todayName,$service_id);
      if(!$time){
         return $appointmentInfo;
      }
      $bookedTime =  $this->query->getBookedTime($todayDate,$service_id);
      $SerialNo = array_column($bookedTime->all(), 'bookingTime');
      // echo "<pre>";
      // print_r($SerialNo);
      // echo "</pre>";
      $startTime =  new DateTime($time->startTime);
      $startTimePre =  new DateTime($time->startTime);
      $endTime =  new DateTime($time->endTime);
      $duration = $time->duration;
      $sinceStart = $startTime->diff($endTime);
      $totalMinutes=($sinceStart->h*60)+$sinceStart->i;
      
      $slot=0;
      for ($index=0; $index <$totalMinutes ; $index+=$duration) {
         $startTime->add(new DateInterval('PT'.$duration.'M'));
         $slotDetails =  "(".$startTimePre->format('h').":".$startTimePre->format('i').' '.$startTimePre->format('A')." - ".$startTime->format('h').":".$startTime->format('i').' '.$startTimePre->format('A').")";
         $startTimePre->add(new DateInterval('PT'.$duration.'M'));
         $appointmentInfo[$slot]['bookingTime'] = $slotDetails;
         $appointmentInfo[$slot]['isBooked'] = in_array($slotDetails, $SerialNo)? true: false;
         $slot++;
        }
        
        return $appointmentInfo;
   }
    public function updateStatus($data){
      if(!Auth::check()){
         return response()->json([
           'message' => "You are not Authenticate User!",
         ], 402);
      }
      return $this->query->updateStatus($data);
      
    }
    public function updateUserInfo($data){
      if(!Auth::check()){
         return response()->json([
           'message' => "You are not Authenticate User!",
         ], 402);
      }
      $id = Auth::user()->id;
      if($id!=$data['id']){
         return response()->json([
            'message' => "You are not Authenticate User!",
          ], 402);

      }
      unset($data['reviews_count']);
      unset($data['avgreview']);

      return $this->query->updateUserInfo($id,$data);
    }

    public function getImage($request){
      request()->file('img')->store('uploads');
      $pic= "/uploads/".$request->img->hashName();
      return $pic;
      
  }
    public function getUserImage($request){
      if(!Auth::check()){
         return response()->json([
           'message' => "You are not Authenticate User!",
         ], 402);
      }
      $id = Auth::user()->id;
      request()->file('img')->store('uploads');
      $pic= "/uploads/".$request->img->hashName();
      $data =[
         'image' => $pic,
      ];
      $flag = $this->query->updateUserInfo($id,$data);
      if($flag==0){
         if(!Auth::check()){
            return response()->json([
              'message' => "Server Error! Couldn't update Image!",
            ], 403);
         }
      }
      return $pic;
  }

 // Password Reset
 public function passwordresetGetEmail($request){
    \Log::info($request->all());
   $isFound = User::where('email',$request->email)->count();
   if($isFound==0){
       return response()->json([
           'msg' => "Email doesn't exist!",
       ],401);
   }
  
       $token=str_random(30);
       $token = \Hash::make($token);
       \Log::info($token);
       \DB::table('password_resets')->where('email',$request->email)->delete();
       $savedData = \DB::table('password_resets')->insert([
           'email' => $request->email,
           'token' => $token, //change 60 to any length you want $2y$10$.r/0Wp7TW/gUpGPQUgkct.WEX8s/.wGsCc9qT6pwbn.H/Jn2RXyB.
           'created_at' => \Carbon\Carbon::now()
       ]);

           // Mail::to($request->email)
           // ->send(new Passwrordreset($savedData));

         return response()->json([
           'msg' => "password reset link has been Sent!",
       ],200);
   } 
   
   public function matchPasswordLink(Request $request){
      $token = $request->token;
      
      // get the row from reset table matching this token  http://127.0.0.1:8000/passwordreset/check?token=$2y$10$.r/0Wp7TW/gUpGPQUgkct.WEX8s/.wGsCc9qT6pwbn.H/Jn2RXyB.
      $isTokenFound = \DB::table('password_resets')->where('token',$token)->first();
      // if token is valid return data only like this 
      if(!$isTokenFound){
          return response()->json([
              'msg' => "token doesn't exist!",
          ],401);
      }
      return response()->json([
          "token"=>$isTokenFound,
      ],200);
  }
  public function resetPassword(Request $request){
      
      $this->validate($request, [
          'password' => 'required|string|min:6|confirmed',
      ]);

      $flag = User::where("email",$request->email)->update(['password' => Hash::make($request->password)]);
      if(!$flag){
          return response()->json([
              'msg' => "Email doesn't exist!",
          ],401);
      }

      return \DB::table('password_resets')->where('email',$request->email)->delete();
      }


      // Rivew 

      public function giveReview($data){
         if(!Auth::check()){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 402);
        }
        $data['buyer_id'] = Auth::user()->id;
        return $this->query->giveReview($data);
      }
      public function notifications($key){
         if(!Auth::check()){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 402);
        }
          return $this->query->notifications($key);
      }
      public function getAllNotifications($key){
         if(!Auth::check()){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 402);
        }
        if($key==Auth::user()->id){
         //   $user='';
         //   if(Auth::user()->type==1){
         //      $user = ''
         //   }
          return $this->query->getAllNotifications($key);
        }
        else{
           return;
        }
       
        
      }
  
 

} 