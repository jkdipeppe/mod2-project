class ShowsController < ApplicationController
  before_action :set_show, only: [:show]
  def index
    @shows = Show.all
  end

  def show
  end

  def gaticket
    @test = 1
    binding.pry
    # Ticket.create(show_id: @show.id, guest_id: #need guest session data, price: @show.price, type: 'General Admission')
    # redirect_to guests_path(#need guestID )
  end

  def vipticket
    @test1 = 2
    binding.pry
    # Ticket.create(show_id: @show.id, guest_id: #need guest session data, price: @show.price*1.5, type: 'VIP')
    # redirect_to guests_path(#need guestID )
  end


  def new

  end
  def create
    
  end

  private

  def set_show
    @show = Show.find(params[:id])
  end
end
