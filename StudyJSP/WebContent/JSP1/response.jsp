<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/response.jsp</h1>

<%
//response객체 : 클라이언트의 응답 정보를 저장
//response.setHeader("해더이름",값);
/* response.addCookie("쿠키값");
reponse.sendRedirect("URL 주소");
response.setContentType("text.html; charset=UTF-8");
 */
 
 //페이지 이동
 //response.sendRedirect("request.jsp");
%>
세션 ID 값 : <%=session.getId() %><br>
세션 생성 시간 = <%=session.getCreationTime() %>
세션 유지 시간(1800초,30분) :<%=session.getMaxInactiveInterval() %>

<%
//세션 유지시간을 변경
session.setMaxInactiveInterval(3000); 
%><br>
<%=session.getMaxInactiveInterval() %>
 서버 정보 : <%=application.getServerInfo() %><br>
 물리적 경로 : <%=application.getRealPath("/") %><br>
 
 
 <%
 //out 객체
 out.println("출력정보");%>
 버퍼 사이즈:<%=out.getBufferSize() %> byte<br>
 사용하고 남은량 : <%=out.getRemaining() %>byte <br>
 
 <%
 out.close();
 
 %>
 
 
 
 
 
</body>
</html>