<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<fieldset>
<%
String lang="kor";

//쿠키값 가져와서 해당 정보가 있는지를 판단 사용
Cookie[] cookies= request.getCookies();
if(cookies !=null){
	for(int i=0; i<cookies.length;i++){
		if(cookies[i].getName().equals("language")){
			lang=cookies[i].getValue();
		}
	}
}

//submit 어떤 라이오버튼이 눌러졌는지 출력하는 문장을 변경
//안녕하세요 쿠키연습
//hello cookie test
if(lang.equals("Korean")){
	out.println("<h2>안녕하세요. 쿠키연습<h2>");
}else{
	out.println("<h2>Hello, Cookie<h2>");
}
%>


<form action="cookieform2.jsp" method="post">
<input type="radio" name="Tsuru" value="Korean" 
<%if(lang.equals("Korean")){ %>
checked
<%} %>
>한국어
<input type="radio" name="Tsuru" value="English"
<%if(lang.equals("English")){ %>
checked
<%} %>
>영어
<input type="submit" value="Language_Set" >
</form>

</fieldset>
</body>
</html>