class ProfilesController < ApplicationController
  
  def create
  end

  def show
    @profile = Profile.find(params[:id])
  end
  
end