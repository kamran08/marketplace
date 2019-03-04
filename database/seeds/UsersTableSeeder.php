<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('users')->insert([
            'userName' => 'salman',
            'email' => 'salman@gmail.com',
            'password' => bcrypt('123456'),
            'userType' => 1,
        ]);
        DB::table('users')->insert([
            'userName' => 'kamran',
            'email' => 'kamran@gmail.com',
            'password' => bcrypt('123456'),
            'userType' => 1,
        ]);
    }
}
