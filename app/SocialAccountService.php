<?php
namespace App;
use Laravel\Socialite\Contracts\User as ProviderUser;
use Illuminate\Support\Facades\Mail;
use App\Mail\WelcomeMail;
class SocialAccountService{
    public function procesarFb(ProviderUser $providerUser){
        $account = SocialAccount::whereProvider('facebook')->whereProviderUserId($providerUser->getId())->first();
		$id_=$providerUser->getId();
		$url_p='https://graph.facebook.com/'. $id_ .'/picture?type=large';
		$url_perfil= $this->guardar_imagen($id_,$url_p); 
		return guardar_datos($providerUser,$account,$url_perfil,'facebook','web-facebook' );
    }
	public function procesarGp(ProviderUser $providerUser){
		 $account = SocialAccount::whereProvider('google')->whereProviderUserId($providerUser->getId())->first();
		 $id_= $providerUser->getId();
		 $url_p = preg_replace('/\?sz=[\d]*$/', '', $providerUser->avatar);
		 $url_perfil = $this->guardar_imagen($id_,$url_p);
		return guardar_datos($providerUser,$account,$url_perfil,'google','web-googlep' );  
	}
	private function guardar_datos(ProviderUser $providerUser,$account,$url_perfil,$prov_,$origen ){
		$id_=$providerUser->getId();
	    if ($account) {
			    $user = User::whereEmail($providerUser->getEmail())->first();
			    if ($user) {
			        $user->url_imagen= $url_perfil;
                    $user->save();
			    }
            return $account->user;
        }else{
            $user = User::whereEmail($providerUser->getEmail())->first();
            if (!$user) {
                $user = User::create([
                    'email' => $providerUser->getEmail(),
                    'name' => $providerUser->getName(),
				    'password' => bcrypt($id_),
					'perfil_id' => 0,
					'activo'=>0,
					'origen'=> $origen,
					'push_token'=>'',
					'url_imagen' => $url_perfil,
                ]);
                SocialAccount::create([
                    'provider_user_id' => $id_,
                    'provider' => $prov_,
                    'user_id'=> $user->id
                ]);
            }else{
				$user->name= $providerUser->getName();
				$user->url_imagen= $url_perfil;
				$user->save();
			}
            return $user;
        } 
	}
	private function guardar_imagen($id,$url){
		$file=asset('/images/system_imgs/no-picture.jpg');
		$arrContextOptions=array(
			"ssl"=>array(
				"verify_peer"=>false,
				"verify_peer_name"=>false,
			),
	    );
		$img =file_get_contents($url, false, stream_context_create($arrContextOptions));
		$img_local="";
		if($img!=""){
			$img_local='/images/system_imgs/usuarios/puser_' . $id .'.jpg';
			$file =public_path().$img_local;
			file_put_contents($file, $img);
			$file =asset($img_local);
		}
		return $file;
	}
}
