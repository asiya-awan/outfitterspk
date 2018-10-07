<%@ page import="com.outfitterspk.jsp.*, java.util.*, java.io.*" %>

<html>
<head>
<title>
Hello World
</title>
</head>
<body>
<h3>Hello World of JAVA</h3>
The time on the server is <%= new java.util.Date() %>
<%
	for(int i=0; i<=5; i++){
		out.println("<br/> I hate coding!");
	}
%>
<p> 
<%= FuncUtils.makeItLower("PAKISTAN") %>
</p>
<!-- Built in Object in JSPp -->
<div>
<Strong>User Agent: </Strong><%= request.getHeader("User-Agent") %>
<Strong>User Agent: </Strong><%= request.getLocale() %>
</div>



	
	


</body>

</html>