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

class ContractController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }


    public function contractMessage(Request $request)
    {
        \Log::info($request);
    }

    
}
