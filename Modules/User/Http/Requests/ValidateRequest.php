<?php 
namespace Modules\User\Http\Requests;


use Illuminate\Http\Request;
use Illuminate\Validation\Validator;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Fascades\DB;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use App\Http\Controllers\Controller;


class ValidateRequest extends Controller
{


    public function validateUserRequest($request){
        
    $this->validate($request, [
            'userName' => 'required|string|max:255',
            'email' => 'required|string|max:255|email|unique:users',
            'password' => 'required|string|min:6',
        ]);
         return true;
   }
}