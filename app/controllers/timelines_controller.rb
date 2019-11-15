class TimelinesController < ApplicationController
  def index
    @world = World.find(params[:world_id])
    @tags = {tag: @world.tags.map { |e| e.name }}
    @hash = Timeline.new(params[:states]).json_ify
  end
end
