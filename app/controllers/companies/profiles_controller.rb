class Companies::ProfilesController < ApplicationController

  def show
    if company_signed_in?
      puts "good" 
    else
      redirect_to 
    end
  end

end
