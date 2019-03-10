<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    protected $fillable =[
        'service_id','imageUrl'
        
    ];
    // public function services(){
    //     return $this->belongsTo('App\Service');
    // }
    
}
