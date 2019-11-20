class TimelinksController < ApplicationController
  def create
    args = JSON.parse(params[:timelink])

    @timelink = Timelink.new(parent_event_id: args["from"], child_event_id: args["to"])
    @timelink.save
    render json: @timelink
    # @result = { response: timelink.save }



    # marker = Coordinate.find_by(map_id: hello["map_id"].to_i, card_id: hello["card_id"].to_i)
    # if marker
    #   @coordinate = Coordinate.update(hello)
    # else
    #   @coordinate = Coordinate.new(hello)
    #   @coordinate.save
    # end
    # render json: @coordinate
  end
end
