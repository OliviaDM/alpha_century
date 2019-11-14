class TaggingsController < ApplicationController
  def create
    @world = World.find(params[:world_id])
    @card = Card.find(params[:card_id])
    tagname = params[:other][:name].strip.downcase
    tag = Tag.find_by(name: tagname)
    if tag
      @tagging = Tagging.new(tag_id: tag.id, card_id: params[:card_id])
      @tagging.save

    elsif !tagname.blank?
      tag = Tag.create!(world_id: params[:world_id], name: tagname)
      @tagging = Tagging.create!(tag_id: tag.id, card_id: params[:card_id])

    end

    @tagging = Tagging.create!(tag_id: params[:tagging][:tag_id], card_id: params[:card_id]) if params[:tagging].present? && params[:tagging][:tag_id].present?

    respond_to do |format|
      format.html { redirect_to edit_world_card_path(world_id: params[:world_id], id: params[:card_id]) }
      format.js
    end
  end

  def destroy
    @tagging = Tagging.find(params[:id])
    @tagging.destroy
    respond_to do |format|
      format.html { redirect_to edit_world_card_path(world_id: params[:world_id], id: params[:card_id]) }
      format.js
    end
  end
end
