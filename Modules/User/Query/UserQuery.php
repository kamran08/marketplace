<?php
namespace Modules\User\Query;
use Illuminate\Http\Request;
use App\User;
use App\Cat;
use App\Service;
use App\Extra;
use App\Tag;
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
         $cat = Cat::all();
        return $cat;
    }
    public function getAllService(){
      $service = Service::with('image')->orderBy('created_at', 'desc')->get();  
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
    public function insertService($data){
           return Service::create($data);
    }
    public function addExtra($data){
           for($i=0; $i<sizeof($data)-1; $i++) {
                Extra::create($data[$i]);
           } 
           
           $size = sizeof($data)-1;
           $user = Extra::create($data[$size]);
           \Log::info($user);
            return $user;
    }
    public function delateExtra($data){
   // return Extra::create($data);
    }
    public function addTag($data){
      for($i=0; $i<sizeof($data)-1; $i++){
         Tag::create($data[$i]);
        //\Log::info($data[$i]);
      }
    return Tag::create($data[sizeof($data)-1]);
    //\Log::info($data);
    //return Extra::create($data);
    }








   public function getCurrentManagers(Request $request){
    return $this->userService->getCurrentManagers($request->all());
    }
    
}
