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
//http 프로토콜은 웹브라우져가 요청에 대한 응답을 하고나면, 
//해당 클라이언트와의 연결을 끊는다.

//상태가 없는 프로토콜을 계속해서 상태를 유지시키기 위해서
//쿠키정보를 웹브라우져(하드디스크)에 저장

//쿠키값 : 이름, 값, 유효기간, 도메인, 경로
//알파벳과 숫자로 이름이 구성되어 있다.

//쿠키값의 사용
//1.쿠키객체생성
//2.객체에 필요정보를 저장(유효시간, 도메인, 패스...)
//3. 웹브라우저에 쿠키를 전달

//웹브라우저에서의 쿠키
//1.웹페이지 요청이 들어온다.(request)
//2. 서버가 처리후에 response 객체를 사용하여 전달
//3. 쿠키는 이름, 값의 쌍의 형태로배열에 저장되어 이동
//4. 쿠키이름을 사용하여 정보를 사용.

//쿠키 : 클라이언트 쪽에서 관리되는 정보
//-> 페이지에 상관없이 저장, 보안상의 위험이 없는 데이터만 저장
// 서버의 부담을(부하)줄여준다.
//->사용자의 하드디스크에 저장된다 (보안에 취약)
//세션 : 서버쪽에서 관리되는 정보
//페이지에 상관없이 저장, 보안과 관련된(중요데이터 사용가능)
//로그인정보

//쿠키값 가져오기
Cookie[] cookies=request.getCookies();
//쿠키값 저장
String name="";
String value="";
/* if(cookies!=null){
	for(String cookies: array){
		name = cookies.getName();
		value=cookies.getValue();
		//System.out.println(cookie.getName()+":"+cookie.getValue());
	}
} */

 if(cookies !=null){
	for(int i=0;i<cookies.length;i++){
		if(cookies[i].getName().equals("name")){
		name=cookies[i].getName();
		value=cookies[i].getValue();
		}
	}
}   

%> 

<h1>쿠키 이름: <%=name%> </h1>
<h1>쿠키 값:<%=value %></h1>

<input type="button" value="쿠키값 저장"
onclick="location.href='cookieset.jsp'">

<input type="button" value="쿠키값 삭제"
onclick="location.href='cookiedel.jsp'">
</body>
</html>