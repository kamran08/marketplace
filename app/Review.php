<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Review extends Model
{
       
    protected $fillable =[
        'service_id','buyer_id','seller_id','rating','comment','booking_id','type'
    ];
    public function user(){
         return $this->belongsTo('App\User','seller_id', 'id');
    }
    public function suser(){
         return $this->belongsTo('App\User','seller_id', 'id');
    }
}
