<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");
//이름, 성별 저장 출력
String ID = request.getParameter("name");
String sex= request.getParameter("sex");
String subject= request.getParameter("subject");
String hobby= request.getParameter("hobby");
%>
 이름 : <%=ID %>
 성별:  <%=sex %>
 과목:  <%=subject %>
 취미: <%=hobby %>
</body>
</html>