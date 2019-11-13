class Timeline
  def initialize(tag_array)
    @events = Card.events_tag_search(tag_array)
    @links = Timelink.all
  end

  def json_ify
    events = @events.map { |ev| { name: ev.title, id: ev.id } }
    links = @links.map { |link| { source: @events.find_index(link.parent_event), target: @events.find_index(link.child_event) } }
    { nodes: events, edges: links }.to_json
  end

end
