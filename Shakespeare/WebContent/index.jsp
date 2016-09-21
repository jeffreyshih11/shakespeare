<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="back.Runner"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="org.w3c.dom.NodeList,javax.xml.parsers.DocumentBuilder" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<link type="text/css" rel="stylesheet" href="style.css" />
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Shakespeare</title>
</head>
<body>
	<center>
	<h3>Who said what how many times in Shakespeare's plays?</h3>
	<form action="result.jsp">
		Word or Phrase to Find: <input type="text" name="word"><br>
		<p>
		<center>Select a Play</center>
			<select onchange="" id="setit" style="color: black"
				size="37" name="playname">
				<option value="a_and_c">The Tragedy of Antony and Cleopatra</option>
				<option value="all_well">All's Well That Ends Well</option>
				<option value="as_you">As You Like It</option>
				<option value="com_err">The Comedy of Errors</option>
				<option value="coriolan">The Tragedy of Coriolanus</option>
				<option value="cymbelin">Cymbeline</option>
				<option value="dream">A Midsummer Night's Dream</option>
				<option value="hamlet">Hamlet</option>
				<option value="hen_iv_1">The First Part of Henry the Fourth</option>
				<option value="hen_iv_2">The Second Part of Henry the Fourth</option>
				<option value="hen_v">The Life of Henry the Fifth</option>
				<option value="hen_vi_1">The First Part of Henry the Sixth</option>
				<option value="hen_vi_2">The Second Part of Henry the Sixth</option>
				<option value="hen_vi_1">The Third Part of Henry the Sixth</option>
				<option value="hen_viii">The Famous History of the Life of Henry the Eighth</option>
				<option value="j_caesar">The Tragedy of Julius Caesar</option>
				<option value="john">The Life and Death of King John</option>
				<option value="lear">The Tragedy of King Lear</option>
				<option value="lll">Love's Labour's Lost</option>
				<option value="m_for_m">Measure for Measure</option>
				<option value="m_wives">The Merry Wives of Windsor</option>
				<option value="macbeth">The Tragedy of Macbeth</option>
				<option value="merchant">The Merchant of Venice</option>
				<option value="much_ado">Much Ado about Nothing</option>
				<option value="othello">The Tragedy of Othello, the Moor of Venice</option>
				<option value="pericles">Pericles, Prince of Tyre</option>
				<option value="r_and_j">The Tragedy of Romeo and Juliet</option>
				<option value="rich_ii">The Tragedy of King Richard the Second</option>
				<option value="rich_iii">The Tragedy of Richard the Third</option>
				<option value="t_night">Twelfth Night, or What You Will</option>
				<option value="taming">The Taming of the Shrew</option>
				<option value="tempest">The Tempest</option>
				<option value="timon">The Life of Timon of Athens</option>
				<option value="titus">The Tragedy of Titus Andronicus</option>
				<option value="troilus">The History of Troilus and Cressida</option>
				<option value="two_gent">The Two Gentlemen of Verona</option>
				<option value="win_tale">The Winter's Tale</option>
				
				
			</select>
		</p>
		<input type="submit" value="Submit">
	</form>
	
	</center>
	
</body>
</html>