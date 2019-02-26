<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/JSP5/dbConTest.jsp</h1>
<%
//Mysql - JSP 페이지연결
//JDBC 드라이버 설치
//WEB-INF>lib>mysql-connector-java-5.1.47.jar 설치
//1.드라이버 로드

Class.forName("com.mysql.jdbc.Driver");

out.println("드라이버 로드 성공!!");

//(디비주소, 디비아이디, 디비비밀번호)

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb","root","1234");

out.println("<br>디비 연결 성공!!<br>");

%>
연결정보 : <%=con%>


</body>
</html>