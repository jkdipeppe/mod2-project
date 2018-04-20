class TicketsController < ApplicationController
  before_action :require_guest_login, only: [:new, :create, :delete]
  # before_action :capacity_not_reached, only: [:create]

  def new
    # binding.pry
    @show = Show.find(params[:show_id])
    @ticket = Ticket.new
  end

  def create
    @ticket = Ticket.new()
    if params[:ticket][:ticket_type].include?('VIP')
      @ticket.price = params[:show][:price].to_i*1.5
      @ticket.ticket_type = 'VIP'
    else
      @ticket.price = params[:show][:price]
      @ticket.ticket_type = 'General Admission'
    end
    @ticket.guest_id = session[:user]["id"].to_i
    @ticket.show_id = params[:show][:show_id]
    # binding.pry
    if @ticket.valid?
      @ticket.save
      redirect_to guest_path(session[:user]["id"].to_i)
    else
      binding.pry

      render :new
    end
    # binding.pry

  end

  def destroy
    @ticket = Ticket.find(params[:id])
    @ticket.destroy
    redirect_to guest_path(session[:user]["id"].to_i)
  end

  # def show
  # end

  private

  # def capacity_not_reached
  #   binding.pry
  #
  # end

  def require_guest_login
    if session[:user] != nil
      if session[:user]["age"]
        true
      else
        redirect_to sessions_new_path
      end
    else
      redirect_to sessions_new_path
    end
  end

end
