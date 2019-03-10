<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    //
    protected $fillable =[
        'buyer_id','service_id','totalPrice','extraPrice','bookingTime','bookingDate','extraService'
     ];

    
}
