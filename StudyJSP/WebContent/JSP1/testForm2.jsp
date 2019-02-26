<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/testForm2.jsp</h1>
<!--폼태그 1개 testPro2.jsp, post  -->
<form action="testPro2.jsp" method="post" name="fr">
ID : <input type="text" name="ID"><br>
Password : <input type="password" name="password"><br>
Name : <input type = "text" name="name"><br>
Age : <input type="text" name="age"><br>
Contact number : <input type="text" name="contact"><br>
<input type="submit" value="Send">



</form>
</body>
</html>