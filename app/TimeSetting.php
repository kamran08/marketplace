<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TimeSetting extends Model
{
    //
    protected $fillable =[
        'service_id','day', 'startTime', 'endTime', 'duration' 
    ];
}
