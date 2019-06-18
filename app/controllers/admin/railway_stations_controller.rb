class Admin::RailwayStationsController < Admin::BaseController
  before_action :set_railway_station, only: [:show, :edit, :update, :destroy, :update_position]

  def index
    @railway_stations = RailwayStation.all
  end

  def show
    redirect_to action: :index
  end

  def new
    @railway_station = RailwayStation.new
    render :station
  end

  def edit
    render :station
  end

  def create
    @railway_station = RailwayStation.new(railway_station_params)

    if @railway_station.save
      redirect_to action: :index
    else
      render :station
    end
  end

  def update
    if @railway_station.update(railway_station_params)
      redirect_to action: :index
    else
      render :edit
    end
  end

  def destroy
    @railway_station.destroy
    redirect_to action: :index
  end

  def update_position
    @route = Route.find(params[:route_id])
    @railway_station.update_position(@route, params[:position])
    redirect_to @route
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_railway_station
    @railway_station = RailwayStation.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def railway_station_params
    params.require(:railway_station).permit(:title)
  end
end
