<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>
<!--  000님이 로그인 하셨습니다. (id값-session)
id값이 없을 경우(세션정보가 없을 경우 ) 로그인 페이지로 이동-->
<%
String ID =(String) session.getAttribute("id");
String PW =(String) session.getAttribute("pw");
if(ID==null){
	response.sendRedirect("sessionLoginForm.jsp");
}

%>
<h2><%=ID %>님이 로그인 하셨습니다.</h2><br>
<h2>로그아웃 </h2> 
<!-- <form action="sessionLoginForm.jsp" method="post"> -->
<input type="submit" value="Logout" onclick="location.href='sessionLogout.jsp'">
<!-- </form> -->
</body>
</html>