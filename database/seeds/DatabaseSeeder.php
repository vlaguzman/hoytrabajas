<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
		$this->call(GenerosTableSeeder::class);
		$this->call(PostulacionEstatusTableSeeder::class);
		$this->call(PerfilesTableSeeder::class);
		$this->call(UsersTableSeeder::class);
		$this->call(AdministradoresTableSeeder::class);
    }
}
