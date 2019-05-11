<?php
namespace Modules\User\Query;
use Illuminate\Http\Request;
use App\User;
use App\Category;
use App\Subcategory;
use App\Service;
use App\Extra;
use App\Review;
use App\Tag;
use App\Image;
use App\TimeSetting;
use App\Booking;
use App\Notification;
use App\Chat;
use App\Reviewb;
use Illuminate\Support\Facades\Hash;
use Mockery\CountValidator\Exact; 
class UserQuery {
   
    public function getAll(){
       $user = User::all();
       return $user;
    }
    public function getday($key){
       $user = TimeSetting::where('service_id', $key)->get();
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
    public function getAllSubcat(){
         $cat = Subcategory::with('category')->get();
        return $cat;
    }
    public function getAllService(){
      
      $temp = Service::all();
      if(sizeof($temp)<8){
      return  Service::with('image', 'user', 'tag', 'extra', 'category', 'alltime', 'avgreview')->withCount('reviews')->orderBy('created_at', 'desc')->get();
      }
     //   
        $service = Service::with('image','user','tag','extra','category','alltime','avgreview')->withCount('reviews')->orderBy('created_at', 'desc')->paginate(8);  
        return $service;
    }
    public function getInfoBySearch($key=''){
     // if($key == '')  $service = Service::with('image')->orderBy('created_at', 'desc')->get();
      if($key=='') $service = Service::with('image')->with('users')->with('cats')->orderBy('created_at', 'desc')->get();
     
      else $service = Service::with('image')->with('users')->with('cats')->where('title', 'like', '%' . $key . '%')->get();  

        return $service;
    }
    public function getInfoBySearchCatagory($id, $str){
      $qurey = Service::with('image','user','tag','extra','category','alltime','avgreview')->withCount('reviews');
      if($id){
        $qurey->where('cat_id', $id);      
      }
      if($str){
        $qurey->where('title', 'like', '%' . $str . '%');      
      }
      // return $qurey->get();
      return $qurey->paginate(6);
     
    }
    public function getallcatgory(){
      return Category::all();  
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
   public function updateFinalStep($service_id){
    return Service::where('id',$service_id)->update(['nextStep' => 5],['isComplete' => 1]);
    }
   public function getServiceDetailsById($service_id){
    return Service::where('id',$service_id)->with('image','user','tag','extra','category','alltime','reviews.user', 'avgreview')->withCount('reviews')->first();
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
    return Category::create($data);
    }
   public function insertSubCatagory($data){
    return Subcategory::create($data);
    }
    public function deleteSubCategory($id){
      return Subcategory::where('id',$id)->delete();
    }
   public function updateUser($data){
      return User::where('id',$data['id'])->update($data);
    }
   public function categoryUpdate($data){

      return Category::where('id',$data['id'])->update($data);
    }
   public function updateSubCategory($data){

      return Subcategory::where('id',$data['id'])->update($data);
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
   public function deleteService($id){
      return Service::where('id',$id)->delete();
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
    return Booking::where([['bookingDate',$data],['service_id',$service_id]])->whereNotIn('status',[3])->select('bookingTime')->get();
    }
   public function getNewList($data){
      if($data['userType']==1){
        return Booking::where([['seller_id',$data['id']],['status',0]])->with('buyerInfo','sellerInfo','service','service.image')->get();
      }
      return Booking::where([['buyer_id',$data['id']],['status',0]])->with('buyerInfo','sellerInfo','service','service.image')->get();
    }

   public function getRiviewListById($data){
      $user = User::where('id',$data)->select('id','userType')->first();
      $type = $user->userType;
      if($type==2){
        return Review::where('buyer_id',$data)->with('user')->get();
      }
    
      return Reviewb::where('seller_id',$data)->with('user')->get();
      
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
     return Booking::where([["buyer_id",$data['id']],['bookingDate',$data['date']],['status',$data['status']]])->with('buyerInfo','sellerInfo','service','service.image')->withCount('reviewb')->get();
    }
   public function getBookingListWithoutDate($data){
     
     if($data['userType']==1){
      return Booking::where([["seller_id",$data['id']],['status',$data['status']]])->with('buyerInfo','sellerInfo','service','service.image')->withCount('review')->get();
     }
     return Booking::where([["buyer_id",$data['id']],['status',$data['status']]])->with('buyerInfo','sellerInfo','service','service.image')->withCount('reviewb')->get();
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
     \Log::info($data);
      return Review::create($data);
    }
   public function giveReviewb($data){
    return Reviewb::create($data);
    }
    public function getAllNotifications($key){
      return Notification::where('notifor',$key)->with('user')->orderBy('id','desc')->limit(5)->get();
    }
    public function getAllNotificationsAll($key){
      return Notification::where('notifor',$key)->with('user')->orderBy('id','desc')->get();
    }
    public function getNewNotifications($key){
      return Notification::where([['notifor',$key],['seen',1]])->with('user')->count();
    }
    public function getMsgAllNotifications($key){
      return Chat::where('seen',$key)->orderBy('id','desc')->get();
    }
    
   public function notifications($data){
     return Notification::create($data);
    }
   public function updateNotification($data){
     return Notification::where('id',$data['id'])->update($data);
    }
   public function updateUserSettingsPassworld($data,$password){
      $u = User::where('id', $data['id'])->first();  

      if (Hash::check($password, $u->password))
      {
        return User::where('id',$data['id'])->update($data);
      }

      return response()->json([
        'message' => "old Password doesn't match!",
    ], 401);
     
    }
   public function updateUserSettingsEmail($data,$email,$password){
      $u = User::where([['id', $data['id']],['email',$email]])->first();  

      if (Hash::check($password, $u->password))
      {
        return User::where('id',$data['id'])->update($data);
      }

      return response()->json([
        'message' => " old Password doesn't match!",
    ], 401);
     
    }

 
    
}

