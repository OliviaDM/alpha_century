class TimelinesController < ApplicationController
  def index
    @hash = Timeline.new(["wonky timeline"]).json_ify
  end
end
