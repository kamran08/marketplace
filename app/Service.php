<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $fillable =[
        'title','user_id', 'cat_id', 'price', 'videoLink', 'description', 
        'openingMassage', 'daliveryTime', 'isFeatured', 'isComplite'
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
