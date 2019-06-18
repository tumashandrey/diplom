class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
    @routes = params[:routes_filter] ? Route.filtered(routes_filter) : Route.all
  end

  def show
    render :route
  end

  def new
    @route = Route.new
    render :route
  end

  def create
    train = Train.find(params[:train_id])
    @route = Route.new
    @route.train = train

    if @route.save
      redirect_to action: :index
    else
      render :route
    end
  end

  def edit
    render :route
  end

  def update
    if @route.update(route_params)
      redirect_to action: :index
    else
      render :route
    end
  end

  def destroy
    @route.destroy
    redirect_to action: :index
  end

  private

  def set_route
    @route = Route.find(params[:id])
  end

  def route_params
    params.require(:route).permit(:name, :seat_price, :second_place_price, :coupe_price)
  end

  def routes_filter
    params.require(:routes_filter).permit(:from, :to, :date)
  end
end