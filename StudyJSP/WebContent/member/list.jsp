<%@page import="com.itwill.member.MemberBean"%>
<%@page import="java.util.List"%>
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
<h1>WebContent/member/list.jsp</h1>
<%
//세션값 -> 로그인
String id=(String)session.getAttribute("ID");
if(id==null&&id.equals("admin")){
	response.sendRedirect("loginForm.jsp");
}
//로그인X 관리지가 아닐 경우에 페이지 이동

//memberDAO객체 생성
MemberDAO mdao=new MemberDAO();
List<MemberBean> memberList=mdao.getMemberList();
//모든 회원정보를 저장

//표에서 출력



%>

<table border="1">
<tr>
<th>ID</th><th>Password</th><th>Gender</th><th>Age</th><th>RegNum</th>
<th>Email</th><th>reg_date</th>
</tr>
<%
for(int i=0;i<memberList.size();i++){
	MemberBean mb=(MemberBean)memberList.get(i);
%>
<tr>
<td><%=mb.getId() %></td><td><%=mb.getPass() %></td><td><%=mb.getGender() %></td><td><%=mb.getAge() %></td><td>RegNum</td>
<td><%=mb.getEmail() %></td><td><%=mb.getReg_date() %></td>
</tr>
<%} 
%>
</table>
</body>
</html>