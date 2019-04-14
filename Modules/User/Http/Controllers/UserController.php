<?php

namespace Modules\User\Http\Controllers;
use App\User;
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
    public function home(Request $request){
        if($request->segment(1)=='admin'){
            if(!Auth::check()){
               return redirect('/');
            }
            \Log::info(Auth::user()->userType);
            if(Auth::user()->userType==4){
                return view('admin');
                
            }
            return redirect('/');
            
           
        }
        return view('welcome');

    }
    public function index()
    {
        $this->userService->test();
        return view('user::index');
    }
    public function getday($key)
    {   
        return $this->userService->getday($key);
    }
    public function system_admin(){
        if(!Auth::check()){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 402);
        }
        if(!Auth::user()->userType === 4){
            return response()->json([
              'message' => "You are not Authenticate User!",
           ], 402);
        }
        
        return view('admin');
    }
    public function login(Request $request){
        if (Auth::attempt(['email' => $request->email, 'password' => $request->password])) {
            if(Auth::user( )->isActive==0){
                 Auth::logout();
                \Session::flush();
                return response()->json([
                    'msg' => 'Your account has not been activated yet. Please activate your account.',
                    'title' => 'Oops',
                    
                ], 401); 
            }
            else{
                return response()->json([
                    'msg' => 'Login Successfull',
                    'title' => 'Done',
                    'user' => Auth::user()
                ], 200); 
            }
        } 
        else{
             return response()->json([
                'msg' => 'Invalid Details!',
                'title' => 'Oops!'
            ],401); 
         }
    }
    public function register(Request $request){
        $data = new ValidateRequest();
        $ok = $data->validateUserRequest($request);
        if($ok){
            $this->userService->createUser($request->all());
        }
    }
    public function accountactivation(Request $request){
         $token = $request->token;
        // get the row from reset table matching this token   http://127.0.0.1:8000/activationlink?token=wUruMbdbXJM6GzgBQHnChfpp2tUiK9Lsw1rYFC4eG1YikbpjcMxv7K7Oikpe
         $isTokenFound = User::where('activation_token',$token )->first();
        \Log::info($isTokenFound);
         if($isTokenFound){
                User::where('activation_token',$token )->update([ 'isActive'=> 1,'activation_token' => null]);
                \Log::info('okk');
                return redirect('/activated');
                    
             }
         else{
             return redirect('/');
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
    public function getAllSubcat()  {
       return $this->userService->getAllSubcat();
    }
    public function getAllService(){
        return $this->userService->getAllService();
    }
    public function getInfoBySearch($key){

        return $this->userService->getInfoBySearch($key);
    }
    public function getInfoBySearchCatagory(Request $request){

        return $this->userService->getInfoBySearchCatagory($request);
    }
    public function getallcatgory(){

        return $this->userService->getallcatgory();
    }
    public function insertService(Request $request){
           
        return $this->userService->insertService($request->all());
    }
    public function updateSeriveStep(Request $request){
           
        return $this->userService->updateSeriveStep($request->all());
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
    public function insertCatagory(Request $request){
        return $this->userService->insertCatagory($request->all());
    }
    public function insertSubCatagory(Request $request){
        return $this->userService->insertSubCatagory($request->all());
    }
    public function getCurrentStep($key){
        return $this->userService->getCurrentStep($key);
    }
    public function getImage(Request $request){
        return $this->userService->getImage($request);
    }
    public function getUserImage(Request $request){
        return $this->userService->getUserImage($request);
    }

    public function unlinkImage(Request $request){
        return $this->userService->unlinkImage($request->all());
    }
    public function updateStatus(Request $request){
        return $this->userService->updateStatus($request->all());
    }
    public function updateUserInfo(Request $request){
        return $this->userService->updateUserInfo($request->all());
    }
    public function saveImages(Request $request){
        return $this->userService->saveImages($request->all());
    }
    public function updateSaveServiceImage(Request $request){
        return $this->userService->updateSaveServiceImage($request->all());
    }
    public function deleteExtraServices(Request $request){
        return $this->userService->deleteExtraServices($request->all());
    }
    public function deleteTagService(Request $request){
        return $this->userService->deleteTagService($request->all());
    }
    public function updateTag(Request $request){
        return $this->userService->updateTag($request->all());
    }
    public function UpdateExtraServices(Request $request){
        return $this->userService->UpdateExtraServices($request->all());
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
    public function getServiceDescritption($id){
        return $this->userService->getServiceDescritption($id);
    }
    public function getServiceImages($id){
        return $this->userService->getServiceImages($id);
    }
    public function getExtraServicebyId($id){
        return $this->userService->getExtraServicebyId($id);
    }
    public function getTagbyId($id){
        return $this->userService->getTagbyId($id);
    }
    public function UpdateServiceDescription(Request $request){
        return $this->userService->UpdateServiceDescription($request->all());
    }
    public function getNewList(){
        return $this->userService->getNewList();
    }
    public function getRiviewListById($id){
        return $this->userService->getRiviewListById($id);
    }
    public function getServiceList($id){
        return $this->userService->getServiceList($id);
    }
    public function deleteService(Request $request){
        return $this->userService->deleteService($request->all());
    }
    public function deleteSubCategory(Request $request){
        return $this->userService->deleteSubCategory($request->all());
    }
    public function updateService(Request $request){
        return $this->userService->updateService($request->all());
    }
    public function categoryUpdate(Request $request){
        return $this->userService->categoryUpdate($request->all());
    }
    public function updateSubCategory(Request $request){
        return $this->userService->updateSubCategory($request->all());
    }
    public function getAllServiceList(){
        return $this->userService->getAllServiceList();
    }
    public function getBookingList(Request $request){
        return $this->userService->getBookingList($request->all());
    }
    public function getBookingListWithoutDate(Request $request){
        return $this->userService->getBookingListWithoutDate($request->all());
    }
    public function getAllBookingList(Request $request){
        return $this->userService->getAllBookingList($request->all());
    }
    public function getProfileInfo($id){
        return $this->userService->getProfileInfo($id);
    }
    public function getCancleList($date){
        return $this->userService->getCancleList($date);
    }
    public function passwordresetGetEmail(Request $request){
        return $this->userService->passwordresetGetEmail($request);
    }
    public function matchPasswordLink(Request $request){
        return $this->userService->matchPasswordLink($request);
    }
    public function resetPassword(Request $request){
        return $this->userService->resetPassword($request);
    }
    public function giveReview(Request $request){
        return $this->userService->giveReview($request->all());
    }
    public function updateUser(Request $request){
        return $this->userService->updateUser($request->all());
    }
    public function deleteUser(Request $request){
        return $this->userService->deleteUser($request->all());
    }
    public function deleteCategory(Request $request){
        return $this->userService->deleteCategory($request->all());
    }
    public function getAllUserList(){
        return $this->userService->getAllUserList();
    }
    
    public function getTimeSolte($id){
      
        $data = $this->userService->getTimeSolte($id);
        // \Log::info($data);

        //  return 1; 
    }
    //notifications /////////////
    public function notifications(Request  $request) {
        return $this->userService->notifications($request->all()); 
    }
    public function updateUserSettings(Request  $request) {
        return $this->userService->updateUserSettings($request->all()); 
    }
    public function getAllNotifications() {
        return $this->userService->getAllNotifications();
    }
    public function getNotificationData() {
        return $this->userService->getNotificationData();
    }
    public function getNoficationAllData() {
        return $this->userService->getNoficationAllData();
    }
    public function updateNotification(Request  $request) {
        return $this->userService->updateNotification($request->all());
    }


}
