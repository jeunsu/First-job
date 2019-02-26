<%@page import="com.itwill.board.BoardBean"%>
<%@page import="com.itwill.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/board/content.jsp</h1>
<%
//선택한 글의 내용을 보여주는 페이지
//num, pageNum 파라미터 저장
int num = Integer.parseInt(request.getParameter("textnum"));
String pageNum=request.getParameter("pageNum");


//DB처리 객체 생성
BoardDAO bdao= new BoardDAO();

//조회수를 변경(1증가)->Db메서드
bdao.updateReadcount(num);
BoardBean bb=bdao.getBoard(num);
//글번호에 해당하는 정보를 가져오기
//표 사용하여 출력
%>
<h1>글 본문 내용 보기</h1>
<table>
<tr>
<td>글번호</td><td><%=bb.getTextnum()%></td>
<td>조회수</td><td><%=bb.getReadcount()%></td>
</tr>
<tr>
<td>글쓴이</td><td><%=bb.getWriter() %></td>
<td>작성일</td><td><%=bb.getDate()%></td>
</tr>
<tr>
<td>글제목</td><td colspan="3"><%=bb.getSubject() %></td>
</tr>
<tr>
<td>첨부파일</td><td colspan="3"><%=bb.getFile() %></td>
</tr>
<tr>
<td>글 내용</td><td colspan="3"><%=bb.getContent() %></td>
</tr>
<tr>
   <td colspan="4">
     <input type="button" value="글수정" 
            onclick="location.href='updateForm.jsp?textnum=<%=num %>&pageNum=<%=pageNum %>'"
     >
     <input type="button" value="글삭제"
     	onclick="location.href='deleteForm.jsp?textnum=<%=num %>&pageNum=<%=pageNum %>'"
     >
     <input type="button" value="답글달기"
     onclick="location.href=rewriteForm.jsp?textnum=<%=num %>
     &re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev() %>
     &re_seq=<%=bb.getRe_seq() %>"
     >
     <input type="button" value="글목록" 
            onclick="location.href='list.jsp?pageNum=<%=pageNum %>'"
     >     
   </td>
  </tr>
  

</table>
</body>
</html>