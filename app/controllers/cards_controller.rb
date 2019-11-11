class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @cards = Card.search_by_tags(params[:query])
    else
      @cards = Card.all
    end
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user_id = current_user.id
    @card.is_map = false
    @card.save
  end

  def edit
    @card = Card.find(params[:id])
  end

  def update
    p @card = Card.find(params[:id])
    redirect_to edit_card_path(@card.id)
  end

  def destroy
  end

  private

  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:title)
  end
end
