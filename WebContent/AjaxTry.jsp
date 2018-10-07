<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
 <script src="resources\js\jquery.min.js"></script>


<script type="text/javascript">
 	$(document).ready(function(){
 		$('#btnHello').click(function(){
 			var fullname=$('#fullname').val();
 			$.ajax({
 				url:'CartServlet',
 				type:'POST',
 				data:{
 					fullname: fullname,
 					action: 'demo1'
 					},
 				
 				success: function(result){
 					$('#result1').html(result);
 				}
 			});
 		});
 	});
 	
	$(document).ready(function(){
 		
 		$('#btnAdd').click(function(){
 			var number1=$('#number1').val();
 			var number2=$('#number2').val();
 					
 			$.ajax({
 				type:'POST',
 				data:{
 					number1: number1,
 					number2:number2,
 					action:'demo2'
 					},
 				url:'CartServlet',
 				success: function(result){
 					$('#result2').html(result);
 				}
 			});
 		});
 		
 	});
 </script>


</head>
<body>



 <div>
      
      <form>
	      Name: <input type="text" id="fullname"/><br/>
	      <input type="button" value="Hello" id="btnHello"/>
	      <span id="result1"></span>
      </form>
      <br/>
      <form>
      	Number 1: <input type="number" id="number1"/>
      	Number 2: <input type="number" id="number2"/>
      	<input type="button" value="Add" id="btnAdd"/>
      	 <span id="result2"></span>
      </form>
      
      </div>

   
</body>
</html>