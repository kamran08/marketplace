<?php

use Illuminate\Database\Seeder;

class JobCatagorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('cats')->insert([
            'catName' => 'pedicure',
            'image' => 'uploads/cat1.svg',
        ]);
        DB::table('cats')->insert([
            'catName' => 'facials',
            'image' => 'uploads/deck-chair.svg',
        ]);
        DB::table('cats')->insert([
            'catName' => 'hair',
            'image' => 'uploads/female-hair-shape-and-face-silhouette.svg',
        ]);
        DB::table('cats')->insert([
            'catName' => 'make-up',
            'image' => 'uploads/make-up.svg',
        ]);
        DB::table('cats')->insert([
            'catName' => 'manicure',
            'image' => 'uploads/manicure.svg',
        ]);
        DB::table('cats')->insert([
            'catName' => 'wax',
            'image' => 'uploads/wax.svg',
        ]);

    }
}