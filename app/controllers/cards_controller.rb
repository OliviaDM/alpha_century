class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.where(world_id: params[:world_id])
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.world_id = params[:world_id]
    @card.save
  end

  def edit
    @card = Card.find(params[:id])
    @world = @card.world
  end

  def update
    @card.update(card_params)
    redirect_to world_cards_path(world_id: @card.world.id)
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
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title, :content)
  end
end
