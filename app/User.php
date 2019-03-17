<?php

namespace App;
use DB;
use Illuminate\Notifications\Notifiable;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'userName', 'email', 'userType','password', 'name'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    public function reviews(){
        return $this->hasMany('App\Review','seller_id');
    }

    public function avgreview(){
        return $this->hasOne('App\Review','seller_id')
                    ->select("id", 'seller_id', DB::raw( 'cast(AVG(rating) as decimal(10,2)) AS averageRating'))
                    ->groupBy('seller_id');
    }

}
