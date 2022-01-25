class TicketsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_train, only: %i[create new]
  before_action :set_ticket, only: %i[show destroy]

  def new
    @ticket = @train.tickets.build
  end

  def index
    @tickets = current_user.tickets
  end

  def show
  end

  def create
    @ticket = @train.tickets.new(ticket_params)
    @ticket.user = current_user
    if @ticket.save
      redirect_to train_ticket_path(@train, @ticket)
    else
      #render :new
      redirect_to new_train_ticket_path(@train)
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
  end

  private

  def set_train
    begin
    @train = Train.find(params[:train_id])
    rescue
      redirect_to tickets_path
    end


  end

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_name, :last_name, :passport_number, :first_station_id, :last_station_id)
  end
end
