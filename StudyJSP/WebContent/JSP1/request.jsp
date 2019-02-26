<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>내장 객체</h1>
<h3>javax.survlet 패키지에 포함되어 있음.</h3>
1. 서블릿 실행될 때 필요한 설정정보를 갖고있는 객체<br>
2. 사용자의 요청과 응답을 처리하는 객체 <br>
3. 자바(jsp)입출력 객체<br>

javax.servlet - 8개 객체<br>
java.lang - 1개 객체<br>

**내장객체 jsp페이지가 서블릿 클래스로 변경되면서 가장 먼저 사용(선언)<br>
->스크립틀릿 안에 동일한(내장객체)을 사용해서는 안됨.

<hr><hr>
<h1>내장객체</h1>
<h3>request : 웹 브라우저의 요청정보를 저장 객체</h3>
<h3>response : 웹 브라우저의 요청에 대한 응답 정보를 저장 객체 
(헤더의 정보, 리다이렉트 기능)</h3>
<h3>
out : jsp페이지를 출력할 때 사용하는 출력 스트림 객체
(표현식이랑 같은형태로 처리됨)</h3>
<h3>pageContext : jsp 페이지 정보를 저장하는 객체
(다른 내장객체의 정보를 가져오거나, 페이지의 흐름을 제어,에러데이터 구하기)</h3>

<h3>session : 하나의 웹 브라우저가 정보를 유지하기 위해서 세션 저장객체
		(웹 브라우저 1개당 1개의 객체)
</h3>

<h3>
application : 웹 어플리케이션 Context의 정보를 저장하는 객체
(웹 어플리케이션 1개당 1개의 객체, 서버의 설정, 자원정보, 발생하는 이벤트 로그,
 )</h3>
<h3>
config : jsp페이지의 설정정보를 저장 객체

</h3>
<h3>page : jsp 페이지를 구현한 자바 클래스 객체
(최근에는 거의 사용 안함)</h3>

<h3>exception : jsp페이지에서 예외가 발생한 경우 사용하는 객체</h3>
<hr><hr>
<%
//request 객체를 사용

%>
서버 도메인 명 : <%=request.getServerName() %><br>
서버 포트번호 :<%=request.getServerPort() %><br>
URL : <%=request.getRequestURL() %><br>
URI : <%=request.getRequestURI() %><br>

클라이언트 호스트명 : <%=request.getRemoteHost() %><br>
클라이언트 IP주소 : <%=request.getRemoteAddr() %><br>

프로토콜 : <%=request.getProtocol() %><br>
요청(전송)방식 : <%=request.getMethod() %><br>
프로젝트 경로(Context) : <%=request.getContextPath() %><br>
물리적인 경로 : <%=request.getRealPath("/") %><br>

http 헤더(user-agent) : <%=request.getHeader("user=agent") %><br>
http 헤더(user-language) : <%=request.getHeader("accept-language") %><br>
http 헤더(user-host) : <%=request.getHeader("host") %><br>
http 헤더(user-connection) : <%=request.getHeader("connection") %><br>
</body>
</html>