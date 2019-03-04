<?php

use Illuminate\Database\Seeder;

class TimeSettingsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
          DB::table('timesSettings')->insert([
            'user_id' => '1',
            'startTime' => '10',
            'endTime' => '12',
            'intervel' => '30',
            'weekDay' => 'Saturday',
           
        ]);
          DB::table('timesSettings')->insert([
            'user_id' => '2',
            'startTime' => '10',
            'endTime' => '12',
            'intervel' => '30',
            'weekDay' => 'sunday',
           
        ]);
          DB::table('timesSettings')->insert([
            'user_id' => '3',
            'startTime' => '10',
            'endTime' => '12',
            'intervel' => '30',
            'weekDay' => 'monday',
           
        ]);
          DB::table('timesSettings')->insert([
            'user_id' => '4',
            'startTime' => '10',
            'endTime' => '12',
            'intervel' => '30',
            'weekDay' => 'tuesday',
           
        ]);
          DB::table('timesSettings')->insert([
            'user_id' => '5',
            'startTime' => '10',
            'endTime' => '12',
            'intervel' => '30',
            'weekDay' => 'thrusday',
           
        ]);
          DB::table('timesSettings')->insert([
            'user_id' => '6',
            'startTime' => '10',
            'endTime' => '12',
            'intervel' => '30',
            'weekDay' => 'friday',
           
        ]);
          DB::table('timesSettings')->insert([
            'user_id' => '2',
            'startTime' => '10',
            'endTime' => '12',
            'intervel' => '30',
            'weekDay' => 'friday',
           
        ]);
          DB::table('timesSettings')->insert([
            'user_id' => '4',
            'startTime' => '10',
            'endTime' => '12',
            'intervel' => '30',
            'weekDay' => 'thursday',
           
        ]);
         
    }
    
}
