<?php

use Illuminate\Database\Seeder;

class ServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('services')->insert([
            'title' => 'Unforgettable massage!!! And... Waxing!!!',
            'cat_id' => 1,
            'user_id' => 1,
            'price' => 200,
            'videoLink' => 'youtube.com',
            'description' => 'some description is requred',
            'openingMassage' => 'hello world',
            'daliveryTime' => '10:20',
            'isFeatured' => '1',
            'isComplete' => true,
        ]);
        DB::table('services')->insert([
            'title' => 'Unforgettable massage!!! And... Waxing!!!',
            'cat_id' => 2,
            'user_id' => 2,
            'price' => 200,
            'videoLink' => 'youtube.com',
            'description' => 'some description is requred',
            'openingMassage' => 'hello world',
            'daliveryTime' => '10:20',
            'isFeatured' => '1',
            'isComplete' => true,
        ]);
        DB::table('services')->insert([
            'title' => 'Unforgettable massage!!! And... Waxing!!!',
            'cat_id' => 3,
            'user_id' => 1,
            'price' => 200,
            'videoLink' => 'youtube.com',
            'description' => 'some description is requred',
            'openingMassage' => 'hello world',
            'daliveryTime' => '10:20',
            'isFeatured' => '1',
            'isComplete' => true,
        ]);
        DB::table('services')->insert([
            'title' => 'Unforgettable massage!!! And... Waxing!!!',
            'cat_id' => 4,
            'user_id' => 1,
            'price' => 200,
            'videoLink' => 'youtube.com',
            'description' => 'some description is requred',
            'openingMassage' => 'hello world',
            'daliveryTime' => '10:20',
            'isFeatured' => '1',
            'isComplete' => true,
        ]);
        DB::table('services')->insert([
            'title' => 'Unforgettable massage!!! And... Waxing!!!',
            'cat_id' => 1,
            'user_id' => 1,
            'price' => 200,
            'videoLink' => 'youtube.com',
            'description' => 'some description is requred',
            'openingMassage' => 'hello world',
            'daliveryTime' => '10:20',
            'isFeatured' => '0',
            'isComplete' => true,
        ]);
        DB::table('services')->insert([
            'title' => 'Unforgettable massage!!! And... Waxing!!!',
            'cat_id' => 2,
            'user_id' => 2,
            'price' => 200,
            'videoLink' => 'youtube.com',
            'description' => 'some description is requred',
            'openingMassage' => 'hello world',
            'daliveryTime' => '10:20',
            'isFeatured' => '0',
            'isComplete' => true,
        ]);
    }
}
