<?php
namespace App\Classes;
use Modules\User\Query\UserQuery;

class CommonClass {
    protected $query;
    public function __construct(UserQuery $query)
    {
        $this->query = $query;
    }
    public function testing(){
        \Log::info('Testing is correct');
    }
    public function insertNotifications($notifor, $notifrom,$notitxt, $url){
            $ndata = [
                'notifor' => $notifor,
                'notifrom' => $notifrom,
                'notitxt' => $notitxt,
                'url' => $url,
            ];
            $this->query->notifications($ndata);

    }
}

