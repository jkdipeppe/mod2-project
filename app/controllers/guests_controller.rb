class GuestsController < ApplicationController
  before_action :set_guest, only: [:show]

  def show
  end



  def login
  end

  private

  def set_guest
    @guest = Guest.find(params[:id])
  end
end