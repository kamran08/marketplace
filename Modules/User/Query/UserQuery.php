<?php
namespace Modules\User\Query;
use Illuminate\Http\Request;
use App\User;
use App\Cat;
use App\Service;
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
    public function getInfoBySearch($key){
     // if($key == '')  $service = Service::with('image')->orderBy('created_at', 'desc')->get();
      $service = Service::with('image')->with('users')->with('cats')->where('title', 'like', '%' . $key . '%')->get();  

        return $service;
    }
    public function getInfoBySearchCatagory($key){
      $service = Service::with('image')->with('users')->where('title', 'like', '%' . $key . '%')->get();  
 
        return $service;
    }








   public function getCurrentManagers(Request $request){
        
    return $this->userService->getCurrentManagers($request->all());
    }
    
}
