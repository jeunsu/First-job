<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 회원정보를 모두 가져와서 출력 
1. 드라이버 로드
2. 디비연결
3. sql구문, pstmt 객체 생성
4.pstmt 실행, resultSet 객체 생성 저장
5. 해당결과를 출력

-->




<%
final String DRIVER="com.mysql.jdbc.Driver";
final String DBID="root";
final String DBPW="1234";
final String DBURL="jdbc:mysql://localhost:3306/jspdb";

Class.forName(DRIVER);
out.println("드라이버 로드 성공!!");
Connection con=DriverManager.getConnection(DBURL,DBID,DBPW);
out.println("<br>디비 연결 성공!!<br>");
String sql="select * from members";
PreparedStatement pstmt=con.prepareStatement(sql);

ResultSet rs=pstmt.executeQuery();//한번에 한행씩 저장
while(rs.next()){
	//rs 데이터 꺼내오기
	//rs.getXXX(); xxx 각각의 데이터 타입
	//rs.getXXX("컬럼명");
	//rs.getXXX(인덱스);
	//=> 인텍스 방식으로 처리하는게 속도가 빠르다.
	// 데이터베이스 구조를 항상 기억하고 있어야 한다.
	
		

		

//select 문의 결과로 레코드셋 형태의 데이터를 가져온다.
//resultset 타입의 변수에 저장해서 사용
/* 
/			BOF(파일의 시작)			/ <=커서는 항상 BOF를 가리킨다
/--------------------------------/
/번호 이름 지역 성별/
/1 홍길동 부산 남/
/1 홍길동 부산 남/
/1 홍길동 부산 남/
/-------------------------------/
/			EOF(파일의 끝)			/  <=커서가 도착할 경우 DB데이터가 없음으로 판단 종료


*/
%>
<table border=1; width=600;>
<tr>
<td><%=rs.getInt("idx") %></td>
<td><%=rs.getString("Name") %></td>
<td><%=rs.getString(3) %></td>
<td><%=rs.getInt("Age") %></td>
<td><%=rs.getString("RegNum") %></td>
<td><%=rs.getString("ID") %></td>
<td><%=rs.getInt("Password") %></td>
</tr>
</table>
<%} %>



</body>
</html>