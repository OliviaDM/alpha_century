class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]
  before_action :set_world, only: [:index, :show, :new, :edit, :update]

  def index
    @world = World.find(params[:world_id])
    @cards = Card.where(world_id: params[:world_id])
    if params[:states].present?
      tags = params[:states]
      @cards = Card.tag_search(tags)
    end
    @tags = {tag: @world.tags.map { |e| e.name }}
    check_permission(@world)
  end

  def show
  end

  def new
    @card = Card.new()
    check_permission(@world)
  end

  def create
    @world = World.find(params[:world_id])
    @card = Card.new(card_params)
    @card.world_id = params[:world_id]
    @card.content = " " if @card.content.nil?
    @card.save
    check_permission(@world)
    redirect_to edit_world_card_path(world_id: @card.world.id, id: @card.id)
  end

  def edit
    @card = Card.find(params[:id])
    @tagging = Tagging.new()
    check_permission(@world)
  end

  def update
    @card.update(card_params)
    check_permission(@world)
    redirect_to edit_world_card_path(world_id: @card.world.id, id: @card.id)
  end

  def destroy
    @world = World.find(params[:world_id])
    @card.destroy
    check_permission(@world)
    redirect_to world_cards_path(params[:world_id])
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def set_world
    @world = World.find(params[:world_id])
  end

  def card_params
    params.require(:card).permit(:title, :content, :is_event)
  end
end
