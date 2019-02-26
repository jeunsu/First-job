<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
//세션값 생성
//tmp : "session value";
session.setAttribute("tmp"," session value");
session.setAttribute("val", "session value2");

//"생성값 생성 alert 메세지 출력"

//sessionTest.jsp페이지로 이동

%>
<script type="text/javascript">
alert("세션값 생성");
location.href="sessionTest.jsp";
</script>

</body>
</html>