<%@page import="com.itwill.board.BoardDAO"%>
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


%>

<jsp:useBean id="bb" class="com.itwill.board.BoardBean"></jsp:useBean>
<jsp:setProperty property="*" name="bb"/>
<%

//ip 주소 입력
bb.setIp(request.getRemoteAddr());
System.out.println(bb.getIp());
BoardDAO bdao=new BoardDAO();
bdao.insertWrite(bb);
//DB에 저장

//페이지 이동 list.jsp
response.sendRedirect("list.jsp");
%>
</body>
</html>