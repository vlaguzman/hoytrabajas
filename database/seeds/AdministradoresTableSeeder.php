<?php

use Illuminate\Database\Seeder;

class AdministradoresTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\Models\Administrador::create([ 
                'nombres' => 'System',
                'apellidos' => 'Administrator',
                'telefono' =>  '0000000000',
				'correo' =>'admin@correo.com',
                'user_id' =>1,
        ]);
    }
}
