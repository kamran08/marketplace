<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $fillable =[
        
    ];
        public function image(){
            return $this->hasMany('App\Image', 'service_id');
         }
        public function users(){
            return $this->belongsTo('App\User', 'user_id');
         }
        public function cats(){
            return $this->belongsTo('App\Cat', 'cat_id');
         }
}
