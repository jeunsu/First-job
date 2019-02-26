<%@page import="java.util.*"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
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
<%
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("ID");
if(id==null&&id!="admin"){
	response.sendRedirect("loginForm.jsp");
}
final String DRIVER = "com.mysql.jdbc.Driver";
final String DBID = "root"; // jspid
final String DBPW = "1234"; // jsppass
final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
Class.forName(DRIVER);
Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
pstmt.setInt(1, idx);
ResultSet rs = pstmt.executeQuery();
/* String pass="";
String name="";
String gender="";
int age=0;
String regnum="";
String email="";
Timestamp signInDate=null; */
/*List<String> list=new ArrayList<String>();
 for(int idx=1;idx<11;idx++){*/
String sql="select ID, Password, Gender, Name, Age, RegNum, Email, reg_date from members";
PreparedStatement pstmt = con.prepareStatement(sql);
/*if(rs.next()){
	id=rs.getString("ID");
	pass=rs.getString("Password");
	age=rs.getInt("Age");
	name=rs.getString("Name");
	signInDate=rs.getTimestamp("reg_date");
	email=rs.getString("Email");
	gender=rs.getString("Gender");
	regnum=rs.getString("RegNum");
	list.add(id,pass,age,name,signInDate,email,gender,regnum);
} */
%>
<table border="1">
<tr>
<th>ID</th><th>Password</th><th>Gender</th><th>Age</th><th>RegNum</th>
<th>Email</th><th>reg_date</th>
</tr>
<!--  <%for(int i=0;i<idx+1;i++){%>-->
<%while(rs.next()){ %>
<tr>
<td><%=rs.getString("ID") %></td>
<td><%=rs.getString("Password") %></td>
<td><%=rs.getString("Gender") %></td>
<td><%=rs.getString("Age") %></td>
<td><%=rs.getString("RegNum") %></td>
<td><%=rs.getString("Email") %></td>
<td><%=rs.getString("reg_date") %></td>
</tr>
<% }}%>
</table>




</body>
</html>