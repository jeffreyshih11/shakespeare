<jsp:useBean id="sample" scope="page" class="back.Runner" />
<%@ page import="back.Runner"%>
<%@page import="back.FusionCharts"%>
<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/fusioncharts.charts.js"></script>
<script type="text/javascript" src="http://static.fusioncharts.com/code/latest/themes/fusioncharts.theme.ocean.js"></script>


<HTML>
<title>Shakespeare Results</title>
<%
	String finder = request.getParameter("word");
	String playname = request.getParameter("playname");
	System.out.println(playname);
	/* for(int j = 0; j < playnames.length; j++){
		System.out.println(playnames[j]);
	} */
	Runner run = new Runner();
	run.run(finder, playname);
	String speaker = "";
	int count = 0;
	String playName = run.getPlay().getTitle();
	
	String graphData = "{\"chart\":{\"caption\":\"" + playName + "\",\"subCaption\":\"" + "\'" + finder + "\'" + " Count\",\"theme\":\"ocean\"},\"data\":[";
	String label = "{\"label\":\"";
	String value = "\",\"value\":\"";
	String close = "\"},";
	String graphDataClose = "]}";

	int speakerSize = run.getPlay().getSpeakerArray().size();
	for (int i = 0; i < speakerSize; i++) {
		if (run.getPlay().getSpeakerArray().get(i).getCount() > 0) {
			speaker = run.getPlay().getSpeakerArray().get(i).getName();
			count = run.getPlay().getSpeakerArray().get(i).getCount();
			String data = label + speaker + value + count + close;
			graphData += data;
			if (i == run.getPlay().getSpeakerArray().size() - 1) {
				graphData = graphData.substring(0, graphData.length() - 1);
			}
%>

<%
	}
	}
	graphData += graphDataClose;
	//System.out.println(playname);
	//System.out.println("done");
%>


<div id="chart"></div>
<%
	FusionCharts lineChart = new FusionCharts("column2d", // chartType
			"ex1", // chartId
			"1000", "600", // chartWidth, chartHeight
			"chart", // chartContainer
			"json", // dataFormat
			// dataSource
			graphData);
%>
<!--    Step 5: Render the chart    -->
<%=lineChart.render()%>



<body>

</body>
</HTML>