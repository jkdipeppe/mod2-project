class GuestsController < ApplicationController
  before_action :logged_in, only: [:new]
  before_action :set_guest, only: [:show, :analytics]
  before_action :correct_user, only: [:analytics]

  def show
  end

  def analytics
  end

  def new
    @guest = Guest.new
  end
  def create
    # binding.pry
    @guest = Guest.new(guest_params)
    if @guest.valid?
      @guest.save
      redirect_to guest_path(@guest.id)
    else
      render :new
    end
  end






  private

  def set_guest
    @guest = Guest.find(params[:id])
  end

  def guest_params
    params.require(:guest).permit(:name,:age,:location,:picture,:username,:password_digest)
  end

  def correct_user
    @guest = Guest.find(params[:id])
    if session[:user] == nil
      redirect_to sessions_new_path
    elsif session[:user]["username"] != @guest.username
      redirect_to sessions_new_path
    end
  end

  def logged_in
    if session[:user] != nil
      if session[:user]["bandmates"]
        @signed_in = true
        redirect_to band_path(session[:user]["id"])
      else
        @signed_in = true
        redirect_to guest_path(session[:user]["id"])
      end
    end
  end

end
