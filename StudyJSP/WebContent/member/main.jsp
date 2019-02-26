<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>@@Main page@@</h1>
<%
//로그인 -> 세션 id값 존재
//id 님이 로그인 하셨습니다(페이지 출력)
//로그인 실패 -> 다시 로그인 입력창으로 이동
String id = (String)session.getAttribute("ID");
out.print(id+"님이 로그인 하셨습니다");
if(id==null){
	response.sendRedirect("loginForm.jsp");
}
%>
<h2><%=id %>님이 로그인 하셨습니다.</h2>
 

<!-- 로그아웃 버튼 -->
<button onclick="location='logout.jsp'">Log out</button>
<br><br><br>
<a href="info.jsp"> 회원정보 조회</a>
<br><br><br>

<a href="updateForm.jsp">회원정보 수정</a>

<br><br><br>
<%
if(id!=null){
if(id.equals("admin")){ %>
<a href="list.jsp">관리자 : 회원목록 보기</a>
<%} }%>
</body>
</html>