<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebConten/JSP5/InsertPro.jsp</h1>

<%request.setCharacterEncoding("UTF-8");
//InserForm.jsp 페이지에서 전달되어온 정보를 저장
String ID=request.getParameter("ID");
String Pass=request.getParameter("Pass");
String Name=request.getParameter("Name");
Timestamp reg_date= new Timestamp(System.currentTimeMillis());
//한글처리

//페이지에 출력

//DB연결에 필요한 정보 저장
final String DRIVER="com.mysql.jdbc.Driver";
final String DBID="root";
final String DBPW="1234";
final String DBURL="jdbc:mysql://localhost:3306/jspdb";
//1.JDBC 드라이버 로드

//2.DB연결

Class.forName(DRIVER);
Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);

//3.sql 처리 객체 (insert)
//String sql="insert into table member(ID,Password,Name,reg_date) values('"+ID+"','"+Pass+"','"+Name+"','"+reg_date+"')";
String sql="insert into members(ID,Password,Name,reg_date) values(?,?,?,?)";

//Statement
//Statement stmt=con.createStatement();
//State객체를 사용하여 쿼리문을 전달해서 실행
//executeXXX()를 사용해서 전달
//executeUpdate():INSERT, UPDATE, DELETE 구문시 사용
//데이터베이스에 직접 조작을 하는 구문
//executeQuery():SELECT 구문시 사용
//데이터베이스에 직접 영향을 주지 않는 구문

//PreparedStatment
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, ID);
pstmt.setString(2, Pass);
pstmt.setString(3, Name);
pstmt.setTimestamp(4,reg_date);
pstmt.executeUpdate();
//executeUpdate()
//executeQuery()
 





%>
회원가입성공<br>
회원ID : <%=ID %><br>
회원Pass : <%=Pass %><br>
회원Name : <%=Name %><br>
가입날짜 : <%=reg_date %><br>

<br><br>

디비접속객체 : <%=con %><br>





</body>
</html>