<%@page import="com.itwill.member.MemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="com.itwill.member.MemberDAO"%>
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
/* request.setCharacterEncoding("UTF-8");
String name=request.getParameter("name");
int age = Integer.parseInt(request.getParameter("age"));
String id=request.getParameter("id");
Timestamp reg_date= new Timestamp(System.currentTimeMillis());
String pass=request.getParameter("pass");
String email=request.getParameter("email");
String gender=request.getParameter("gender");
String regnum=request.getParameter("RegNum"); */
//DB에 연결을 해서

/* MemberBean mb = new MemberBean();
mb.setId(id);
mb.setName(name);
mb.setEmail(email);
mb.setGender(gender);
mb.setPass(pass);
mb.setReg_date(reg_date);
mb.setAge(age); */
%>
<!--액션태그 자바빈 객체 생성(m)  -->
<jsp:useBean id="m" class="com.itwill.member.MemberBean"></jsp:useBean>
<!-- 전달받은 파라미터값 저장  -->
<jsp:setProperty property="*" name="m"/>




<% 
//날자 정보를 저장(Form 태그에서 전달하지 않는 정보)
m.setReg_date(new Timestamp(System.currentTimeMillis()));
/* final String DRIVER="com.mysql.jdbc.Driver";
final String DBID="root";
final String DBPW="1234";
final String DBURL="jdbc:mysql://localhost:3306/jspdb";


Class.forName(DRIVER);

out.println("드라이버 로드 성공!!");

Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);
 */
out.println("<br>디비 연결 성공!!<br>");
MemberDAO mdao=new MemberDAO(); 
mdao.insertMember(m);
/* String sql="insert into members (Name,Gender,Age,ID,Password,Email,reg_date) values(?,?,?,?,?,?,?)";
PreparedStatement pstmt=con.prepareStatement(sql);
pstmt.setString(1,m.getName());
pstmt.setString(2,m.getGender());
pstmt.setInt(3,m.getAge());
pstmt.setString(4,m.getId());
pstmt.setString(5,m.getPass());
pstmt.setString(6,m.getEmail());
pstmt.setTimestamp(7,m.getReg_date());
pstmt.executeUpdate();
out.println("<script>alert('Succeed Membership sign in');</script>");
 */
%>
<%-- <%회원가입성공<br>
회원ID : <%=id %><br>
회원Pass : <%=pass %><br>
회원Name : <%=name %><br>
회원Age : <%=age %><br>
회원Email : <%=email %><br>
회원Gender : <%=gender %><br>
회원RegNum : <%=regnum %><br>
가입날짜 : <%=reg_date %><br>%> --%>
<script>location.href="loginForm.jsp"</script>
</body>
</html>