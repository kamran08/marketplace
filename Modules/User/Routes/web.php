<?php

use Illuminate\Support\Facades\Request;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::prefix('user')->group(function() {
    Route::get('/', 'UserController@index');
});
Route::get('app/get-all-catgory', 'UserController@getAllcat');
Route::get('/app/get-all-service', 'UserController@getAllService');
Route::get( '/app/get-all-info-by-search/{key}', 'UserController@getInfoBySearch');
Route::get( '/app/get-courrent-step/{key}', 'UserController@getCurrentStep');

Route::get( '/app/getServiceDetailsById/{key}', 'UserController@getServiceDetailsById');
Route::get( '/app/gettime/{key}', 'UserController@getTimeSolte');

Route::get( '/app/get-all-catgory-by-search', 'UserController@getInfoBySearchCatagory');



Route::post('app/login', 'UserController@login');
Route::post('app/register', 'UserController@register');
Route::post( 'app/upload-avater', 'UserController@upload');
Route::post( 'app/insert-all-services', 'UserController@insertService');
Route::post( 'app/add-extra-services', 'UserController@addExtra');
Route::post( 'app/delate-extra', 'UserController@delateExtra');
Route::post( 'app/add-tag', 'UserController@addTag');
Route::post( 'app/getServiceImage', 'UserController@getImage');
Route::post( 'app/getUserImage', 'UserController@getUserImage');
Route::post( 'app/saveServiceImage', 'UserController@saveImages');
Route::post( 'app/unlinkImage', 'UserController@unlinkImage');
Route::post( 'app/insertOrder', 'UserController@insertOrder');
Route::post( 'app/getslots', 'UserController@getslots');
Route::get( 'app/getNewList', 'UserController@getNewList');
Route::get( 'app/getServiceList/{id}', 'UserController@getServiceList'); 

Route::post( 'app/getBookingList', 'UserController@getBookingList');

Route::post( 'app/getAllBookingList', 'UserController@getAllBookingList');


Route::get( 'app/getProfileInfo/{id}', 'UserController@getProfileInfo');
Route::get( 'app/getCancleList/{date}', 'UserController@getCancleList');
Route::post( 'app/updateStatus', 'UserController@updateStatus');
Route::post( 'app/updateUserInfo', 'UserController@updateUserInfo');

// password Reset 
Route::post("/app/passwordresetGetEmail","UserController@passwordresetGetEmail");
Route::post("/app/resetPassword","UserController@resetPassword");
Route::post('/app/matchPasswordLink','UserController@matchPasswordLink');


// Review 
Route::post('app/giveReview','UserController@giveReview');



// Admin Routing
Route::get('system_admin','UserController@system_admin');
// Admin Routing
Route::get( 'app/getAllUserList', 'UserController@getAllUserList');
Route::post('app/updateUser','UserController@updateUser');
Route::post('app/deleteUser','UserController@deleteUser');
Route::post('app/deleteCategory','UserController@deleteCategory');
Route::post('app/deleteService','UserController@deleteService');
Route::post('app/updateService','UserController@updateService');
Route::post('app/categoryUpdate','UserController@categoryUpdate');
Route::get( 'app/getAllServiceList', 'UserController@getAllServiceList'); 


// job Edit 
Route::get( 'app/getServiceDescritption/{id}', 'UserController@getServiceDescritption'); 
Route::get( 'app/getServiceImages/{id}', 'UserController@getServiceImages'); 
Route::get( 'app/getExtraServicebyId/{id}', 'UserController@getExtraServicebyId'); 
Route::get( 'app/getTagbyId/{id}', 'UserController@getTagbyId'); 
Route::post( 'app/UpdateServiceDescription', 'UserController@UpdateServiceDescription'); 
Route::post( 'app/updateSaveServiceImage', 'UserController@updateSaveServiceImage'); 
Route::post( 'app/UpdateExtraServices', 'UserController@UpdateExtraServices'); 
Route::post( 'app/deleteExtraServices', 'UserController@deleteExtraServices'); 
Route::post( 'app/deleteTagService', 'UserController@deleteTagService'); 
Route::post( 'app/updateTag', 'UserController@updateTag'); 


// insert catagory 
Route::post( 'app/insert-catagory', 'UserController@insertCatagory'); 



Route::get('/logout', function () {
    Auth::logout();
    Session::flush();
    return redirect("/");
});

Route::any('{slug}', 'UserController@home')->where('slug', '([A-z\d-\/_.]+)?');
// // spa routes...
// Route::any('{slug}', function(){
   
    
// })->where('slug', '([A-z\d-\/_.]+)?');

