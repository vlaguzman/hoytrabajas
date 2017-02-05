<?php
namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use App\SocialAccountService;
use Socialite;
class SocialAuthController extends Controller
{
    public function redirectfb(){
        return Socialite::driver('facebook')->redirect();
    }
    public function redirectgp(){
        return Socialite::driver('google')->redirect();
    }
	public function callbackfb(SocialAccountService $service){
        $user = $service->procesarFb(Socialite::driver('facebook')->user());
        auth()->login($user);
        return redirect()->to('/home');
    }
    public function callbackgp(SocialAccountService $service){
        $user = $service->procesarGp(Socialite::driver('google')->user());
        auth()->login($user);
        return redirect()->to('/home');
    }

}