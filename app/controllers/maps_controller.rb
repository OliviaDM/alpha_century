class MapsController < ApplicationController
  def index
    ind = Map.all.where(world_id: params[:world_id])
    maps = []
    ind.each do |map|
      maps.push(map.attributes)
    end
    @map_hash = { maps: maps }
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
