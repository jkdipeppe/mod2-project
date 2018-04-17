class TicketsController < ApplicationController

  def new
    # binding.pry
    @show = Show.find(params[:show_id])
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new

    if params[:ticket][:ticket_type].include?('VIP')
      @ticket.price = params[:show][:price].to_i*1.5
      @ticket.ticket_type = 'VIP'
    else
      @ticket.price = params[:show][:price]
      @ticket.ticket_type = 'General Admission'
    end

    @ticket.show_id = params[:show][:show_id]

    # @ticket.save
    # redirect_to guest_path()
    binding.pry
    #add guest_id
  end

  def show
  end

end
