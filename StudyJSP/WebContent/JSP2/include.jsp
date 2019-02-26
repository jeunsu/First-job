<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<%@include file="color.jspf" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="<%=col2%>">
	<h1>Webcontent/jsp2/include.jsp</h1>
	<%
	//include
	//1. 공통으로 사용되는 변수 파일에 선언
	//=> include 사용 <%@ (jsp지시어 사용)
		//page가 컴파일 되기 전에 include 하는 소스코드(파일)추가한 후
	//컴파일을 먼저 처리한다. 페이지 상에서 공통으로 사용되는 변수
	
	//2. 공통으로 사용되는 메뉴 파일로 생성 후 필요한 곳에 
	//=> include 사용 <jsp:include (액션 태그)
//jsp페이지를 서블릿으로 컴파일한 후에 해당 결과를 include하는 현황
	//디자인을 추가, 공통적인 페이지를 추가시 사용
	
	request.setCharacterEncoding("UTF-8");
	
	%>
	
	<table border="1" width="600" height="600">
		<tr>
			<td colspan="2" height="100">
			<!-- <h1>top 영역<h1> -->
			<!-- id: itwill 사람의 정보를 전달, top.jsp페이지에서 환영 메세지를 출력 
			["아이디"님 홈페이지 접속을 환영합니다.]
			-->
			<!-- include 하는 페이지에 정보 전달(파라메터) -->
			<jsp:include page="top.jsp">
			
			<jsp:param value="홍길동" name="idid"/>
			</jsp:include>
			jsp 		
			top 영역</td>
		</tr>
		<tr>
			<td width="100"><jsp:include page="left.jsp">
			<jsp:param value="" name=""/></jsp:include></td>
			<td>본문내용</td>
		</tr>
		<tr>
			<td colspan="2" height="100">
			<jsp:include page="bottom.jsp">
			<jsp:param value="" name=""/></jsp:include></td>
		</tr>
	</table>


</body>
</html>