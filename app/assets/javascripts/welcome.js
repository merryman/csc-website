// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function(){

	var dataset = $('#timeframes').data('url')

	var width = 220,
	    height = 220,
	    radius = Math.min(width-20, height-20) / 2;

	var color = d3.scale.category20();

	var pie = d3.layout.pie()
	    			.sort(null);

	var arc = d3.svg.arc()
	    .innerRadius(radius - 50)
	    .outerRadius(radius - 10);
	
	var desc = d3.select('div#description');

	var svg = d3.select("div#donut").append("svg")
	    .attr("width", width)
	    .attr("height", height)
	    .append("g")
		.attr('id', 'container')
	    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")

	var path = svg.selectAll("path")
	    .data(pie.value(function(d, i) { return d.value; })(dataset))
	    .enter().append("path")
	    .attr("fill", function(d, i) { return color(i); })
	    .attr("d", arc)
		.style("opacity", 0.3)
		.style('stroke', function(d, i) { return LightenDarkenColor(color(i), -60); })
		.style('stroke-with', 0)
		.on("mouseover", mouseover);

	// Add the mouseleave handler to the bounding circle.
	d3.selectAll("path").on("mouseleave", mouseleave);
		
	var past_frames = d3.selectAll("path").filter(
			function(node, i) {
				return node.data.past_frame;
			}
		).data()

	var arcOver = d3.svg.arc()
	    .outerRadius(radius)
		.innerRadius(radius - 50);
		
	past_frames.map(mouseover);
	
	highlight(
		d3.selectAll("path").filter(
			function(node, i) {
				return node.data.todays_frame;
			}
		));
		
	function highlight(d) {
		
		   d.transition()
			.duration(100)
			.attr("d", arcOver)
			.style("opacity", 1);
	}	
	
	// Fade all but the current sequence, and show it in the breadcrumb trail.
	function mouseover(d) {
		
		segments = d3.selectAll("path")
		
	    // Then highlight only those that are an ancestor of the current segment.
	    segments.filter(function(node) {
	                  return (node == d);
	                })
			.transition()
			.duration(100)
			.attr("d", arcOver)
			.style("stroke-width", 3);
			
		d3.select('p#name').text(d.data.timeframe.name);
		d3.select('p#content').text(d.data.timeframe.description);
		d3.select('div#date-frame').text(
			printDate(new Date(d.data.timeframe.start_date)) 
			+ " - " +
			printDate(new Date(d.data.timeframe.end_date))
		);
	};

	function mouseleave(d) {
		segments = d3.selectAll("path").style("stroke-width", 0)
			
		if(!(d.data.todays_frame || d.data.past_frame)){
			segments.filter(function(node) {
				                  return (node == d);
				                })
				.transition()
				.duration(100)
				.attr("d", arc);
		}
	};

});
