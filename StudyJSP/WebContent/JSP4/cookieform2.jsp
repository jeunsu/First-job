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
String language = request.getParameter("Tsuru");
Cookie cookie=new Cookie("language",language);
cookie.setComment("사용언어");

//시간을 설정
cookie.setMaxAge(600);response.addCookie(cookie);
%>
	<script type="text/javascript">
	alert("언어 쿠키값 생성");
	
	location.href="cookieform.jsp"</script>
</body>
</html>