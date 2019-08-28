class Users::ProfilesController < ApplicationController
  
  def index
    @profile = Profile.new
  end

  def show

  end
  

  #GET /profiles/new 
  def new
    @profile = Profile.new
  end

end
