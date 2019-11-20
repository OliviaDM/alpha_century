class TimelinksController < ApplicationController
  def create
    args = JSON.parse(params[:timelink])

    @timelink = Timelink.new(parent_event_id: args["from"], child_event_id: args["to"])
    @timelink.save
    render json: @timelink
  end

  def destroy
    args = JSON.parse(params[:timelink])
    find_timelink = Timelink.find_by(parent_event_id: args["from"], child_event_id: args["to"])
    if find_timelink
      @timelink = find_timelink.destroy
    else
      @timelink = nil
    end
    render json: @timelink
  end
end
