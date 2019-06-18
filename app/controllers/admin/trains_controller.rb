class Admin::TrainsController < Admin::BaseController
  before_action :set_train, only: [:show, :edit, :update, :destroy, :update_trains_station]

  def index
    @trains = Train.all
  end

  def show
    @railway_stations_train = RailwayStationsTrain.new
    render :train_stations
  end

  def new
    @train = Train.new
    render :train
  end

  def create
    @train = Train.new(train_params)
    if @train.save
      redirect_to action: :show, id: @train.id
    else
      render :train
    end
  end

  def edit
    render :train
  end

  def update
    if @train.update(train_params)
      redirect_to action: :show, id: @train.id
    else
      render :train
    end
  end

  def destroy
    @train.destroy
    redirect_to action: :index
  end

  def update_trains_station
    @railway_stations_train = RailwayStationsTrain.find(railway_stations_train_params[:id])
    @railway_stations_train.update(railway_stations_train_params)
    render :train_stations
  end

  private

  def set_train
    @train = Train.find(params[:id])
  end

  def train_params
    params.require(:train).permit(:name, :train_type, :seat_capacity, :second_place_capacity, :coupe_capacity, railway_station_ids: [])
  end

  def railway_stations_train_params
    params.require(:railway_stations_train).permit(:id, :position, :time)
  end
end