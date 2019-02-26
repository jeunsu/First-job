<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
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
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("ID");
if(id==null){
	response.sendRedirect("loginForm.jsp");
}
//DB에 연결을 해서
final String DRIVER="com.mysql.jdbc.Driver";
final String DBID="root";
final String DBPW="1234";
final String DBURL="jdbc:mysql://localhost:3306/jspdb";


Class.forName(DRIVER);

out.println("드라이버 로드 성공!!");

Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);

out.println("<br>디비 연결 성공!!<br>");

String sql="select * from members where ID=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery();
String pass="";
String name="";
String gender="";
int age=0;
String regnum="";
String email="";
Timestamp signInDate=null;

if(rs.next()){
	pass=rs.getString("Password");
	age=rs.getInt("Age");
	name=rs.getString("Name");
	signInDate=rs.getTimestamp("reg_date");
	email=rs.getString("Email");
	gender=rs.getString("Gender");
	regnum=rs.getString("RegNum");
}

%>

<table border=1px;>
<tr>
<th>ID</th>
<th>Age</th>
<th>Gender</th>
<th>RegNum</th>
<th>Sign in Date</th>
<th>Name</th>
<th>Email</th>
</tr>
<tr>
<td><%=id %></td>
<td><%=age %></td>
<td><%=gender %></td>
<td><%=regnum %></td>
<td><%=signInDate %></td>
<td><%=name %></td>
<td><%=email %></td>
</tr>
</table>
<br><br>
<h2><a href="main.jsp">To main page</a></h2>
</body>
</html>