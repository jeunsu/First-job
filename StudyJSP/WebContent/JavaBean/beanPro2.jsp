<%@page import="beanTest.JavaBean1"%>
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
String pw=request.getParameter("pw");
int number=Integer.parseInt(request.getParameter("number"));
JavaBean1 jb1= new JavaBean1();
jb1.setId(id);
jb1.setNumber(number);
jb1.setPw(pw);
out.println("아이디:" +jb1.getId()+"<br>");
out.println("비밀번호: "+jb1.getPw()+"<br>");
out.println("좋아하는 숫자: "+jb1.getNumber()+"<br>");
%>
<br><hr>
ID : <%=id %><br>
PW: <%=pw %><br>
Favorite Number: <%=number %><br>
<jsp:useBean id="atbean" class="beanTest.JavaBean1">
</jsp:useBean>
<jsp:setProperty property="*" name="atbean"/>
<%-- <jsp:setProperty property="id" name="jb" />
<jsp:setProperty property="pw" name="jb" />
<jsp:setProperty property="number" name="jb" /><hr> --%><hr>
아이디: <jsp:getProperty property="id" name="atbean"/><br>
비밀번호: <jsp:getProperty property="pw" name="atbean"/><br>
좋아하는 숫자 : <jsp:getProperty property="number" name="atbean"/>

</body>
</html>