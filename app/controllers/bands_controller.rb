class BandsController < ApplicationController
  before_action :set_band, only: [:show]
  def show
  end




  private

  def set_band
    @band = Band.find(params[:id])
  end



end
