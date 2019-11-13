class TimelinesController < ApplicationController
  def index
    @string = "hohohohoh"
    @events = Card.events_tag_search(["selected events"])
    @hash = Timeline.new(["selected events"]).json_ify
  end
end
