<%@page import="com.itwill.board.BoardDAO"%>
<%@page import="com.itwill.board.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/updatePro.jsp</h1>
<%
request.setCharacterEncoding("UTF-8");

//pageNum 파라미터 저장

String pageNum=request.getParameter("pageNum");
//form태그에서 전달한 정보를 저장(BoardBean)
//=>액션태그(객체 생성, 값 저장)

//BoardDAO 객체 생성 후 처리 메서드 생성
%>
<jsp:useBean id="bb" class="com.itwill.board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
<%
//updateBoard(bb)
BoardDAO bdao=new BoardDAO();
int check=bdao.updateBoard(bb);

if(check==1){
	%>
	<script type="text/javascript">
	alert("수정완료");
	location.href="list.jsp?pageNum=<%=pageNum%>";
	</script>
	<%
}else if(check==0){

%><script type="text/javascript">
alert="비밀번호 오류";
history.back();
</script>
<%
}else{
%>
<script type="text/javascript">
alert("글번호 오류");
history.back();

</script>
<%}
%>



</body>
</html>