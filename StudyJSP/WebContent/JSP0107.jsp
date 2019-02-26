<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import = "java.util.Calendar" %>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%
	Calendar c= Calendar.getInstance(); 
	int hour=c.get(Calendar.HOUR_OF_DAY);
	int min = c.get(Calendar.MINUTE);
	int sec = c.get(Calendar.SECOND);
	
%>



</head>
<body>
Hello<br>
현재 시간은 <%=hour %>시 <%= min%>분 <%=sec %>초

<!-- html  주석문 -->

<%-- JSP 주석문 --%>
<%
//한줄짜리 java 주석문
/*여러줄짜리 java 주석문 */

%>

<h1>JSP-주석, JSP지시어, 스크립트 요소, 액션태그</h1>
<h2>JSP지시어 (Directive) : 
		JSP페이지가 실행될 때, 필요한 정보를 지정하는 역할
		JSP 컨테이너에게 정보를 전달. 
		(%@ %) 모양으로 사용 page, include, taglib 지시어 3가지로 나누어 사용
</h2>

<h3>page 지시어</h3>
(%@속성 ="값"  %)<br>
-language 속성 : 스크립트 요소에서 사용할 언어를 지정(생략가능)<br>
-contentType 속성: 생성할 문서의 타입을 지정<br>
-import : 클래스를 추가해서 사용하기 위함<br>

<h3>taglib 지시어</h3>
JSTL 이나 커스텀 태그를 사용하기 위해서 주로 사용.<br>

<h3>include 지시어</h3>
공통적으로 포함되어야 하는 파일의 내용을 해당 jsp페이지에 삽입하기 위한 기능<br>
(%@ include %)<br>
->두 개의 파일이 하나의 파일로 합쳐진 이후에 변환되어서 컴파일된다.<br>

<h2>스크립트 요소  : 선언문, 스크립틀릿, 표현식</h2>
 
 <h3>선언문<br>
 자바코드에서 멤버변수와 메서드를선언하기 위해서 사용 (전역변수/메서드)<br>
 
 (%! <br>
 	멤버변수; <br>
 	멤버메서드(); <br>
 
 %) <br>
 
 </h3>
 
 <%!
 String str="JSP";
 public String getStr(){
	 str+="시간입니다<br>";
	 return str;
 }
 %>
 <%=str %>
 <%=getStr() %>
 <h3>표현식 : (%= %)</h3>
 변수의 값, 메서드의 리턴값,...<br>
 (%= 변수%), (%= 리턴값이 있는 메서드 %), (%= 수식%)
 
 <h3>스크립트릿 : (% %)</h3>
  작동하는 자바 소스코드를 작성 가능
 
 <%
 //변수 ; (지역변수)
 //코드1;
 //코드2;...
  %>

</body>
</html>