class MapsController < ApplicationController
  before_action :set_world, only: [:index, :new, :create]

  def index
    ind = Map.all.where(world_id: params[:world_id])
    maps = []
    ind.each do |map|
      maps.push(map.attributes)
    end
    @map_hash = { maps: maps }
    @cards = Card.where(world_id: params[:world_id])
    # if params[:states].present?
    #   tags = params[:states]
    #   @cards = Card.tag_search(tags)
    # end
    @tags = {tag: @world.tags.map { |e| e.name }}
  end

  def show
  end

  def new
    @map = Map.new()
  end

  def create
    @map = Map.new(map_params)
    @map.world_id = @world.id
    @map.save
    redirect_to world_maps_path
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_world
    @world = World.find(params[:world_id])
  end

  def map_params
    params.require(:map).permit(:title, :photo)
  end
end
