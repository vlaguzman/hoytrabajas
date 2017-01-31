<?php

use Illuminate\Database\Seeder;

class GenerosTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\Models\Genero::create(['id' =>1,'descripcion' => 'Femenino' ]);
		App\Models\Genero::create(['id' =>2,'descripcion' => 'Masculino' ]);
    }
}
