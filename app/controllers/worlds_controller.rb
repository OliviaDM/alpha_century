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
    @world.user_id = current_user.id
    if @world.save
      redirect_to world_cards_path(world_id: @world.id)
    else
      redirect_to new_world_path
    end
  end

  def edit
  end

  def update
    @world.update(world_params)
    redirect_to worlds_path
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
    params.require(:world).permit(:name, :description, :photo)
  end
end
