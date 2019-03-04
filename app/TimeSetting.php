<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TimeSetting extends Model
{
    //
    protected $fillable =[
        'user_id', 'startTime', 'endTime', 'intervel',  'weekDay' 
    ];
}
