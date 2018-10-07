<html>

<head>
<title> Student Confirmation Title</title>
</head>
<body>

The student is confirmed : ${param.lastName},  ${param.firstName } (${param.gender}) from ${param.country }
<br/>
Student's favourite languages are : 
<ul>
<%
String[] langs=request.getParameterValues("favLanguages");
if(langs!=null){
	for(String templang:langs){
		out.println("<li>"+templang+"</li>");
	}
}
%>
</ul>


</body>
</html>