<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/JSP5/InsertForm.jsp</h1>
<% 
//MEMBER 테이블을 수정
//id, pw, date 필드를 추가

//form 태그 사용
//아이디, 비밀번호, 이름 입력창
//insertPro.jsp/post
//전송버튼
%>
<fieldset>
<legend>I know you already..</legend>
<form action="InsertPro.jsp" method="post">
ID : <input type="text" name="ID" ><br>
Password : <input type="password" name="Pass" ><br>
Name : <input type="text" name="Name" ><br>
<input type="submit" value="Send">
</form>
</fieldset>
</body>
</html>