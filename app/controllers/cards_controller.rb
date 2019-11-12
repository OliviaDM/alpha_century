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
    @card.update(card_params)
    raise
    p "YIPEE"
    redirect_to card_path(@card.id)
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
