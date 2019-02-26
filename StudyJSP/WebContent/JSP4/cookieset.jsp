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
//쿠키값 생성
Cookie cookie=new Cookie("name","CookieValue");
// 메모리 HDD저장 되는것 아니다. =>페이지로 전달될 때 저장

//시간설정
cookie.setMaxAge(600); //600초 

//시간정보 가져오기 -getMaxAge();

//쿠키이름-getName(), 쿠키값-getValue()/setValue(값)

//클라이언트에 저장
response.addCookie(cookie);

%>
<script type="text/javascript">
alert("쿠키값 생성!");
location.href="cookieTest.jsp";

</script>
</body>
</html>