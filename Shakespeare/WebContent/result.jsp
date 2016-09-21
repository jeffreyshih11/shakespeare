<jsp:useBean id="sample" scope="page" class="back.Runner" />
<%@ page import="back.Runner"%>
<%@page import="back.FusionCharts"%>
<script type="text/javascript"
	src="http://static.fusioncharts.com/code/latest/fusioncharts.js"></script>
<script type="text/javascript"
	src="http://static.fusioncharts.com/code/latest/fusioncharts.charts.js"></script>
<script type="text/javascript"
	src="http://static.fusioncharts.com/code/latest/themes/fusioncharts.theme.ocean.js"></script>


<HTML>
<link type="text/css" rel="stylesheet" href="style.css" />
<title>Shakespeare Results</title>
<%
	String finder = request.getParameter("word");
	String playname = request.getParameter("playname");
%>
<%
	if (playname == null) {
%>
<center>
<h2>Please Select a Play</h2>
<form action="index.jsp">
	<input type="submit" value="Tryeth Again">
</form>
<img src="http://cp91279.biography.com/1000509261001/1000509261001_2013980530001_William-Shakespeare-The-Life-of-the-Bard.jpg">
</center>
<%
	} else {
		System.out.println(playname);
		/* for(int j = 0; j < playnames.length; j++){
			System.out.println(playnames[j]);
		} */
		Runner run = new Runner();
		run.run(finder, playname);
		String speaker = "";
		int count = 0;

		String playName = run.getPlay().getTitle();

		String graphData = "{\"chart\":{\"caption\":\"" + playName + "\",\"subCaption\":\""
				+ "Number of Times These Characters Said \'" + finder + "\'"
				+ "\",\"theme\":\"ocean\"},\"data\":[";
		String label = "{\"label\":\"";
		String value = "\",\"value\":\"";
		String close = "\"},";
		String graphDataClose = "]}";
		String graphWidth = "1000";

		int speakerSize = run.getPlay().getSpeakerArray().size();
		int numActualSpeakers = 0;
		for (int i = 0; i < speakerSize; i++) {
			if (run.getPlay().getSpeakerArray().get(i).getCount() > 0) {
				numActualSpeakers++;

				speaker = run.getPlay().getSpeakerArray().get(i).getName();
				count = run.getPlay().getSpeakerArray().get(i).getCount();
				String data = label + speaker + value + count + close;
				graphData += data;
				if (i == run.getPlay().getSpeakerArray().size() - 1) {
					graphData = graphData.substring(0, graphData.length() - 1);
				}
			}
		}
		graphData += graphDataClose;
		if (numActualSpeakers > 15) {
			graphWidth = "1600";
		}
	
	//System.out.println(playname);
	//System.out.println("done");
%>

<center>
	<div id="chart"></div>
	<%
		FusionCharts lineChart = new FusionCharts("column2d", // chartType
				"ex1", // chartId
				graphWidth, "600", // chartWidth, chartHeight
				"chart", // chartContainer
				"json", // dataFormat
				// dataSource
				graphData);
	%>
	<!--    Step 5: Render the chart    -->
	<%
		if (finder.length() < 1) {
	%>
	<h2>Please Enter a Word to Search For</h2>
	<form action="index.jsp">
		<input type="submit" value="Tryeth Again">
	</form>
	<img src="https://media1.britannica.com/eb-media/10/93010-004-6D415C60.jpg">
	<%
		} else if (numActualSpeakers == 0) {
	%>
	<h2>No one hath said that!</h2>
	<form action="index.jsp">
		<input type="submit" value="Tryeth Again">
	</form>
	<img src="http://3m7ajlsrzj92lfd1hu16hu7vc.wpengine.netdna-cdn.com/wp-content/uploads/2016/04/Shakespeare-660x350-1461293050.jpg">
	<%
		} else {
	%>
	<p>
		<%=lineChart.render()%>
	</p>
	<form action="index.jsp">
		<input type="submit" value="Searcheth Again">
	</form>
	<%
		}
	}
	%>

</center>
<body>

</body>
</HTML>