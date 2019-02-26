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
//한글처리
//파라미터 저장(id,pass)
//디비연결
//아이디, 비밀번호가 동일할 경우에만 회원 삭제
//회원 삭제 후 main페이지로 이동
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("ID");
if(id==null){
	response.sendRedirect("loginForm.jsp");
}

String pass=request.getParameter("pass");
final String DRIVER="com.mysql.jdbc.Driver";
final String DBID="root";
final String DBPW="1234";
final String DBURL="jdbc:mysql://localhost:3306/jspdb";


Class.forName(DRIVER);
Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);
String sql="select * from members where id=?";
PreparedStatement pstm=con.prepareStatement(sql);
pstm.setString(1,id);
ResultSet rs=pstm.executeQuery();
if(rs.next()){
if(pass.equals(rs.getString("Password"))){
	sql="delete * from members where id=?";
	pstm=con.prepareStatement(sql);
	pstm.setString(1,id);
	pstm.executeUpdate(sql);
	//세션 초기화
	session.invalidate();
}else{
	%>
	<script type="text/javascript">
	alert("수정 성공");
	location.href="main.jsp";</script><% 
}
}
else{ %>
<script type="text/javascript">
alert("아이디 오류");
history.back();</script><% }
%>
</body>
</html>