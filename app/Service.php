<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    protected $fillable =[
        'title','user_id', 'cat_id', 'price', 'videoLink', 'description', 
        'openingMassage'
    ];
        public function image(){
            return $this->hasMany('App\Image', 'service_id');
         }
        public function user(){
            return $this->belongsTo('App\User', 'user_id');
         }
        public function category(){
            return $this->belongsTo('App\Category','cat_id');
         }
        public function extra(){
            return $this->hasMany('App\Extra','service_id');
         }
        public function tag(){
            return $this->hasMany('App\Tag','service_id');
         }
        public function alltime(){
            return $this->belongsTo('App\TimeSetting','id','service_id');
         }
}
