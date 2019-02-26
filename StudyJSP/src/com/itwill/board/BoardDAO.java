package com.itwill.board;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
Connection con=null;
PreparedStatement pstmt=null;
ResultSet rs=null;
String sql="";
private Connection getCon() throws Exception{
	/*final String DRIVER="com.mysql.jdbc.Driver";
	final String DBID="root";
	final String DBPW="1234";
	final String DBURL="jdbc:mysql://localhost:3306/jspdb";
	
	Class.forName(DRIVER);
	con=DriverManager.getConnection(DBURL,DBID,DBPW);
	System.out.println("디비 연결 & 드라이버 로드 성공");
	return con;*/
	
	//커넥션풀
	// http://commons.apache.org/
	//commons-collections-3.2.1.jar
	//commons-dbcp-1.4.jar
	////commons-pull-1.6.jar
	
	//Webcontent->Meta-if->context.xml
	//1,2단계 처리파일 ->디비연동, 이름 정의
	//2. webcontent -> web-inf ->web.xml파일 수정
	//해당 DB작업 처리(DAO) 연결정보의 이름 호출
	//context객체 생성
	Context init =new InitialContext();  
	//DataSource 디비 연동이름 호출
	DataSource ds=
	(DataSource)init.lookup("java:comp/env/jdbc/mysqlDB");
	
	//ds 사용하여 연결정보 저장
	con=ds.getConnection();
	return con;
}
public void closeDB(){
	
	try {
		if(rs!=null){
		rs.close();}
		if(pstmt!=null){
			pstmt.close();
		}
		if(con!=null){
			con.close();
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}









public void insertWrite(BoardBean bb){
	int num=0;
	try {
		
		con=getCon();
		//num 게시판 글번호 계산
		sql="select max(textnum) from bulletboard";
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();		
		if(rs.next()){
		num = rs.getInt(1)+1;
		//	num = rs.getInt(num)+1;//에러
		//	num = rs.getInt("max(num)")+1;//가능
			System.out.println("num = "+num);
}
		sql="insert into bulletboard (writer, subject, content, pass, "
				+ "ip,readcount,re_ref,re_lev,re_seq,date,file,textnum"
				+ ") values(?,?,?,?,?,?,?,?,?,now(),?,?)";
		pstmt=con.prepareStatement(sql);
		pstmt.setString(1,bb.getWriter());
		pstmt.setString(2,bb.getSubject());
		pstmt.setString(3,bb.getContent());
		pstmt.setString(4,bb.getPass());
		pstmt.setString(5,bb.getIp());
		pstmt.setInt(6, 0);//글 조회수 0으로 초기화
		pstmt.setInt(7,num);//re_ref 답변글 그룹==일반글의 글번호와 동일
		pstmt.setInt(8,0);//re_lev 답변글 들여쓰기, 일반글은 들여쓰기 x
		pstmt.setInt(9,0);//re_seq 답변글 순서, 일반글 순서가 제일 위쪽
		pstmt.setString(10,bb.getFile());
		pstmt.setInt(11, bb.getTextnum());
		pstmt.executeUpdate();
		System.out.println("게시판 등록 완료"+num+"번 글 작성 완료");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		closeDB();
	}
	
	
	
}
//get BoardCount()
public int getBoardCount(){
	//디비연결, 드라이버로드
	int count=0;
	try {
		con=getCon();
		//SQL 작성
		sql="select count(*) from bulletboard";
		pstmt=con.prepareStatement(sql);
		//실행
		rs=pstmt.executeQuery();
		if(rs.next()){
			count=rs.getInt(1);
		}
		System.out.println("작성된 글 수 : "+count);
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		closeDB();
	}
	return count;
	
}
//getBoardList()
public List getBoardList(){
	List boardList = new ArrayList();
	try {
		con=getCon();
		sql="select * from bulletboard";
		pstmt=con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			//글정보가 있다.
			//글정보를 한번에 저장하는 객체 (BoardBean)
			//arraylist 한칸에 저장
		BoardBean bb = new BoardBean();
			bb.setTextnum(rs.getInt("textnum"));
			bb.setWriter(rs.getString("writer"));	 
			bb.setContent(rs.getString("content"));
			bb.setPass(rs.getString("pass"));
			bb.setRe_lev(rs.getInt("re_rev"));
			bb.setRe_ref(rs.getInt("re_ref"));
			bb.setRe_seq(rs.getInt("re_seq"));
			bb.setFile(rs.getString("file"));
			bb.setDate(rs.getDate("date"));
			bb.setIp(rs.getString("IP"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setSubject(rs.getString("subject"));
			//bb->arrayList 한칸 저장
			boardList.add(bb);
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally
	{closeDB();}
	
	return boardList;
}
//getBoardList()

//getBoardList(startRow, pageSize)

public List getBoardList(int startRow, int pageSize){
	List boardList = new ArrayList();
	try {
		con=getCon();
		//최신글이 제일 위쪽에 위치
		//정렬 : 그룹별로 내림차순, 글순서대로 오름차순
		//글 잘라오기(필요한만큼만 가져오기)(limit(시작행 - )
		sql="select * from bulletboard order by re_ref desc,re_seq asc "
				+ "limit ?,?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,startRow-1);
		pstmt.setInt(2,pageSize);		
		
		rs=pstmt.executeQuery();
		while(rs.next()){
			//글정보가 있다.
			//글정보를 한번에 저장하는 객체 (BoardBean)
			//arraylist 한칸에 저장
		BoardBean bb = new BoardBean();
			bb.setTextnum(rs.getInt("textnum"));
			bb.setWriter(rs.getString("writer"));	 
			bb.setContent(rs.getString("content"));
			bb.setPass(rs.getString("pass"));
			bb.setRe_lev(rs.getInt("re_lev"));
			bb.setRe_ref(rs.getInt("re_ref"));
			bb.setRe_seq(rs.getInt("re_seq"));
			bb.setFile(rs.getString("file"));
			bb.setDate(rs.getDate("date"));
			bb.setIp(rs.getString("ip"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setSubject(rs.getString("subject"));
			//bb->arrayList 한칸 저장
			boardList.add(bb);
		}
		System.out.println("게시글 목록 저장 완료");
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally
	{closeDB();}
	
	return boardList;
}

public void updateReadcount(int num){
	try {
		con=getCon();
		//조회수를 1증가 해당 글만 처리(num) =>수정
		sql="update bulletboard set readcount=readcount+1 where textnum=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,num);
		pstmt.executeUpdate();
		System.out.println("조회수 증가!");
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		closeDB();
	}
	
}
public BoardBean getBoard(int num){
		BoardBean bb=null;
	try {
		con= getCon();
		sql="select * from bulletboard where textnum=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num);
		
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			bb=new BoardBean();
			bb.setContent(rs.getString("content"));
			bb.setDate(rs.getDate("date"));
			bb.setFile(rs.getString("file"));
			bb.setIp(rs.getString("ip"));
			bb.setWriter(rs.getString("writer"));
			bb.setTextnum(rs.getInt("textnum"));
			bb.setPass(rs.getString("pass"));
			bb.setRe_lev(rs.getInt("re_lev"));
			bb.setRe_ref(rs.getInt("re_ref"));
			bb.setRe_seq(rs.getInt("re_seq"));
			bb.setSubject(rs.getString("subject"));
			bb.setReadcount(rs.getInt("readcount"));
		}
		System.out.println("글번호에 해당하는 정보 저장완료");
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{closeDB();}
	
	return bb;
}
//getBoard(num)
//getBoard(num)
public int updateBoard(BoardBean bb){
	int check = -1;
	try {
		con=getCon();
		sql="select pass from bulletboard where textnum=?";
		
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, bb.getTextnum());
		rs=pstmt.executeQuery();
		
		if(rs.next()){
			//글이 존재 하는 경우
			//비밀번호가 맞을 경우엠나 수정
			
			if(bb.getPass().equals(rs.getString("pass"))){
				//데이터 수정
				sql="update bulletboard set writer=?,subject=?,content=? where "
						+ "textnum=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setString(1, bb.getWriter());
				pstmt.setString(2, bb.getSubject());
				pstmt.setString(3, bb.getContent());
				pstmt.setInt(4, bb.getTextnum());
				pstmt.executeUpdate();
				check=1;
					
			}else{
				//비밀번호 오류
				check=0;
			}
		}else{
			//글이 없는 경우
		check=-1;
		
		}
		}catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}finally{
		closeDB();
	}
	
	return check;
}
public int deleteBoard(int num, String pass){
	int check=-1;
	
	try {
		con=getCon();
		
		sql="select pass from bulletboard where textnum=?";
		pstmt=con.prepareStatement(sql);
		pstmt.setInt(1,num);
		rs=pstmt.executeQuery();
		if(rs.next()){
			if(pass.equals(rs.getString("pass"))){
				sql="delete from bulletboard where textnum=?";
				pstmt=con.prepareStatement(sql);
				pstmt.setInt(1, num);
				pstmt.executeUpdate();
				check=1;
			}else{
				check=0;
			}
			
			
		}
		else{
			check=-1;
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return check;
}
















}
