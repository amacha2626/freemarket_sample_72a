class ProfilesController < ApplicationController
  
  def new
  end
  
  def create
  end

  def show
    @profile = Profile.find(params[:id])
  end
  
end