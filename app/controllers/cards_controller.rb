class CardsController < ApplicationController
  def index
    @cards = Card.all
  end

  def show
  end

  def new
  end

  def create
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
end
