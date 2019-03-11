<?php

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

//Route::get( '/app/get-all-catgory-by-search/{key}', 'UserController@getInfoBySearchCatagory');



Route::post('app/login', 'UserController@login');
Route::post('app/register', 'UserController@register');
Route::post( 'app/upload-avater', 'UserController@upload');
Route::post( 'app/insert-all-services', 'UserController@insertService');
Route::post( 'app/add-extra-services', 'UserController@addExtra');
Route::post( 'app/delate-extra', 'UserController@delateExtra');
Route::post( 'app/add-tag', 'UserController@addTag');
Route::post( 'app/getServiceImage', 'UserController@getImage');
Route::post( 'app/saveServiceImage', 'UserController@saveImages');
Route::post( 'app/unlinkImage', 'UserController@unlinkImage');
Route::post( 'app/insertOrder', 'UserController@insertOrder');
Route::get( 'app/getslots/{date}', 'UserController@getslots');
Route::get( 'app/getNewList', 'UserController@getNewList');
Route::post( 'app/updateStatus', 'UserController@updateStatus');


// Route::get('app/ok', 'UserController@register');


Route::get('/logout', function () {
    Auth::logout();
    Session::flush();
    return redirect("/");
});


// spa routes...
Route::any('{slug}', function(){
    return view('welcome');
})->where('slug', '([A-z\d-\/_.]+)?');

