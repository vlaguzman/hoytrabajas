class Users::ProfilesController < ApplicationController
  def show
  end
  

  #GET /profiles/new 
  def new
    @profile = Profile.new
  end

end
