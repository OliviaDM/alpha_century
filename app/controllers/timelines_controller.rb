class TimelinesController < ApplicationController
  def index
    @hash = Timeline.new(["selected events"]).json_ify
  end
end
