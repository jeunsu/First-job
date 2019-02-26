<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//http에 요청된 정보를 전달
//=> request, response 객체 (자동 생성)
// => request 객체가 해당 요청 정보를 저장
//(form 페이지에서 데이터를 전달받아서 온다.)

//request.getParameter("가져오고자 하는 값으 이름")
String num = request.getParameter("num");
String name = request.getParameter("name");
String race = request.getParameter("race");
%>
Your name is <%=name %><br>
Your race is <%=race %><br>
Your favorite number is <%=num %><br>
전달받은 숫자(정수 데이터로 변경) : 
<%=Integer.parseInt(num)+100 %>

</body>
</html>