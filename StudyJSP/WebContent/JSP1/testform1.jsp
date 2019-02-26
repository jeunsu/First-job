<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!--
폼태그 1개 생성 testPro1.jsp, get
좋아하는 숫자 1개를 입력받는 입력창 생성,
전송버튼 생성  -->
<form action="testPro1.jsp" method="get" name="fr">
Name : <input type="text" name="name"><br>
Race:<input type ="text" name="race"><br>
Favorite number : <input type = "text" name="num"><br>
<input type="submit" value="send">
</form>
</body>
</html>