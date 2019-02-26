<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%request.setCharacterEncoding("UTF-8");
String ID = request.getParameter("ID");
String password = request.getParameter("password");
String contact = request.getParameter("contact");
String age = request.getParameter("age");
String name = request.getParameter("name");

%>
Your ID is <%=ID %><br>
<%-- Your race is <%=race %><br> --%>
Your contact number is <%=contact %><br>
<%-- 전달받은 숫자(정수 데이터로 변경) : 
<%=Integer.parseInt(num)+100 %> --%>
<hr>
<!-- 해당 아이디와 비밀번홀르 체크하는 페이지 생성
ID: admin , PW: admon
아이디 비밀번호 같음
-> 관리자 로그인을 하면 "관리자 님이 로그인 하셨습니다."
아이디 비밀번호 다름
->ID님이 로그인 하셨습니다. -->
<%
/* if((ID=="admin")&&(password=="admin")){
	out.println("관리자 님이 로그인 하셨군요");}
	else
		out.println(ID+"님이 로그인 하셨군요");
 */
if(ID.equals("admin")&&password.equals("admin")){
	out.println("관리자의 정보는 비공개 처리 됩니다");
}
else{
	out.println(ID+"님이 로그인 하셨군요. 정보 : 이름 "+name+", 비밀번호"+password
			+", 연락처 : "+contact+", 나이: "+age );
	if(Integer.parseInt(age)>=20){
		out.println("성인 회원입니다.");}
	else
		out.println("미성년자 회원입니다.");
	}

%>
</body>
</html>