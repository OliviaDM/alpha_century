class CoordinatesController < ApplicationController
  def new
  end

  def create
    puts 'hello let s check params'
    hello = JSON.parse(params[:coordinates])

    p @coordinate = Coordinate.new(hello)
    @coordinate.save
    p @coordinate
    render json: @coordinate
  end

  def update
  end

  def destroy
  end

  private

  def coordinate_params
    params.require(:coordinate).permit(:map_id, :card_id, :lat, :long)
  end
end
