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
//세션(session)
//웹 서버 쪽에서 웹 컨테이너의 상태를 유지하기 위해서
//저장하고있는 정보(웹 브라우저당 1개씩 생성)
//=>웹 브라우져나 웹 서버의 상태를 유지하기에 효율적인 형태,
//보안상의 문제도 해결가능(특수한 식별자생성 사용)

//세션 값 생성
//session.setAttribute("이름","값");

//세션 값 가져오기
//session.getAttribute("이름");
//특정 세션 값 삭제하기
//session.removeAttribute("이름");
//session.invalidate();//전체 삭제
//세션값이 존재 할 경우 세션값을 출력
//세션값이 없을 경우 "세션값 없음"
String str = (String)session.getAttribute("tmp");

String str2=(String)session.getAttribute("val");
if (str==null||str2==null){
	str="세션값 없음";
	str2="세션값 없음";
}
%>
sessionSet.jsp 페이지 이동<br>
<h1>세션값1 : </h1>
<%=str%>
<h1>세션값2 : </h1><%=str2 %><br>
<input type="button" value="세션값 저장" onclick="location.href='sessionSet.jsp'"><br><br>
sessionDel.jsp페이지 이동<br><br>
<input type="button" value="세션값 제거" onclick="location.href='sessionDel.jsp'"><br><br>
sessionInVal.jsp 페이지 이동<br><br>
<input type="button" value="세션값 전체제거" onclick="location.href='sessionInVal.jsp'"><br><br>


</body>
</html>