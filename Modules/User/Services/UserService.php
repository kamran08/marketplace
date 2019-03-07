<?php
namespace Modules\User\Services;
use App\User;
use Auth;
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
       $id = Auth::user()->id;
       $data[ 'user_id'] = $id;
       $service = $this->query->insertService($data);
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


         // $service = $this->query->addExtra($data);
         // return $service;
    }
    public function delateExtra($data){
       $service = $this->query->delateExtra($data);
       return $service;
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
      return $this->query->updateSeriveStep($service_id,3);
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
      return $this->query->updateSeriveStep($service_id,0);

       
       
    }
  


} 