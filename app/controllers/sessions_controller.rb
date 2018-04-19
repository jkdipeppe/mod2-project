class SessionsController < ApplicationController

  def new
  end

  def create
    @band = Band.find_by(
      username: params[:username])
      .try(:authenticate, params[:password])
    @guest = Guest.find_by(
      username: params[:username])
      .try(:authenticate, params[:password])
    # binding.pry
    if @band
      session[:user] = @band
      redirect_to band_path(@band)
    elsif @guest
      session[:user] = @guest
      redirect_to guest_path(@guest)
    else
      @not_valid = true
      render :new
    end
  end

  def logout
    session[:user] = nil
    redirect_to sessions_new_path
  end

end
