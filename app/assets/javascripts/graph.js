var Graph = function(selector, data, kind) {
  this.selector = selector;
  this.data = data;
  this.kind = kind;
};

Graph.prototype.getData = function() {
  var _this = this;
  var dataWithCaptions = this.data.data.map(function(element, index, array) {
    return [ _this.data.x_axis.series[index], element ];
  });

  return google.visualization.arrayToDataTable([
    [ this.data.x_axis.legend, this.data.y_axis.legend ],
  ].concat(dataWithCaptions));
};

Graph.prototype.render = function() {
  var divWidth = $(this.selector).parents(".container:first").prop("clientWidth");
  var chart = new google.visualization[Graph.graphs[this.kind]]($(this.selector)[0]);
  var options = {
    width: divWidth,
    min: 0,
    legend: { position: "none" },
    height: 300,
    fontName: "sans-serif",
    fontSize: "12",
    title: this.data.title
  };

  chart.draw(this.getData(), options);
};

Graph.instances = [];

Graph.column = function(selector, data) {
  Graph.instances.push(new Graph(selector, data, "column"));
};

Graph.pie = function(selector, data) {
  Graph.instances.push(new Graph(selector, data, "pie"));
};

google.load('visualization', '1.0', {'packages':['corechart']});

Graph.graphs = {
  "column" : "ColumnChart",
  "pie"    : "PieChart"
}
