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
request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("ID");
 if(id==null){
	response.sendRedirect("loginForm.jsp");
}
 String pass=request.getParameter("pass");

//한글처리
//세션 값 x ->로그인 페이지
//id, pass값 저장
MemberDAO mdao=new MemberDAO();

int check = mdao.deleteMember(id,pass);
if(check==1){
	%>
	<script type="text/javascript">
	alert("삭제 완료");
	location.href="main.jsp";
	</script>
	<% 
	}else if(check==0){
	%>
<script type="text/javascript">	 alert("pass가 다릅니다");
history.back();
</script>
<% 
}else{
	%>
	<script type="text/javascript">
	alert("ID 오류");
	history.back();
	</script>
<%//memberDAO 객체 생성

//삭제 처리 메서드(id,pass)

//deleteMember(id,pass)

//삭제완료=1, 비밀번호 오류=0, 아이디가 없을경우 = -1
}%>
</body>
</html>