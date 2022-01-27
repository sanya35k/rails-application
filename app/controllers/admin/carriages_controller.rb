class Admin::CarriagesController < Admin::BaseController
  before_action :set_carriage, only: %i[show edit update destroy]
  before_action :set_train, only: %i[new create]

  def index
    @carriages = Carriage.all
  end

  def show
  end

  def new
    @carriage = Carriage.new
  end

  def edit
  end

  def create
    @carriage = @train.carriages.new(carriage_params)
    if @carriage.save
      redirect_to admin_carriages_path(@carriage.becomes(Carriage))
    else
      render :new
    end
  end

  def update
    if @carriage.update(carriage_params)
      redirect_to admin_carriages_path
    else
      render :edit
    end
  end

  def destroy
    @carriage.destroy
    redirect_to admin_carriages_path
  end

  private

  def carriage_params
    params.require(:carriage).permit(:type, :top_seats, :bottom_seats, :sitting_seats, :side_top_seats, :side_bottom_seats, :train_id)
  end

  def set_carriage
    #@carriage = Carriage.find_by_id(params[:id])
    @carriage = Carriage.find(params[:id])
    #@carriage = Cart.create(:cart => params[:id])
  end

  def set_train
    @train = Train.find(params[:train_id])
  end
end
