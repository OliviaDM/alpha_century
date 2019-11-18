class CoordinatesController < ApplicationController
  def index
    hello = JSON.parse(params[:coordinates])
    array_of_id = hello["card_ids"].split(",")
    @array_of_coordinates = []
    array_of_id.each do |id|
      if Coordinate.find_by(map_id: hello["map_id"].to_i, card_id: id.to_i)
        @array_of_coordinates << Coordinate.find_by(map_id: hello["map_id"].to_i, card_id: id.to_i)
      end
    end
    render json: @array_of_coordinates
  end

  def new
  end

  def create
    hello = JSON.parse(params[:coordinates])
    marker = Coordinate.find_by(map_id: hello["map_id"].to_i, card_id: hello["card_id"].to_i)
    if marker
      @coordinate = Coordinate.update(hello)
    else
      @coordinate = Coordinate.new(hello)
      @coordinate.save
    end
    render json: @coordinate
  end

  def update
  end

  def destroy
    hello = JSON.parse(params[:coordinates])
    marker = Coordinate.find_by(map_id: hello["map_id"].to_i, card_id: hello["card_id"].to_i)
    marker.destroy
  end

  private

  def coordinate_params
    params.require(:coordinate).permit(:map_id, :card_id, :lat, :long)
  end
end
