class WorldsController < ApplicationController
  before_action :set_world, only: [:edit, :update, :destroy]

  def index
    @worlds = World.all
  end

  def new
    @world = World.new
  end

  def create
    @world = World.new(world_params)
  end

  def edit
  end

  def update
  end

  def destroy
    @world.destroy
    redirect_to worlds_path
  end

  private

  def set_world
    @world = World.find(params[:id])
  end

  def world_params
    params.require(:world).permit(:name, :description, :image)
  end
end
