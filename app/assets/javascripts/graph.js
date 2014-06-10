var Graph = function(selector, data) {
  this.selector = selector;
  this.data = data;

  this.svg = d3.select(selector).append("svg").attr({
    width: "100%",
    height: Graph.height,
    class: "graph"
  });
};

Graph.prototype.render = function(graphType) {
  this[graphType]();
};

Graph.prototype.setAxis = function() {
  this.yScale = d3.scale.linear()
    .domain(this.data.y_axis.scale)
    .range([0, Graph.height - Graph.margins.top - Graph.margins.bottom ]);

  this.yAxis = d3.svg.axis()
    .scale(this.yScale)
    .tickFormat(d3.format("d"))
    .orient("left");
};

Graph.prototype.renderAxis = function() {
  this.svg.append("g").attr({
    class: "y_axis",
    transform: "translate(" + [Graph.margins.left, Graph.margins.top] + ")"
  }).call(this.yAxis)
};

Graph.prototype.bar = function() {
  var _this = this;

  this.setAxis();
  this.renderAxis();

  this.svg.selectAll("rect")
    .data(this.data.data)
    .enter()
    .append("rect")
    .attr({
      x: function(d, i) { return i * 34 + Graph.margins.left; },
      y: function(d, i) { return Graph.margins.top; },
      width: function(d, i) { return d3.select(_this.selector).property("clientWidth") / 3; },
      height: _this.yScale,
      class: "graph-bar",
    });
}

Graph.bar = function(selector, data) {
  var graph = new Graph(selector, data);
  if (!Graph.instances) { Graph.instances = []; };

  Graph.instances.push(graph);
  graph.render('bar')
}

Graph.margins = {
  top: 30,
  bottom: 30,
  left: 30,
  right: 30
};

Graph.height = 200;
