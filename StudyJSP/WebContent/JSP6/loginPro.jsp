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
String id=request.getParameter("id");
String pass=request.getParameter("pass");

final String DRIVER="com.mysql.jdbc.Driver";
final String DBID="root";
final String DBPW="1234";
final String DBURL="jdbc:mysql://localhost:3306/jspdb";


Class.forName(DRIVER);

out.println("드라이버 로드 성공!!");

Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);

out.println("<br>디비 연결 성공!!<br>");

String sql="select Password from members where ID=?";
PreparedStatement pstm=con.prepareStatement(sql);
pstm.setString(1,id);
ResultSet rs=pstm.executeQuery();

if(rs.next()){
	if(pass.equals(rs.getString("Password"))){
		//아이디 비밀번호 맞음 => 로그인
		//	세션객체를 사용 id값을 계속해서 저장
		
		//main.jsp페이지로 이동
		session.setAttribute("ID", id);
		response.sendRedirect("main.jsp");
	}
	else{
		%>
		<script type="text/javascript">
		alert("Incorrect Password");
		history.back();
		</script>
		<% 
		
	}
	}
else{
	%>
	<script type="text/javascript">
	alert("No ID");
	history.back();	
	</script>
	<% 
}
%>



</body>
</html>