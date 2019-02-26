<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 
form 태그 , 아이디, 비밀번호, 수정할 이름
updatePro.jsp, post, submit 버튼
데이터 수정동작
아이디와 비밀번호가 같을 경우에만 수정
수정할 이름정보만 가져다가 수정 처리
오류는 각각의 경우에 페이지에 출력

 -->
 <fieldset>
 <legend>멤버 정보 수정</legend>
 <form action="updatePro.jsp" method="post">
 ID : <input type="text" name="id"><br>
 PW : <input type="password" name="pass"><br>
 NewID:<input type="text" name="id2"><br>
  <input type="submit" value="Submit">
 </form>
 </fieldset>
</body>
</html>