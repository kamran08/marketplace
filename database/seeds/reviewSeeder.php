<?php

use Illuminate\Database\Seeder;

class reviewSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('reviews')->insert([
            'rating' => 4,
            'reviewMassege' => 'this is very good service',
            'srvice_id' =>1,
            'buyer_id' =>1,
            'seller_id' =>2,
        ]);
        DB::table('reviews')->insert([
            'rating' => 4,
            'reviewMassege' => 'this is very good service',
            'srvice_id' =>2,
            'buyer_id' =>2,
            'seller_id' =>3,
        ]);
        DB::table('reviews')->insert([
            'rating' => 5,
            'reviewMassege' => 'this is very good service',
            'srvice_id' =>3,
            'buyer_id' =>1,
            'seller_id' =>2,
        ]);
        DB::table('reviews')->insert([
            'rating' => 4,
            'reviewMassege' => 'this is very good service',
            'srvice_id' =>4,
            'buyer_id' =>3,
            'seller_id' =>4,
        ]);
        DB::table('reviews')->insert([
            'rating' => 4,
            'reviewMassege' => 'this is very good service',
            'srvice_id' =>1,
            'buyer_id' =>1,
            'seller_id' =>2,
        ]);
        DB::table('reviews')->insert([
            'rating' => 4,
            'reviewMassege' => 'this is very good service',
            'srvice_id' =>1,
            'buyer_id' =>1,
            'seller_id' =>2,
        ]);
        DB::table('reviews')->insert([
            'rating' => 4,
            'reviewMassege' => 'this is very good service',
            'srvice_id' =>1,
            'buyer_id' =>1,
            'seller_id' =>2,
        ]);
    }
}
