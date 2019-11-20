//import * as d3 from "d3";
function draw_graph() {

      let dataset = JSON.parse(document.querySelector('#timeline').dataset.string);
      let select1 = null;
      let select2 = null;
      const select1_col = 'rgb(12,220,245)';
      const select2_col = 'rgb(12,250,200)';
      const unselect_col = "rgb(198, 45, 205)";


      function display_btn(from, to) {
        const btn = document.querySelector('#create_link_btn');
        const d_btn = document.querySelector('#delete_link_btn');
        const from_id = parseInt(from.id.substring(4),10);
        const to_id = parseInt(to.id.substring(4),10);


        btn.innerHTML = `Create a link from <strong>${dataset.nodes[from_id].name}</strong> to <strong>${dataset.nodes[to_id].name}</strong>`;
        btn.style.display = "inline";

        d_btn.innerHTML = `Delete a link from <strong>${dataset.nodes[from_id].name}</strong> to <strong>${dataset.nodes[to_id].name}</strong>`;
        d_btn.style.display = "inline";


        const token = $('meta[name=csrf-token]').attr('content');



        d_btn.addEventListener("click", (event) => {
          const fd = new FormData();
          const link_info = JSON.stringify({ from: dataset.nodes[from_id].id, to: dataset.nodes[to_id].id });
          fd.append('timelink', link_info);


          fetch('/timelinks/destroy',
            { method: "POST",
              body: fd,
              headers: {
                'X-CSRF-Token': token
              },
              credentials: 'same-origin'
            })
          .then(response => response.json())
          .then(data => {
            if (data) {
              const edgy = dataset.edges.find( e => e.target.index == to_id && e.source.index == from_id);
              const ind = dataset.edges.indexOf(edgy);
              dataset.edges.splice(ind, 1);

              force
                .nodes(dataset.nodes)
                .links(dataset.edges)
                .start();

              restart();

            };
            });
        });

        btn.addEventListener("click", (event) => {
          const fd = new FormData();
          const link_info = JSON.stringify({ from: dataset.nodes[from_id].id, to: dataset.nodes[to_id].id });
          fd.append('timelink', link_info);


          fetch('/timelinks/create',
            { method: "POST",
              body: fd,
              headers: {
                'X-CSRF-Token': token
              },
              credentials: 'same-origin'
            })
          .then(response => response.json())
          .then(data => {
            if (data.id) {
              dataset.edges.push({target: to_id, source: from_id});

              force
                .nodes(dataset.nodes)
                .links(dataset.edges)
                .start();

              restart();

            };
            });

        });
      };

      function undisplay_btn() {
        document.querySelector('#create_link_btn').style.display = "none";
        document.querySelector('#delete_link_btn').style.display = "none";
      };

      const name_toggle = document.querySelector('#name_toggle');
      name_toggle.addEventListener("click", (event) => {
        if (name_toggle.checked) {
          nodelabels.attr({'display':'inline'});
        } else {
          nodelabels.attr({'display':'none'});
        };
      });

      function restart() {


        let edges = svg.selectAll("line")
            .data(dataset.edges);

        edges.enter()
            .append("line")
            .attr("id",function(d,i) {return 'edge'+i})
            .attr('marker-end','url(#arrowhead)')
            .attr("style", function(d) { return ("stroke-width: 1px;");})
            .style("stroke","#ccc")
            .style("pointer-events", "none");

        edges.exit().remove();

        let edgepaths = svg.selectAll(".edgepath")
          .data(dataset.edges);

        edgepaths.enter()
          .append('path')
          .attr({'d': function(d) {return 'M '+d.source.x+' '+d.source.y+' L '+ d.target.x +' '+d.target.y},
                 'class':'edgepath',
                 'fill-opacity':0,
                 'stroke-opacity':0,
                 'fill':'blue',
                 'stroke':'red',
                 'id':function(d,i) {return 'edgepath'+i}})
          .style("pointer-events", "none");

        edgepaths.exit().remove();

      force.on("tick", function(){

          edges.attr({"x1": function(d){return d.source.x;},
                      "y1": function(d){return d.source.y;},
                      "x2": function(d){return d.target.x;},
                      "y2": function(d){return d.target.y;}
          });

          nodes.attr({"cx":function(d){return d.x;},
                      "cy":function(d){return d.y;}
          });

          nodelabels.attr("x", function(d) { return d.x; })
                    .attr("y", function(d) { return d.y; });

          edgepaths.attr('d', function(d) { var path='M '+d.source.x+' '+d.source.y+' L '+ d.target.x +' '+d.target.y;
                                             //console.log(d)
                                             return path});
      });

    };

    const w = 1000, h = 600;

    const linkDistance = 100;
    const colors = d3.scale.category10();

    const svg = d3.select("#timeline").append("svg").attr({"width":w,"height":h});
    const force = d3.layout.force()
        .nodes(dataset.nodes)
        .links(dataset.edges)
        .size([w,h])
        .linkDistance([linkDistance])
        .charge([-500])
        .theta(0.1)
        .gravity(0.05)
        .start();

    const nodes = svg.selectAll("circle")
        .data(dataset.nodes)
        .enter()
        .append("circle")
        .attr("id",function(d,i) {return 'node'+i})
        .attr({"r":7})
        .style("fill", unselect_col)
        .on('mouseover', function(d,i) {
          d3.select(this)
            .attr({'r':10});
          d3.select(`#${this.id}label`)
            .attr({'display':'inline'});
        })
        .on('mouseout', function(d,i) {
          d3.select(this)
            .attr({'r':7});
          if (!name_toggle.checked) {
            d3.select(`#${this.id}label`)
              .attr({'display':'none'});
          };
        })
        .on('click', function(d,i) {
          if (!select1) {
            d3.select(this)
              .style('fill',select1_col)
              .classed('select1', true);
            select1 = this;
          } else if (!select2) {
            if (this == select1) {
              d3.select(this)
                .style("fill", unselect_col)
                .classed('select1', false);
              select1 = null;
            } else {
              d3.select(this)
                .style('fill',select2_col)
                .classed('select2', true);
              select2 = this;
              display_btn(select1,select2);
            };
          } else {
            if (this == select1) {
              d3.select(this)
                .style("fill", unselect_col)
                .classed('select1', false);
              d3.select(select2)
                .style("fill",select1_col)
                .classed('select1', true)
                .classed('select2', false);
              select1 = select2
              select2 = null;
              undisplay_btn();
            } else if (this == select2) {
              d3.select(this)
                .style('fill', unselect_col)
                .classed('select2', false);
              select2 = null;
              undisplay_btn();
            } else {
              d3.select(select2)
                .style("fill", unselect_col)
                .classed('select2', false);
              d3.select(this)
                .style("fill",select2_col)
                .classed('select2', true);
              select2 = this;
              display_btn(select1,select2);
            };
          };
        });

    const nodelabels = svg.selectAll(".nodelabel")
       .data(dataset.nodes)
       .enter()
       .append("text")
       .attr("id",function(d,i) {return 'node'+i+'label'})
       .attr({"x":function(d){return d.x;},
              "y":function(d){return d.y;},
              "class":"nodelabel",
              "stroke":"white",
              "font-weight":"lighter",
              "display":"none",
              "font-size":24})
       .text(function(d){return d.name;});

    restart();

    svg.append('defs').append('marker')
          .attr({'id':'arrowhead',
                 'viewBox':'-0 -5 10 10',
                 'refX':25,
                 'refY':0,
                 //'markerUnits':'strokeWidth',
                 'orient':'auto',
                 'markerWidth':10,
                 'markerHeight':10,
                 'xoverflow':'visible'})
          .append('svg:path')
              .attr('d', 'M 0,-5 L 10 ,0 L 0,5')
              .attr('fill', '#ccc')
              .attr('stroke','#ccc');



  };

export { draw_graph };
