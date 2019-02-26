<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/jsp1/for.jsp</h1>
html 코드시작
1
2
<%
//자바코드
System.out.println("3");
%>
4
5
html 코드끝
<script type="text/javascript">
//자바스크립트를 사용 웹페이지에 출력
document.write("6");
</script>
<hr>
<%
//자바코드를 실행 가능
//문자배열 1개 생성 "JAVA","JSP","HTML","DB"저장
String[] language = {"JAVA","JSP","HTML","DB"};
String[] language2 =new String[] {"JAVA","JSP","HTML","DB"};
String[] language3 =new String[] {"JAVA","JSP","HTML","DB"};
for(int i = 0;i<language.length;i++){

	out.println(language[i]+" ,<br>");
}

out.println("<br> ");
for(int i = 0;i<language2.length;i++){
	System.out.println(language2[i]+", ");
	out.println(language2[i]+" - ");
}
%>
<hr>
<%
for(int i = 0;i<language3.length;i++){
	%>
	language3[<%=i %>] = <%=language3[i]%><br>
<% } %>

<hr>
<h1>표 그리기</h1>

<table border="1">
<tr>
		<td> 0</td>
		<td>제목</td>
		<td>내용</td>
	</tr>	
	<% for(int  i=1;i<5;i++){ %>
	<tr>
		<td><%= i %></td>
		<td>제목</td>
		<td><%=language3[i-1] %></td>
	</tr>	
	<%} %>
	
</table>
</body>
</html>