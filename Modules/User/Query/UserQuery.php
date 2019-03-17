<?php
namespace Modules\User\Query;
use Illuminate\Http\Request;
use App\User;
use App\Category;
use App\Service;
use App\Extra;
use App\Review;
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
      $service = Service::with('image','user','tag','extra','category','alltime','avgreview')->withCount('reviews')->orderBy('created_at', 'desc')->get();  
        return $service;
    }
    public function getInfoBySearch($key=''){
     // if($key == '')  $service = Service::with('image')->orderBy('created_at', 'desc')->get();
      if($key=='') $service = Service::with('image')->with('users')->with('cats')->orderBy('created_at', 'desc')->get();
     
      else $service = Service::with('image')->with('users')->with('cats')->where('title', 'like', '%' . $key . '%')->get();  

        return $service;
    }
    public function getInfoBySearchCatagory(Request $request){
      
            if($key=='') $service = Service::with('image')->with('users')->with('category')->get();
            else $service = Service::with('image')->with('users')->where('title', 'like', '%' . $key . '%')->get();  
            return $service;
    }
    public function getCurrentStep($key){
      return  Service::where('id',$key)->select('nextStep')->first();   
      \Log::info($data)  ;
    }


    public function insertService($data){
           return Service::create($data);
    }
    public function addExtra($data){

    $flag =  Extra::insert($data);
    return response()->json($flag);
    }
    public function addTag($data){

    $flag =  Tag::insert($data);
    return response()->json($flag);


    }
    public function delateExtra($data){
      // return Extra::create($data);
    }
    public function saveImages($data){
     
      return Image::insert($data);
    }
    public function updateSaveServiceImage($data){
     
     Image::where('service_id',$data[0]['service_id'])->delete();
      $d = Image::insert($data);
      return response()->json([
         $d
      ],200);
    }
    
    public function UpdateExtraServices($data){
     
      Extra::where('service_id',$data[0]['service_id'])->delete();
      $d =  Extra::insert($data);
      return response()->json([
         $d
      ],200);
    }
    public function updateTag($data){
     
      Tag::where('service_id',$data[0]['service_id'])->delete();
      $d =  Tag::insert($data);
      return response()->json([
         $d
      ],200);
    }
    public function deleteExtraServices($data){
      return Extra::where('service_id',$data['service_id'])->delete();
    }
    public function deleteTagService($data){
      return Tag::where('service_id',$data['service_id'])->delete();
    }
   public function getServiceTableUserId($service_id){
    return Service::where('id',$service_id)->select("user_id")->first();
    }
  
   public function updateSeriveStep($service_id,$num){
    return Service::where('id',$service_id)->update(['nextStep' => $num]);
    }
   public function getServiceDetailsById($service_id){
    return Service::where('id',$service_id)->with('image','user','tag','extra','category','alltime','reviews','reviews.user')->withCount('reviews')->first();
    }
   public function getServiceDescritption($service_id){
    return Service::where('id',$service_id)->with('alltime')->first();
    }
   public function getServiceImages($service_id){
    return Image::where('service_id',$service_id)->get();
    }
   public function getExtraServicebyId($service_id){
    return Extra::where('service_id',$service_id)->get();
    }
   public function getTagbyId($service_id){
    return Tag::where('service_id',$service_id)->get();
    }
   public function getTimeSolte($service_id){
    return TimeSetting::where('service_id',$service_id)->get();
    }
   public function getAllUserList(){
    return User::all();
    }
   public function insertCatagory($data){
     //\Log::info($data);
    return Category::create($data);
    }
   public function updateUser($data){
      return User::where('id',$data['id'])->update($data);
    }
   public function categoryUpdate($data){

      return Category::where('id',$data['id'])->update($data);
    }
   public function UpdateServiceDescription($data){
      return Service::where('id',$data['id'])->update($data);
    }
   public function deleteUser($data){
      return User::where('id',$data['id'])->delete();
    }
   public function deleteCategory($data){
      return Category::where('id',$data['id'])->delete();
    }
   public function deleteTimeSettings($id){
      return TimeSetting::where('service_id',$id)->delete();
    }
   public function deleteService($data){
      return Service::where('id',$data['id'])->delete();
    }
   public function updateService($data){
      return Service::where('id',$data['id'])->update($data);
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
      if($data['userType']==1){
        return Booking::where([['seller_id',$data['id']],['status',0]])->with('buyerInfo','sellerInfo','service','service.image')->get();
      }
      return Booking::where([['buyer_id',$data['id']],['status',0]])->with('buyerInfo','sellerInfo','service','service.image')->get();
    }
   public function getServiceList($data){
    return Service::where('user_id',$data)->with('image','user','tag','extra','category','alltime','avgreview')->withCount('reviews')->get();
    }
   public function getAllServiceList(){
    return Service::with('image','user','tag','extra','category','alltime','avgreview')->withCount('reviews')->get();
    }
   public function getBookingList($data){
     
     if($data['userType']==1){
      return Booking::where([["seller_id",$data['id']],['bookingDate',$data['date']],['status',$data['status']]])->with('buyerInfo','sellerInfo','service','service.image')->withCount('review')->get();
     }
     return Booking::where([["buyer_id",$data['id']],['bookingDate',$data['date']],['status',$data['status']]])->with('buyerInfo','sellerInfo','service','service.image')->withCount('review')->get();
    }

   public function getAllBookingList($data){
      \Log::info($data);
      return Booking::where([['bookingDate',$data['date']],['status',$data['status']]])->with('buyerInfo','sellerInfo','service','service.image')->withCount('review')->get();
     
    }

   public function getProfileInfo($data){
    return User::where('id',$data)->with('avgreview')->withCount('reviews')->first();
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
   public function giveReview($data){
    return Review::create($data);
    }

 
    
}

