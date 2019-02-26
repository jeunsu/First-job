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
//쿠키값 삭제


//존재하는 해당 쿠키값을 가져오기
Cookie[] cookie=request.getCookies();
if(cookie!=null){
	for(int i=0;i<cookie.length;i++){
	if(cookie[i].getName().equals("name")){
			cookie[i].setMaxAge(0);
			response.addCookie(cookie[i]);
			}
	
}
}
//존재하는 해당 쿠키값을 가져오기
//쿠키값이 있을때만 값을 삭제
//"name"="CookieValue"
//"name" 쿠키값 이름이 존재할 경우 삭제를 하겟다
//해당 쿠키의 시간을 0으로 설정, 클라이언트에게 전달


%>
<script type="text/javascript">
alert("쿠키값 제거!");
location.href="cookieTest.jsp";
</script>
</body>
</html>