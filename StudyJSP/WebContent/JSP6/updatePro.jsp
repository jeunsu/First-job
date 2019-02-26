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
//세션값, 로그인 여부 체크
request.setCharacterEncoding("UTF-8");
String pass=request.getParameter("pass");
String name=request.getParameter("name");
String gender=request.getParameter("gender");
String email=request.getParameter("email");
String id=request.getParameter("id");
String regnum=request.getParameter("regnum");
int age=Integer.parseInt(request.getParameter("age"));
//한글 처리
//파라미터값 저장(id, pass, name, age, gender, email,juni)
final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBID = "root"; // jspid
		final String DBPW = "1234"; // jsppass
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		Class.forName(DRIVER);
//디비 연결 처리
Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
String sql="select Password from members where ID=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);
//아이디 있는지 처리, 비밀번호가 같은지 테크
//아이디, 비밀번호 모두 같은 경우에만 수정
//id,pass, reg_date 제외한 모든 정보를 수정
ResultSet rs = pstmt.executeQuery();
//수정 완료시 메세지 사용후 -> main.jsp페이지 이동
if(rs.next()){
	//아이디 있음
	if(pass.equals(rs.getString("Password"))){
		//비밀번호가 같은 경우
		sql="update members set Name=?, Age=?,Gender=?,RegNum=?,Email=? where ID=?";
		pstmt= con.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setInt(2, age);
		pstmt.setString(3, gender);
		pstmt.setString(4, regnum);
		pstmt.setString(5, email);
		pstmt.setString(6, id);
		pstmt.executeUpdate();%>
		<script type="text/javascript">
		alert("수정 성공");
		location.href="main.jsp";</script><% 
	}else{
		//비밀번호가 다른 경우
		%>
		<script type="text/javascript">
		alert("아이디 오류");
		history.back();</script><% 
	}
}

%>





</body>
</html>