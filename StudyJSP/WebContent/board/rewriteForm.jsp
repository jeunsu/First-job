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
int num=Integer.parseInt(request.getParameter("textnum"));
int re_ref=Integer.parseInt(request.getParameter("re_ref"));
int re_lev=Integer.parseInt(request.getParameter("re_lev"));
int re_seq=Integer.parseInt(request.getParameter("re_seq"));



%>

<fieldset>
<legend>게시판  답글쓰기</legend>
<form action="reWritePro.jsp" method="post">
<input type="hidden" name="num" value="<%=num %>">
<input type="hidden" name="num" value="<%=re_ref %>">
<input type="hidden" name="num" value="<%=re_lev %>">
<input type="hidden" name="num" value="<%=re_seq %>">
글쓴이 : <input type="text" name="writer"><br>
비밀번호 : <input type="password" name="pass"><br>
제목: <input type="text" name="subject" value="[답글]"><br>
내용: <br><textarea rows="10" cols="40" name=content></textarea><br>


<input type="submit" value="답글쓰기">


</form>
</fieldset>
</body>
</html>