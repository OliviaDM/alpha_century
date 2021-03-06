class Timeline
  def initialize(tag_array, world_id)
    if tag_array.nil?
      @events = Card.where(is_event: true, world_id: world_id)
    else
      @events = Card.events_tag_search(tag_array, world_id)
    end
    @links = Timelink.all.map { |tl| { target: tl.child_event, source: tl.parent_event, original: true } }
  end

  def json_ify
    events = @events.map { |ev| { name: ev.title, id: ev.id } }
    links = relevent_links
    { nodes: events, edges: links }.to_json
  end

  def relevent_links
    dummy_count = 0
    good_links = []
    start_links = @links

    until start_links.empty?
      edge = start_links.delete_at(0)

      unless edge[:source] == edge[:target]
        if @events.include?(edge[:source]) && @events.include?(edge[:target])

          format_link = timelink_to_edge(edge)

          if good_links.select { |e| e[:target] == format_link[:target] && e[:source] == format_link[:source] }.empty?
            good_links.push(format_link)
          end

        elsif @events.include?(edge[:source])

          new_children = start_links.select { |e| e[:source] == edge[:target] }
          new_edges = new_children.map { |e| { source: edge[:source], target: e[:target], original: false } }
          start_links = start_links.reject { |e| e[:source] == edge[:target] } + new_edges

        elsif @events.include?(edge[:target])

          new_parents = start_links.select { |e| e[:target] == edge[:source] }
          new_edges = new_parents.map { |e| { source: e[:source], target: edge[:target], original: false } }
          start_links = start_links.reject { |e| e[:target] == edge[:source] } + new_edges

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
    { source: @events.find_index(timelink[:source]), target: @events.find_index(timelink[:target]), original: timelink[:original] }
  end

  def merge_useless_nodes(dummy, edge, array)
    a = array.select { |e| e[:source] == edge[:source] || e[:source] == edge[:target] }
    b = array.reject { |e| e[:source] == edge[:source] || e[:source] == edge[:target] }
    a.each do |e|
      e[:source] = dummy
    end

    c = b + a

    c = array.select { |e| e[:target] == edge[:source] || e[:target] == edge[:target] }
    d = array.reject { |e| e[:target] == edge[:source] || e[:target] == edge[:target] }
    c.each do |e|
      e[:target] = dummy
    end

    d + c
  end

end
