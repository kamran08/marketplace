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
        DB::table('categories')->insert([
            'catName' => 'pedicure',
            'image' => 'uploads/cat1.svg',
        ]);
        DB::table('categories')->insert([
            'catName' => 'facials',
            'image' => 'uploads/deck-chair.svg',
        ]);
        DB::table('categories')->insert([
            'catName' => 'hair',
            'image' => 'uploads/female-hair-shape-and-face-silhouette.svg',
        ]);
        DB::table('categories')->insert([
            'catName' => 'make-up',
            'image' => 'uploads/make-up.svg',
        ]);
        DB::table('categories')->insert([
            'catName' => 'manicure',
            'image' => 'uploads/manicure.svg',
        ]);
        DB::table('categories')->insert([
            'catName' => 'wax',
            'image' => 'uploads/wax.svg',
        ]);

    }
}