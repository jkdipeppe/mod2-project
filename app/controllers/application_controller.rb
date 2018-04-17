class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def homepage
    @shows = Show.all
  end

  def login
    
  end
end
