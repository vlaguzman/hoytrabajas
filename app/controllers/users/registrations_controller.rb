# frozen_string_literal: true
class Users::RegistrationsController < Devise::RegistrationsController
  puts "hola estoy en el user::registrations"*100
  protected

  def after_inactive_sign_up_path_for(resource)
    puts "estoy en el after "*100
    puts reseource.email
    puts "/"*100
    if resource.email eq("gabriel.meneses@hoytrabajas.com")
      puts "@"*100
      active_for_authentication?
      users_wizards_step_zero_path
    else
      puts "#"*100
      users_wizards_step_zero_path
    end
  end

end
