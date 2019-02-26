<%@page import="com.itwill.member.MemberBean"%>
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
<h1>WebContent/member/updatePro.jsp</h1>
<%request.setCharacterEncoding("UTF-8");
String id=(String)session.getAttribute("ID");
 //세션값 확인 (id)
//한글 처리
if(id==null){
	response.sendRedirect("loginForm.jsp");
}
 %>
 <jsp:useBean id="mb" class="com.itwill.member.MemberBean"></jsp:useBean>
 <jsp:setProperty property="*" name="mb"/>
  
 <%
MemberDAO mdao=new MemberDAO();
int check = mdao.updateMember(mb);
System.out.println(check);
//수정 정보를 저장 객체 생성
//수정정보를 저장

//MemberDAO 객체 생성
//updateMember

//check=1
//check=0
//check=-1

if(check==1){
	%>
	<script type="text/javascript">
	alert("수정 완료");
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
	
	<% 
}

//수정 결과에 따라서 처리 동작을 구분

//정상 수정 ->main 페이지 이동

//아이디, 비밀번호 틀린경우 -> 페이지 뒤로 이동
%>
</body>
</html>