<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/JavaBean/beanForm1.jsp</h1>
<%
//한페이지 안에서 모든 동작을 처리 => 코드의 재사용성을 감소

//자바빈 규약(자바코드, 클래스)

//1.반드시 패키지가 존재 해야함.(기본페키지 사용 X)
//2. 기본 생성자가 있어야 함.
//3. 멤버변수가 항상 private사용해야 함.
//4. setter/getter 생성해야 한다.(public 사용)
// 액션 태그
//[자바빈 객체를 생성하는 액션태그]
//<jsp:useBean id="빈이름(객체명)" class="자바빈 클래스 위치"
//			scope="범위">




%>
<%-- <jsp:include page=""></jsp:include>
<jsp:forward page=""></jsp:forward> --%>
<fieldset>
<legend>자바빈 테스트1</legend>
<form action="beanPro1.jsp" method="post">
ID: <input type="text" name="id"><br>
<input type="submit" value="Send">

</form>
</fieldset>
</body>
</html>