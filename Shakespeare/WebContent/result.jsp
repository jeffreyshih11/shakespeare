<jsp:useBean id="sample" scope="page" class="back.Runner" />
<%@ page import="back.Runner"%>

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
	String str = "";
	int count = 0;
	
	for (int i = 0; i < run.getPlay().getSpeakerArray().size(); i++) {
		if (run.getPlay().getSpeakerArray().get(i).getCount() > 0) {
			str = run.getPlay().getSpeakerArray().get(i).getName();
			count = run.getPlay().getSpeakerArray().get(i).getCount();%>
			<p><%=str %>: <%=count %> </p>
		<%}
	}
	//System.out.println(playname);
	//System.out.println("done");
	%>

<body>

</body>
</HTML>