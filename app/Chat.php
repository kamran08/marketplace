<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Chat extends Model
{
    protected $fillable  = [
        'msg_sender','con_id','msg','seen'
    ];

    public function sender(){
        return $this->belongsTo('App\User','msg_sender')->select('id','name','created_at');
    }
}
