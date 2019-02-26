<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Logout</title>
</head>
<body>
<h1>logout! </h1>
<%
session.invalidate();
//세션값 삭제(초기화)
//alert('log out!')
%>
<script type="text/javascript">
alert("log out!");
location.href="main.jsp";
</script>
</body>
</html>