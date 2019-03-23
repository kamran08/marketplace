<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    //
    protected $fillable =[ 
        'notifor', 'notifrom', 'notitxt', 'url'
    ];
    public function user(){
        return $this->belongsTo('App\User','notifrom', 'id');
    }
}
