// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){

	var dataset = {
	  timeframes: [2, 2, 3, 4, 1],
	};

	var width = 200,
	    height = 200,
	    radius = Math.min(width, height) / 2;

	var color = d3.scale.category20();

	var pie = d3.layout.pie()
	    			.sort(null);

	var arc = d3.svg.arc()
	    .innerRadius(radius - 50)
	    .outerRadius(radius - 10);
	
	var desc = d3.select('div#timeline').append('div')
		   		.attr('id', 'description')
		   	 	.text("Application Timeframe")
				.append('p')
				.text("Applications can now be submitted to the CSC!");

	var svg = d3.select("div#timeline").append("svg")
	    .attr("width", width)
	    .attr("height", height)
	    .append("g")
		.attr('id', 'container')
	    .attr("transform", "translate(" + width / 2 + "," + height / 2 + ")")

	var path = svg.selectAll("path")
	    .data(pie(dataset.timeframes))
	    .enter().append("path")
	    .attr("fill", function(d, i) { return color(i); })
	    .attr("d", arc)
		.on("mouseover", mouseover);

	// Add the mouseleave handler to the bounding circle.
	d3.selectAll("path").on("mouseleave", mouseleave);

	var arcOver = d3.svg.arc()
	    .outerRadius(radius)
		.innerRadius(radius - 50);

	// Fade all but the current sequence, and show it in the breadcrumb trail.
	function mouseover(d) {
	    // Fade all the segments.
	    d3.selectAll("path")
	        .style("opacity", 0.3);

	    // Then highlight only those that are an ancestor of the current segment.
	    svg.selectAll("path")
	        .filter(function(node) {
	                  return (node == d);
	                })
			.style("opacity", 1)
			.transition()
			.duration(200)
			.attr("d", arcOver);
	};

	function mouseleave(d) {
	    d3.selectAll("path")
			.transition()
			.duration(200)
			.attr("d", arc)
		    .style("opacity", 0.3);
	};

});

