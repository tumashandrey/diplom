class TicketsController < ApplicationController
  # before_action :authenticate_user!, only: :create
  before_action :authenticate_user!
  before_action :set_ticket, only: [:destroy]

  def index
    @tickets = user_signed_in? && current_user.admin? ? Ticket.all : Ticket.user_tickets(user: current_user)
  end

  def new
    @ticket = Ticket.new(route_id: params[:route_id])
    render :ticket
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to action: :index
    else
      render :ticket
    end
  end

  def destroy
    @ticket.destroy
    redirect_to action: :index
  end

  private

  def ticket_params
    params.require(:ticket).permit(:route_id, :seats_type, :user_id)
  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

end
