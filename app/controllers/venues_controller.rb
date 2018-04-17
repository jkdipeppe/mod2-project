class VenuesController < ApplicationController
  before_action :set_venue, only: [:show]

  def show
  end

  private

  def set_venue
    @venue = Venue.find(params[:id])
  end
end
