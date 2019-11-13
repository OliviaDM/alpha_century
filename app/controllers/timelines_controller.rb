class TimelinesController < ApplicationController
  def index
    @string = "hohohohoh"
    @events = Card.events_tag_search(["wonky timeline"])
    @hash = Timeline.new(["wonky timeline"]).json_ify
  end
end
