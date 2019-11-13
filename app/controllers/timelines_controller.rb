class TimelinesController < ApplicationController
  def index
    @string = "hohohohoh"
    @events = Card.events_tag_search(["jabba"])
  end
end
