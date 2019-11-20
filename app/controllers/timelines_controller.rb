class TimelinesController < ApplicationController
  def index
    @world = World.find(params[:world_id])
    @card = Card.new()
    @tags = {tag: @world.tags.map { |e| e.name }}
    @hash = Timeline.new(params[:states], @world).json_ify
  end
end
