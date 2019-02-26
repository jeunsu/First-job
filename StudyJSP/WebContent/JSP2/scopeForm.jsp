<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/JSP2/scopeForm.jsp</h1>
<h1>내장 객체 : page, request, session, application</h1>
<h2>해당 객체안에 데이터를 유효한 범위 안에서 서로 공유할 수 있음<br>
공유되는 데이터를 속성(Attribute), 속성을 공유해서 사용할 수 있는 유효
범위를 영역(Scope)
<br>
*해당 영역 안에서 속성값을 사용(공유)할 수있는 내장 객체는 영역객체.
</h2>

<h3>
역역							영역객체							속성의유효범위<br>
page                    	   	pageContext					해당 페이지 안에서만<br> 
request					request							클라이언트 요청이 처리되는 페이지<br>
session						session								세션이 유지되는 동안 모든페이지<br>
application				application						서버가 실행되는 동안 모든페이지<br>

</h3>


<fieldset>
<legend>입력창</legend>
<form action="scopePro.jsp" method="get">
아이디 : <input type="text" name="id"><br>
<input type="submit" value="Send">
</form>
</fieldset>

</body>
</html>