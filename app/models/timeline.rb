class Timeline
  def initialize(tag_array)
    @events = Card.events_tag_search(tag_array)
    @links = Timelink.all.map { |tl| { target: tl.child_event, source: tl.parent_event } }
  end

  def json_ify
    events = @events.map { |ev| { name: ev.title, id: ev.id } }
    links = @links.map { |link| { source: @events.find_index(link.parent_event), target: @events.find_index(link.child_event) } }
    { nodes: events, edges: links }.to_json
  end

  def relevent_links
    dummy_count = 0
    good_links = []
    start_links = @links

    until start_links.empty?
      edge = start_links.delete_at(0)

      unless (edge.source == edge.target)
        if @events.include?(edge.source) && @events.include?(edge.target)

          good_links.push(timelink_to_edge(edge))

        elsif @event.include?(edge.source)

          new_children = start_links.select { |e| e.source == edge.target }
          new_edges = new_children.map { |e| { source: edge.source, target: e.target } }
          start_links = start_links.reject { |e| e.source == edge.target } + new_edges

        elsif @event.include?(edge.target)

          new_parents = start_links.select { |e| e.target == edge.source }
          new_edges = new_parents.map { |e| { source: e.source, target: edge.target } }
          start_links = start_links.reject { |e| e.target == edge.source } + new_edges

        else

          start_links = merge_useless_nodes(dummy_count, edge, start_links)
          dummy_count += 1

        end
      end

    end

    good_links
  end

  private

  def timelink_to_edge(timelink)
    { source: @event.find_index(timelink.source), target: @event.find_index(timelink.target) }
  end

  def merge_useless_nodes(dummy, edge, array)
    a = array.select { |e| e.source == edge.source || e.source == edge.target }
    b = array.reject { |e| e.source == edge.source || e.source == edge.target }
    a.each do { |e| e.source = dummy }

    c = b + a

    c = array.select { |e| e.target == edge.source || e.target == edge.target }
    d = array.reject { |e| e.target == edge.source || e.target == edge.target }
    c.each do { |e| e.target = dummy }

    d + c
  end

end
