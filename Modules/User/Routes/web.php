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
Route::get( '/app/get-all-catgory-by-search/{key}', 'UserController@getInfoBySearch');

//Route::get( '/app/get-all-catgory-by-search-catagory/{key}', 'UserController@getInfoBySearchCatagory');



Route::post('app/login', 'UserController@login');
Route::post('app/register', 'UserController@register');
Route::post( 'app/upload-avater', 'UserController@upload');


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

