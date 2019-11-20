class WorldsController < ApplicationController
  before_action :set_world, only: [:edit, :update, :destroy]

  def index
    @worlds = World.where(user_id: current_user.id)
  end

  def new
    @world = World.new
    check_permission(@world)
  end

  def create
    @world = World.new(world_params)
    @world.user_id = current_user.id
    if @world.save
      check_permission(@world)
      redirect_to world_cards_path(world_id: @world.id)
    else
      redirect_to new_world_path
    end
  end

  def edit
  end

  def update
    @world.update(world_params)
    check_permission(@world)
    redirect_to worlds_path
  end

  def destroy
    @world.destroy
    check_permission(@world)
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
