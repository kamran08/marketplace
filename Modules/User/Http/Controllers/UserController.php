<?php

namespace Modules\User\Http\Controllers;
use Illuminate\Validation\Validator;
use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Modules\User\Services\UserService;
use Illuminate\Foundation\Validation\ValidatesRequests;
 use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Fascades\DB;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Modules\User\Http\Requests\ValidateRequest;
use App\Http\Controllers\Controller;

use Illuminate\Http\UploadedFile;
use File;
use Illuminate\Support\Facades\Input;
class UserController extends Controller
{
    protected $userService;

	public function __construct(UserService $userService)
	{
		$this->userService = $userService;
	}
    public function index()
    {
        $this->userService->test();
        return view('user::index');
    }
    public function login(Request $request)
    {

        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            return response()->json([
                'msg' => 'Login Successfull',
                'title' => 'Done',
                'user' => Auth::user()
            ],200); 
        } else{
             return response()->json([
                'msg' => 'Invalid Details!',
                'title' => 'Oops!'
            ],401); 
        }
    }
    public function register(Request $request){
       //\Log::info($request);
            $data = new ValidateRequest();
            $ok = $data->validateUserRequest($request);
        //   \Log::info($request);
            if($ok){
            $this->userService->createUser($request->all());
           }
           else{
               
           }
    }





    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create()
    {
        return view('user::create');
    }


    public function getAllcat()  {
       return $this->userService->getAllcat();
    }
    public function getAllService(){
        return $this->userService->getAllService();
    }
    public function getInfoBySearch($key){

        return $this->userService->getInfoBySearch($key);
    }
    public function getInfoBySearchCatagory($key){

        return $this->userService->getInfoBySearchCatagory($key);
    }
    public function insertService(Request $request){
           
        return $this->userService->insertService($request->all());
    }
    public function addExtra(Request $request){
           
        return $this->userService->addExtra($request->all());
    }
    public function delateExtra(Request $request){
           
        return $this->userService->delateExtra($request->all());
    }
    public function addTag(Request $request){
        return $this->userService->addTag($request->all());
    }
    public function getCurrentStep($key){
        return $this->userService->getCurrentStep($key);
    }
    public function getImage(Request $request){
        \Log::info("I am running from getImage");
        request()->file('img')->store('uploads');
        $pic= "/uploads/".$request->img->hashName();
        return $pic;
    }
    public function unlinkImage(Request $request){
        return $this->userService->unlinkImage($request->all());
    }
    public function saveImages(Request $request){
        return $this->userService->saveImages($request->all());
    }
    public function insertOrder(Request $request){
        return $this->userService->insertOrder($request->all());
    }
    public function getslots(Request $request){
        return $this->userService->getslots($request->all());
    }
    public function getServiceDetailsById($id){
        return $this->userService->getServiceDetailsById($id);
    }
    
    public function getTimeSolte($id){
      
        $data = $this->userService->getTimeSolte($id);
        // \Log::info($data);
        
      //  return 1;
        
    }


}
