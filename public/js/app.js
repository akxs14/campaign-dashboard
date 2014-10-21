$(document).ready(function() {

  function toggleChevron(e) {
    $(e.target)
      .prev('.panel-heading')
      .find("i.indicator")
      .toggleClass('glyphicon-chevron-down glyphicon-chevron-right');
  }
  $("#accordion").on('hidden.bs.collapse', toggleChevron);
  $("#accordion").on('shown.bs.collapse', toggleChevron);

  var options = {
    ///Boolean - Whether grid lines are shown across the chart
    scaleShowGridLines : true,

    //String - Colour of the grid lines
    scaleGridLineColor : "rgba(0,0,0,.05)",

    //Number - Width of the grid lines
    scaleGridLineWidth : 1,

    //Boolean - Whether the line is curved between points
    bezierCurve : true,

    //Number - Tension of the bezier curve between points
    bezierCurveTension : 0.4,

    //Boolean - Whether to show a dot for each point
    pointDot : true,

    //Number - Radius of each point dot in pixels
    pointDotRadius : 4,

    //Number - Pixel width of point dot stroke
    pointDotStrokeWidth : 1,

    //Number - amount extra to add to the radius to cater for hit detection outside the drawn point
    pointHitDetectionRadius : 20,

    //Boolean - Whether to show a stroke for datasets
    datasetStroke : true,

    //Number - Pixel width of dataset stroke
    datasetStrokeWidth : 2,

    //Boolean - Whether to fill the dataset with a colour
    datasetFill : true,

    //String - A legend template
    legendTemplate : "<ul class=\"<%=name.toLowerCase()%>-legend\"><% for (var i=0; i<datasets.length; i++){%><li><span style=\"background-color:<%=datasets[i].lineColor%>\"></span><%if(datasets[i].label){%><%=datasets[i].label%><%}%></li><%}%></ul>"
  };

  var data = {
    labels: ["January", "February", "March", "April", "May", "June", "July"],
    datasets: [
        {
            label: "My First dataset",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(220,220,220,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: [65, 59, 80, 81, 56, 55, 40]
        },
        {
            label: "My Second dataset",
            fillColor: "rgba(151,187,205,0.2)",
            strokeColor: "rgba(151,187,205,1)",
            pointColor: "rgba(151,187,205,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(151,187,205,1)",
            data: [28, 48, 40, 19, 86, 27, 90]
        }
    ]
  };  

  $('#cmd-add-input-var').click(function() {
    $("#input-variables").append("<option value='pipa'>" + $("#add-input-var").val() + "</option>");
    $("#add-input-var").val("");
  });

  $('#cmd-clear-input-vars').click(function() {
    $("#input-variables").html("");
  });

  // var pastDayCtx = document.getElementById("pastDayGraph").getContext("2d");
  // var pastDayChart = new Chart(pastDayCtx).Line(data, options);

  // var todayCtx = document.getElementById("todayGraph").getContext("2d");
  // var todayChart = new Chart(todayCtx).Line(data, options);

  // var overallCtx = document.getElementById("overallGraph").getContext("2d");
  // var overallChart = new Chart(overallCtx).Line(data, options);

  // var ractive = new Ractive({
  //   el: 'add-variable-container',
  //   template: '#add-variable-script',
  //   data: { 
  //     newVariable: '',
  //     inputVariables: [ {name:'pipa'} ] 
  //   }
  // });

  // ractive.on('addVariable', function(event) {
  //   var newVar = ractive.get('newVariable');
  //   var existingVariables = ractive.get('inputVariables');
  //   // ractive.set('inputVariables', existingVariables + newVar);
  //   console.log(newVar);
  // });

});

