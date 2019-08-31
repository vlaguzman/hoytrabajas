class Users::ProfilesController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @user= current_user
  end

  def show
  end

  def create
  end

  #GET /users/profiles/new
  def new
    @user = User.new
  end

end
