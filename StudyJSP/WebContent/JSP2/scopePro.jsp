<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>



</head>
<body>
<h1>WebContent/JSP2/scopePro.jsp</h1>
<%
//내장 객체의 속성값을 생성
//내장객체.setAttribute("이름",값);
pageContext.setAttribute("page", "pageContext 저장된 정보");
request.setAttribute("request", "request saved info");
session.setAttribute("session", "session saved info");
application.setAttribute("application", "application saved info");
String ID=request.getParameter("id");
%>
 ID : <%=ID %><br>
 
 <%
 //내장 객체의 속성값 가져오기
 //내장 객체.getAttribute("속성이름");
 %>
<%-- <script type="text/javascript">
 alert("scopeProPro.jsp 페이지로 이동");
 location.href="scopeProPro.jsp?id=<%=ID%>&pw=1234";
 
 
 </script> --%>
 <br>
 pageContext 내장객체값 : <%=pageContext.getAttribute("page") %><br>
 request 내장객체값 :  <%=request.getAttribute("request") %><br>
 session 내장객체값:  <%=session.getAttribute("session") %><br>
 application 내장객체값:  <%=application.getAttribute("application") %><br>
 <br><br>
 페이지이동
 <br><br>
 <h3>ID 정보와 PW (1234)값을 가지고 이동<br>
 이동한 페이지에서 출력</h3>
 
 <a href="scopeProPro.jsp?id=<%=ID%>&pw=1234">scopeProPro.jsp</a>
 
 <h3>JavaScript 사용하여 페이지 이동
 ID 정보, pw(1234) 가지고 이동
 </h3>
 
 
 <h3>
 내장 객체 response 객체를 사용해서 페이지 이동
 ID,PW =1234000
 </h3>
<%
//response.sendRedirect("scopeProPro.jsp?id="+ID+"&pw=1234000");
%>
 
 <h3>액션태그(forward)를 사용하여 이동</h3>
 <%
 //jsp 페이지에서 스크립트 코드를 사용하지 않고도 (html 코드)
 //다른 페이지에 데이터를 접근할 수 있도록 태그를 사용하는 기능
 //forward 액션태그
 // ->현재 페이지의 정보(request, response) 가지고 페이지를 이동
 //페이지 이동 주소의 차이가 발생
 //주소는 현제페이지, 본문은 이동할 페이지
 %>
  <jsp:forward page="scopeProPro.jsp">
 <jsp:param value="1234qwe" name="pw"/>
 
 </jsp:forward> 
</body>
</html>