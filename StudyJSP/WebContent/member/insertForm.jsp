<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>회원가입</h1>
<fieldset>
<legend>So be it</legend>
<form action="insertPro.jsp" method="post">
ID: <input type="text" name="id"><br>
PW: <input type="password" name="pass"><br>
Name: <input type="text" name="name"><br>
Age: <input type="text" name="age"><br>
Gender: <input type="radio" name="gender" value="M">Male
<input type="radio" name="gender" value="F">female
<input type="radio" name="gender" value="O">Other<br>
E-mail: <input type="text" name="email"><br>
<input type="submit" value="Apply">
</form>
</fieldset>
</body>
</html>