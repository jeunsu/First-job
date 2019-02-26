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
<h1>WebContent/JavaBean/beanPro1.jsp</h1>
<%
request.setCharacterEncoding("UTF-8");
String id=request.getParameter("id");

//자바빈 객체를 생성해서 처리(디비처리 동작)
//beanTest.JavaBean1 객체 생성
//id 값을 사용할 수 있도록 생성
//JavaBean1 jb=new JavaBean1();
//객체 생성할 수 있는 액션태그 jsp:useBean
%>
<jsp:useBean id="jb" class="beanTest.JavaBean1"></jsp:useBean>
<%//Html코드로 자바 객체를 생성한거다
//JavaBean1 jb= new  JavaBean1();
//파라미터 값 -> 멤버변수로 저장
//jb.setId(id);
//액션태그 jsp:setProperty
//자바코드
//request.getParameter("id");
//jb.setID(id);
// 이 두줄을 한번에 Html로 표현한다
//jsp:setProperty
//Property="자바빈에 저장할 변수 이름"
//name="자바빈 객체 이름"
//param="파라미터 이름"
%>
<%-- <jsp:setProperty property="id" name="jb" param="id"/> --%>
<jsp:setProperty property="id" name="jb" />
<!-- property="id" parma="id" 같을 경우에만 param="id" 생략  가능 
		property="*" 모든 파라미터 이름, 속성값(자바빈 멤버 변수 이름)이 동일할 경우
<jsp:setProperty property="*" name="jb" param="*" />
<jsp:setProperty property="*" name="jb" />
둘이 같은 코드이다
-->
<% 
//출력(멤버변수에 있는 값을 출력)
out.println("자바빈에 있는 id 값: "+jb.getId());
%>
<br>파라미터 값=<%=id %><br>
<%
//출력(멤버변수에 있는 값을 출력)
//출력액션태그
//<jsp:getProperty property="자바빈 속성명" name="id값"/>
%>
액션태그 사용 자바빈 id값:
<jsp:getProperty property="id" name="jb"/>



</body>
</html>