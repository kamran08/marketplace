<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

class TestController extends Controller
{
    public function register(Request $request){
    
        $this->validate($request, [
            'email' => 'required|string|max:255|email|unique:users',
        ]);
        \Log::info($request);
        // $data = $this->validateUserRequest($request);
    }
}
