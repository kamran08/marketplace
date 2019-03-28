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

Route::prefix('chart')->group(function() {
    Route::get('/', 'ChartController@index');
});

Route::get('app/get-chat-listing/{id}','ChartController@getChatListing');
Route::get('/app/get-chat/{id}','ChartController@chatHistory');
Route::post('/app/insert-chat','ChartController@createChat');
Route::post('/app/delete-msg','ChartController@createChat');

Route::post('/app/update-seen','ChartController@updateSeen');