class TaggingsController < ApplicationController

  def create
    tagname = params[:other][:name].strip.downcase
    tag = Tag.find_by(name: tagname)
    if tag
      tagging = Tagging.create!(tag_id: tag.id, card_id: params[:card_id])
    else
      tag = Tag.create!(world_id: params[:world_id], name: tagname)
      tagging = Tagging.create!(tag_id: tag.id, card_id: params[:card_id])
    end
    redirect_to edit_world_card_path(world_id: params[:world_id], id: params[:card_id])
  end

  def destroy
  end
end
