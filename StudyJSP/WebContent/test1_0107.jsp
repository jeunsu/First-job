<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<%@ page import="java.util.Calendar"%>
</head>
<body>  
<%
Calendar c=Calendar.getInstance();
int hour=c.get(Calendar.HOUR_OF_DAY);
int min=c.get(Calendar.MINUTE);
int sec=c.get(Calendar.SECOND);
//System.out.println(hour+" : "+min+" : "+sec);

// ->콘솔창에 출력(개발자가 확인)
//out.println(hour+" : "+min+" : "+sec);
//->  웹페이지에 출력 자바 코드(사용자 확인)
%>

<%=hour %>시 <%= min%>분 <%=sec %>초

</body>
</html>