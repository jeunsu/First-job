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
String id=request.getParameter("id");
String pass=request.getParameter("pass");
String id2=request.getParameter("id2");
//DB에 연결을 해서
final String DRIVER="com.mysql.jdbc.Driver";
final String DBID="root";
final String DBPW="1234";
final String DBURL="jdbc:mysql://localhost:3306/jspdb";


Class.forName(DRIVER);

out.println("드라이버 로드 성공!!");

Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);

out.println("<br>디비 연결 성공!!<br>");

String sql="select Password from members where ID=?";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1, id);
ResultSet rs=pstmt.executeQuery();
if(rs.next()){
	//아이디가 있는경우
if(pass.equals(rs.getString("Password"))){
	//3.sql 작성하고 pstmt 생성
	//id값에 해당하는 정보를 삭제
	sql="update members set ID=? where ID=? ";
	pstmt=con.prepareStatement(sql);
	pstmt.setString(1, id2);
	pstmt.setString(2, id);
	//4. sql실행
	pstmt.executeUpdate();
	out.print("아이디 변경 성공");
	
}else{
	//아이디는 같은데, 비밀번호가 다른경우
	out.print("비밀번호 오류");
}
}
else{
	//아이디가 없는경우
	out.print("아이가 없다");
}
%>
</body>
</html>