<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    //
    protected $fillable =[
        'buyer_id','service_id','totalPrice','extraPrice','bookingTime','bookingDate','extraService','seller_id'
     ];

     public function buyerInfo(){
         return $this->belongsTo('App\User','buyer_id');
     }
     public function sellerInfo(){
         return $this->belongsTo('App\User','seller_id');
     }
     public function service(){
         return $this->belongsTo('App\Service','service_id');
     }
     public function review(){
         return $this->belongsTo('App\Review','id','booking_id');
     }
     public function reviewb(){
         return $this->belongsTo('App\Reviewb','id','booking_id');
     }

    
}
