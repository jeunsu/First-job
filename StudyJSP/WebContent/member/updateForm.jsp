<%@page import="com.itwill.member.MemberBean"%>
<%@page import="com.itwill.member.MemberDAO"%>
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
//로그인시 수정 처리
//세션값이 없을 경우에 loginForm.jsp 페이지로 이동
//form 태그 각각의 값으로 표현
//id 값은 수정 불가, 비밀번호는 표현X
//gender 가 null일 경우 'Other' 선택하도록
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("ID");
if(id==null){
	response.sendRedirect("loginForm.jsp");
}
//디비처리객체 MemberDAO 객체 생성
//getMember(id); 메서드 호출=>회원정보 저장
//만약에 성별이 gender 없을 경우"남"
MemberDAO mdao=new MemberDAO();
MemberBean mb=mdao.getMember(id);
String gender=mb.getGender();

if(gender==null){
	gender="O";
}

/* 
final String DRIVER="com.mysql.jdbc.Driver";
final String DBID="root";
final String DBPW="1234";
final String DBURL="jdbc:mysql://localhost:3306/jspdb";


Class.forName(DRIVER);

out.println("드라이버 로드 성공!!");

Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);

out.println("<br>디비 연결 성공!!<br>");
 
String sql="select * from members where id=?";
PreparedStatement pstm=con.prepareStatement(sql);
pstm.setString(1,id);
ResultSet rs=pstm.executeQuery();
String name="";
String gender="";
String regnum="";
String pass="";
int  age=0;
String Email="";
Timestamp reg_date=null;
if(rs.next()){
pass=rs.getString("Password");
name=rs.getString("Name");
gender=rs.getString("Gender");
age=rs.getInt("Age");
regnum=rs.getString("RegNum");
reg_date=rs.getTimestamp("reg_date");
Email=rs.getString("Email");
}
if(gender==null){
	gender="남";
}*/
%>





<h1>회원수정</h1>
<fieldset>
<legend>So be it</legend>
<form action="updatePro.jsp" method="post">
ID: <input type="text" name="id" value="<%=id %>"><br>
PW: <input type="password" name="pass"><br>
Name: <input type="text" name="name" value="<%=mb.getName()%>"><br>
Age: <input type="text" name="age" value="<%=mb.getAge()%>"><br>
Gender: <input type="radio" name="gender" value="M" 
<%if(mb.getGender().equals("M")){ %>
checked
<%} %>
>Male

<input type="radio" name="gender" value="F"
<%if(mb.getGender().equals("F")){%>
checked<%} %>
>female

<input type="radio" name="gender" value="O">Other<br>

E-mail: <input type="text" name="email" value="<%=mb.getEmail()%>"><br>
<input type="submit" value="Modify">
</form>
</fieldset>
</body>
</html>