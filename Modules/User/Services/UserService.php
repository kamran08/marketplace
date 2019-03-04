<?php
namespace Modules\User\Services;
use App\User;
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


} 