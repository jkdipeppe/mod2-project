class BandsController < ApplicationController
  before_action :logged_in, only: [:new, :analytics]
  before_action :set_band, only: [:show, :analytics]
  before_action :correct_user, only: [:analytics]


  def index
    @bands = Band.all
  end

  def show
  end

  def analytics
  end


  def new
    @band = Band.new
  end

  def create
    # binding.pry
    @band = Band.new(band_params)
    if @band.valid?
      @band.save
      redirect_to band_path(@band.id)
    else
      render :new
    end
  end








  private

  def set_band
    @band = Band.find(params[:id])
  end

  def band_params
    params.require(:band).permit(:name, :genre, :bandmates, :bio, :picture, :username, :password_digest)
  end

  def correct_user
    @band = Band.find(params[:id])
    if session[:user] == nil
      redirect_to sessions_new_path
    elsif session[:user]["username"] != @band.username
      redirect_to sessions_new_path
    end
  end

  def logged_in
    if session[:user] != nil
      if session[:user]["bandmates"]
        @signed_in = true
        # render
      else
        @signed_in = true
        redirect_to guest_path(session[:user]["id"])
      end
    end
  end


end
