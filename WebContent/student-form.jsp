<html>
<head>
	<title>
		Student Registration Form
	</title>
</head>
<body>
	<form action="student-response.jsp">
		First name: <input type="text" name="firstName"/>
		<br/><br/>
		Last name: <input type="text" name="lastName"/>
		<br/><br/>
		<select name="country">
			<option>Brazil</option>
			<option>Canada</option>
			<option>India</option>
			<option>Pakistan</option>
		</select>
		<br/><br/>
		Favourite Language: <input type="checkbox" name="favLanguages" value="JAVA"/> JAVA
		<input type="checkbox" name="favLanguages" value="C#"/> C#
		<input type="checkbox" name="favLanguages" value="C++"/> C++
		<br/><br/>
		Gender: <input type="radio" name="gender" value="Male"/> Male
				<input type="radio" name="gender" value="Female"/> Female
		
		<br/><br/>
		
		<br/>
		<br/><br/>
		
		<input type="submit" value="Submit"/>
	</form>
	
	<hr/>
	<br><br>
	<form action="StudentServletz">
		First name: <input type="text" name="firstName"/>
		<br/><br/>
		Last name: <input type="text" name="lastName"/>
		<br/><br/>
		<br/><br/>
		
		<input type="submit" value="Submit"/>
	</form>
	
	<br/>
	
 
</body>
</html>