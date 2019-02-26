<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%String id =request.getParameter("fname");
String pw=request.getParameter("fpw");
String ID ="jspid"; 
String PW="jsp1234";

if(id.equals(ID)){
	out.println("Insert your  password");
	if(pw.equals(PW)){
			out.println("Correct ID and PW!");
			session.setAttribute("id",id);
			session.setAttribute("pw",pw);	
			response.sendRedirect("sessionMain.jsp");
	}
			else{
				out.println("Not Correct PW");
			}
	}

else{
	out.println("NO corresponding ID");
	
}
%>
</body>
</html>