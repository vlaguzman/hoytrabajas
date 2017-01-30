<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        App\User::create([ 
                'email' => 'admin@correo.com',
                'name' => 'System Administrator',
                'password' =>  bcrypt('1234567'),
                'perfil_id' =>1,
                'activo' =>1,
                'push_token'=>'',
                'url_imagen' => asset('/images/no-picture.jpg'),
        ]);
    }
}
