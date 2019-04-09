<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Contracts\Queue\ShouldQueue;

class Accountactivation extends Mailable
{
    use Queueable, SerializesModels;

    public $data;
    public function __construct($option)
    {
        $this->data = $option;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->subject('Verify email')
        ->from('noreply@ms4.co','Email Verification')
        ->view('emails.verification');
    }
}
