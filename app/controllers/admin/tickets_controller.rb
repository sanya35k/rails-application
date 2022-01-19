class Admin::TicketsController < Admin::BaseController
  before_action :set_train, only: %i[create new edit]
  before_action :set_ticket, only: %i[show edit update destroy]

  def index
    @tickets = Ticket.all
  end

  def show
  end

  def new
    @ticket = @train.tickets.build
  end

  def edit
  end

  def create
    @ticket = @train.tickets.new(ticket_params)

    @ticket.user = current_user
    if @ticket.save
      redirect_to train_ticket_path(@train, @ticket)
    else
      redirect_to new_train_ticket_path(@train)
    end
  end

  def update
    @ticket.update(ticket_params)
    redirect_to admin_tickets_path
  end

  def destroy
    @ticket.destroy
    redirect_to admin_tickets_path
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(:first_name, :last_name, :passport_number, :first_station_id, :last_station_id, :train_id)
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
