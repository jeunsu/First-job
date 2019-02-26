<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/JSP2/scopeProPro.jsp</h1>
I D : <%=request.getParameter("id") %><br>
password: <%=request.getParameter("pw") %><br>


 pageContext 내장객체값 : <%=pageContext.getAttribute("page") %><br>
 request 내장객체값 :  <%=request.getAttribute("request") %><br>
 session 내장객체값:  <%=session.getAttribute("session") %><br>
 application 내장객체값:  <%=application.getAttribute("application") %><br>
</body>
</html>