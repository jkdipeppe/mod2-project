class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def homepage
    @shows = Show.all
  end

  # def self.band_logged_in?
  #   if session
  #     true
  #   end
  # end
  #
  # def self.guest_logged_in?
  #   return true if session
  # end
end
