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
    
    public function upload(Request $request){

        request()->file('file')->store('uploads');

     // $pic = $request->file->originalName();
        $pic= $request-> file->hashName();

       // \Log::info( $pic);
        /*update the profile pic*/
        //$flag =  User::where('id', $id)->update(['image' => "/uploads/$pic"]);
        // if ($flag) {
        //     return $pic;
        // } else {
        //     return response()->json([
        //         'message' => "Picture Upload Failed!!",

        //     ], 403);
        // }
        return $pic;
    }


}
