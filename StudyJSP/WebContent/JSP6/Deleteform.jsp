<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>@@회원 탈퇴 @@</h2>
<%
//form 태그에 id,pass 가지고 처리 페이지로 전달
//session ->id(수정 X), pass 사용자 입력 
//deletePro.jsp페이지로 이동
String id=(String)session.getAttribute("ID");
%>
<fieldset>
<form action="deletePro.jsp" method="post">
ID : <input type="text" name="id" value="<%=id %>"><br>
ID : <input type="password" name="pass"><br>
<input type="submit" value="signout">
</form>


</fieldset>

</body>
</html>