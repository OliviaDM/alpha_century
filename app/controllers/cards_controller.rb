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
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.world_id = params[:world_id]
    @card.content = " " if @card.content.nil?
    @card.save
    redirect_to edit_world_card_path(world_id: @card.world.id, id: @card.id)
  end

  def edit
    @card = Card.find(params[:id])
    @tagging = Tagging.new()
  end

  def update
    @card.update(card_params)
    redirect_to world_cards_path(@world.id)
    # p @card = Card.find(params[:id])
    # if @card.save
    #   respond_to do |format|
    #     format.html { redirect_to card_path(@card.id) }
    #     format.js  # <-- will render `app/views/reviews/create.js.erb`
    #   end
    # else
    #   respond_to do |format|
    #     format.html { render 'cards/show' }
    #     format.js  # <-- idem
    #   end
    # end
  end

  def destroy
    @card.destroy
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
    params.require(:card).permit(:title, :content)
  end
end
