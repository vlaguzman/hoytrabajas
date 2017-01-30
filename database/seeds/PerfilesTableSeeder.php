<?php

use Illuminate\Database\Seeder;

class PerfilesTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
       App\Models\Perfil::create(['id' =>0,'descripcion' => 'SOLICITUD' ]);
	   App\Models\Perfil::create(['id' =>1,'descripcion' => 'ADMINISTRADOR' ]);
	   App\Models\Perfil::create(['id' =>2,'descripcion' => 'EMPLEADOR' ]);
	   App\Models\Perfil::create(['id' =>3,'descripcion' => 'CANDIDATO' ]);
    }
}
