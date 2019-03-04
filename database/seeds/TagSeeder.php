<?php

use Illuminate\Database\Seeder;

class TagSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('tags')->insert([
            'service_id' => '1',
            'tagName' => 'style',
           
        ]);
        DB::table('tags')->insert([
            'service_id' => '1',
            'tagName' => 'massage',
           
        ]);
        DB::table('tags')->insert([
            'service_id' => '2',
            'tagName' => 'motion',
           
        ]);
        DB::table('tags')->insert([
            'service_id' => '3',
            'tagName' => 'salon',
           
        ]);
        DB::table('tags')->insert([
            'service_id' => '4',
            'tagName' => 'notag',
           
        ]);
        DB::table('tags')->insert([
            'service_id' => '5',
            'tagName' => 'women',
           
        ]);
        DB::table('tags')->insert([
            'service_id' => '6',
            'tagName' => 'boys',
           
        ]);
    }
}
