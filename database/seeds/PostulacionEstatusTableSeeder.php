<?php

use Illuminate\Database\Seeder;

class PostulacionEstatusTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       App\Models\PostulacionEstatus::create(['id' =>1,'descripcion' => 'PENDIENTE' ]);
	   App\Models\PostulacionEstatus::create(['id' =>2,'descripcion' => 'ACEPTADA' ]);
	   App\Models\PostulacionEstatus::create(['id' =>3,'descripcion' => 'RECHAZADA' ]);
    }
}
