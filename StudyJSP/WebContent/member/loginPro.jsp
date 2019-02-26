<%@page import="com.itwill.member.MemberDAO"%>
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
//한글처리
request.setCharacterEncoding("UTF-8");

//id, pass값을 저장
String id=request.getParameter("id");
String pass=request.getParameter("pass");
//로그인 동작
MemberDAO mdao=new MemberDAO();

//디비 처리 객체 생성
//회원여부를 체크하는 메서드
mdao.idCheck(id,pass);

//idCheck(id,pass);
int check=mdao.idCheck(id,pass);

if(check==1){
session.setAttribute("ID", id);
response.sendRedirect("main.jsp");
}else if(check==-1){
	%>
	<script type="text/javascript">
	alert("Wrong ID!!!!");
	history.back();
	</script>
	<%
}else{
	%>
	<script type="text/javascript">
	alert("Wrong Password");
	histroy.back();
	</script>
	<%
}
//회원(1)/아이디가 없는 사람(-1)/비밀번호가 틀린 경우(0)
%>

</body>
</html>