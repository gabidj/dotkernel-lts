/**
 * Create a pie chart
 * @param {Array} pieData - Data to be displayed in the pie
 */
function pieChart(pieData){
    dojo.require("dojox.charting.Chart2D");
    dojo.require("dojox.charting.plot2d.Pie");
    dojo.require("dojox.charting.action2d.Highlight");
    dojo.require("dojox.charting.action2d.MoveSlice");
    dojo.require("dojox.charting.action2d.Tooltip");
    dojo.require("dojox.charting.action2d.Magnify");
    dojo.require("dojox.charting.widget.Legend");
    dojo.require("dijit.form.NumberSpinner");
    
    dojo.addOnLoad(function(){
        // prepare the data here, because color is understand only with dojo.Color
        var dc = dojox.charting;
        var chartItem = new dc.Chart2D("chartCountryUserLogin");
        chartItem.addPlot("default", {
            type: "Pie",
            font: "11px Verdana,sans-serif",
            fontColor: '#787890',
            labelOffset: -40,
            radius: 70,
        }).addSeries("Pie Chart", pieData, {
            stroke: {
                color: "blue"
            },
            fill: "lightblue"
        });
        var anim_a = new dc.action2d.MoveSlice(chartItem, "default");
        var anim_b = new dc.action2d.Highlight(chartItem, "default");
        var anim_c = new dc.action2d.Tooltip(chartItem, "default");
        chartItem.render();
        var legendItem = new dojox.charting.widget.Legend({
            chart: chartItem,
			horizontal: false
			}, "chartCountryLegend");
        
    });
}