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

class UserService {
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
    public function getAllcat(){
       $user = $this->query->getAllcat();
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
    public function getInfoBySearchCatagory($key){
       $service = $this->query->getInfoBySearchCatagory($key);
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
    public function unlinkImage($data){
      return unlink($data['imageLink']);
    }
    public function getNewList(){
      if(!Auth::check()){
          return response()->json([
            'message' => "You are not Authenticate User!",
         ], 402);
      }
      $id = Auth::user()->id;

      return $this->query->getNewList($id);
    }
    public function getServiceDetailsById($id){
      $data = $this->query->getServiceDetailsById($id);
      foreach ($data['extra'] as $item) {
         $item['staus'] = false;
      }
      return $data;
    }
    public function insertOrder($data){
      if(!Auth::check()){
         return response()->json([
           'message' => "You are not Authenticate User!",
        ], 402);
     }
      $data["buyer_id"]= Auth::user()->id;
      $data["bookingDate"]= date("Y-m-d");
      //$data["extraService"]= json_encode($data["extraService"]);

      return $this->query->insertOrder($data);
     
   }
    public function getslots($todayDate){
      $todayName =  new DateTime($todayDate);
      $todayName = $todayName->format('l');
      $time =  $this->query->getTimebyDay($todayName);
      if(!$time){
         return response()->json([
            'message' => "Service not available on this day!",
         ], 403);
      }
      $bookedTime =  $this->query->getBookedTime($todayDate);
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
      $appointmentInfo = Null;
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
  


} 