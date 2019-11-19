//import * as d3 from "d3";
function draw_graph() {

      let dataset = JSON.parse(document.querySelector('#timeline').dataset.string);
      // console.log(data_hash.links);

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

      const edges = svg.selectAll("line")
          .data(dataset.edges)
          .enter()
          .append("line")
          .attr("id",function(d,i) {return 'edge'+i})
          .attr('marker-end','url(#arrowhead)')
          .style("stroke","#ccc")
          .style("pointer-events", "none");

      const nodes = svg.selectAll("circle")
          .data(dataset.nodes)
          .enter()
          .append("circle")
          .attr("id",function(d,i) {return 'node'+i})
          .attr({"r":5})
          .style("fill","rgb(12,240,233)")
          .call(force.drag)

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
                "font-size":15})
         .text(function(d){return d.name;});

      const edgepaths = svg.selectAll(".edgepath")
        .data(dataset.edges)
        .enter()
        .append('path')
        .attr({'d': function(d) {return 'M '+d.source.x+' '+d.source.y+' L '+ d.target.x +' '+d.target.y},
               'class':'edgepath',
               'fill-opacity':0,
               'stroke-opacity':0,
               'fill':'blue',
               'stroke':'red',
               'id':function(d,i) {return 'edgepath'+i}})
        .style("pointer-events", "none");

    //   var edgelabels = svg.selectAll(".edgelabel")
    //     .data(dataset.edges)
    //     .enter()
    //     .append('text')
    //     .style("pointer-events", "none")
    //     .attr({'class':'edgelabel',
    //            'id':function(d,i){return 'edgelabel'+i},
    //            'dx':80,
    //            'dy':0,
    //            'font-size':10,
    //            'fill':'#aaa'});

    // edgelabels.append('textPath')
    //     .attr('xlink:href',function(d,i) {return '#edgepath'+i})
    //     .style("pointer-events", "none")
    //     .text(function(d,i){return 'label '+i});


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

    const edgeElements = document.querySelectorAll("line");
    edgeElements.forEach((e) => {
      e.addEventListener("click", (ev) => {
        console.log("CLICKED");
      });
    });


    const nodeElements = document.querySelectorAll("circle");
    edgeElements.forEach((e) => {
      e.addEventListener("mouseover", (event) => {
        document.querySelector(`${e.id}label`).style.display = "inline";
        console.log("ON IT");
      });
    });
};

export { draw_graph };
