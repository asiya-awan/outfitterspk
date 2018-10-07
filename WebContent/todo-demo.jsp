<%@ page import="java.util.*,com.outfitterspk.models.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>

<body>

<!-- Step 1: Create HTML Form -->
<form action="todo-demo.jsp">
	Add your hobbies: <input type="text" name="theItem"/>
		
						<input type="submit" value="Submit"/>
</form>
<br/>
<br/>
hobby entered: ${param.theItem}
<!-- Step 2: Add new item to "To Do" list -->
<%

//get the To Do items from the session
List<String> items= (List<String>) session.getAttribute("myToDoList");

//if the To Do items doesn't exist, then create a new one
if(items ==null){
	items=new ArrayList<String>();
	session.setAttribute("myToDoList",items);
}
//see if there is form data to add
	String theItem=request.getParameter("theItem");
	  if ( (theItem != null) && (!theItem.trim().equals("")) ) {
	       items.add(theItem);
	    }
%>
	
<!-- Step 3:Display all "ToDo" item from session -->

<hr/>
		<b>  To List Hobbies: </b><br/>
		<ol>
		<%
			for(String temp:items){
				out.println("<li>"+temp+"</li>");
			}
		%>
		</ol>
		

</form>

<hr/>


<c:forEach var="product" items="${products_women}">
 	${product.price}

</c:forEach>






	

</body>

</html>

		