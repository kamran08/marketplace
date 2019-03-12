<?php
namespace Modules\User\Query;
use Illuminate\Http\Request;
use App\User;
use App\Category;
use App\Service;
use App\Extra;
use App\Tag;
use App\Image;
use App\TimeSetting;
use App\Booking;
use Mockery\CountValidator\Exact;
class UserQuery {
   
    public function getAll(){
       $user = User::all();
       return $user;
    }
    public function createUser($data){
        $data['password']  = bcrypt($data['password']);
       return User::create($data);
    }
  
    public function getAllcat(){
         $cat = Category::all();
        return $cat;
    }
    public function getAllService(){
      $service = Service::with('image','user')->orderBy('created_at', 'desc')->get();  
        return $service;
    }
    public function getInfoBySearch($key=''){
     // if($key == '')  $service = Service::with('image')->orderBy('created_at', 'desc')->get();
      if($key=='') $service = Service::with('image')->with('users')->with('cats')->orderBy('created_at', 'desc')->get();
     
      else $service = Service::with('image')->with('users')->with('cats')->where('title', 'like', '%' . $key . '%')->get();  

        return $service;
    }
    public function getInfoBySearchCatagory($key){
            if($key=='') $service = Service::with('image')->with('users')->with('cats')->get();
            else $service = Service::with('image')->with('users')->where('title', 'like', '%' . $key . '%')->get();  
            return $service;
    }
    public function getCurrentStep($key){
      return  Service::where('id',$key)->select('nextStep')->first();   
      \Log::info($data)  ;
     // return $step;
    }


    public function insertService($data){
           return Service::create($data);
    }
    public function addExtra($data){
    //  for($i=0; $i<sizeof($data)-1; $i++) {
    //       Extra::create($data[$i]);
    //  } 
    //  $size = sizeof($data)-1;
    //  $user = Extra::create($data[$size]);
    // // \Log::info($user);
    //   return $user;
    $flag =  Extra::insert($data);
    return response()->json($flag);
    }
    public function addTag($data){
    // for($i=0; $i<sizeof($data)-1; $i++){
    //    Tag::create($data[$i]);
    // }
    // return Tag::create($data[sizeof($data)-1]);
    $flag =  Tag::insert($data);
    return response()->json($flag);


    }
    public function delateExtra($data){
      // return Extra::create($data);
    }
    public function saveImages($data){
     
       $flag =  Image::insert($data);
       return response()->json($flag);
    }
   public function getServiceTableUserId($service_id){
    return Service::where('id',$service_id)->select("user_id")->first();
    }
  
   public function updateSeriveStep($service_id,$num){
    return Service::where('id',$service_id)->update(['nextStep' => $num]);
    }
   public function getServiceDetailsById($service_id){
    return Service::where('id',$service_id)->with('image','user','tag','extra','category','alltime')->first();
    }
   public function getTimeSolte($service_id){
    return TimeSetting::where('service_id',$service_id)->get();
    }
   public function insertOrder($data){
    return Booking::create($data);
    }
   public function getTimebyDay($data,$service_id){
    return TimeSetting::where([['day',$data],['service_id',$service_id]])->select('id','startTime','endTime','duration')->first();
    }
   public function getBookedTime($data,$service_id){
    return Booking::where([['bookingDate',$data],['service_id',$service_id]])->select('bookingTime')->get();
    }
   public function getNewList($data){
    return Booking::where([['seller_id',$data],['status',0]])->with('buyerInfo','sellerInfo','service','service.image')->get();
    }
   public function getServiceList($data){
    return Service::where('user_id',$data)->with('image','user','tag','extra','category','alltime')->get();
    }
   public function getBookingListS($data,$date){
    return Booking::where([["seller_id",$data],['bookingDate',$date],['status',1]])->with('buyerInfo','sellerInfo','service','service.image')->get();
    }
   public function getBookingListR($data,$date){
    return Booking::where([["buyer_id",$data],['bookingDate',$date]])->whereIn('status',[1,0,])->with('buyerInfo','sellerInfo','service','service.image')->get();
    }
   public function getProfileInfo($data){
    return User::where('id',$data)->first();
    }
   public function getCancleList($data,$date,$type){
    return Booking::where([["$type",$data],['bookingDate',$date],['status',3]])->with('buyerInfo','sellerInfo','service','service.image')->get();
    }
   public function updateStatus($data){
     
    return Booking::where('id',$data['id'])->update($data);
    }
   public function updateUserInfo($id,$data){
     
    return User::where('id',$id)->update($data);
    }


    
}

