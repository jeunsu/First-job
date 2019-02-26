<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/jsp1/testForm3.jsp</h1>

	<fieldset>
		<form action="testPro3.jsp" method="get">
			Name : <input type="text" name="name"><br> Sex : <input
				type="radio" name="sex" value="Male">Male <input
				type="radio" name="sex" value="Female">Female<br>

			Subject: <select name="subject">
				<option value="JAVA">JAVA</option>
				<option value="JSP">JSP</option>
				<option value="WEB">WEB</option>
				<option value="DB">DB</option>
			</select> <br> 
			<input type="checkbox" name="hobby" value="travel">travel
			<input type="checkbox" name="hobby" value="game">game
			<input type="checkbox" name="hobby" value="reading">reading
			<input type="checkbox" name="hobby" value="dancing">dancing
	<br>
	<input type="submit" value="Send">
<!-- 취미 다중선택 출력!!!!  -->
		</form>
	</fieldset>
</body>
</html>