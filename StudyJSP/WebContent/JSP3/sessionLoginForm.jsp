<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/JSP3/sessionLoginForm.jsp</h1>
<hr>
1.폼태그를 사용하여 id,pw입력
2.sessionLoginPro.jsp 페이지로 정보 전달
3. 정보전달시 정보는 보이지 않게 처리

<hr>
LoginPro.jsp
1. 전달받은 id,pw정보를 저장
2.dbid="jspid" dbpw="jsp1234" 정보와 같은지 다른지를 판단
3.아이디가 같을 경우 ->비밀번호 체크
비밀번호 같을경우->"아이디 비밀번호 맞음" 페이지 출력
로그인 인증 => 세션값 생성 id 값을 사용
sessionMain.jsp 페이지로 이동
비밀번호 다를경우-> "비밀번호 틀림" 페이지 출력
아이디가 다를 경우 ->"아이디 없음" 페이지에 출력
<hr>
<fieldset>
<legend>로그인</legend>
<form action="LoginPro.jsp"  method="post">
ID :<input type="text" name="fname"><br>
PW :<input type="password" name="fpw"><br>
<input type="submit" value="Submit">
</form>
</fieldset>

</body>
</html>