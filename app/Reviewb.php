<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Reviewb extends Model
{
    protected $fillable =[
        'service_id','buyer_id','seller_id','rating','comment','booking_id',
    ];
    public function user(){
         return $this->belongsTo('App\User','seller_id', 'id');
    }
  
}
