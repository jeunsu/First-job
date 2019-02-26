package com.itwill.member;
import java.sql.DriverManager;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MemberDAO {

	
	//DB 접근해서 정보를 저장, 수정, 삭제, 조회
	//DAO(Data Access Object)
	
	//사용레퍼런스 변수 선언
	Connection con=null;
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	//디비 연결
	private Connection getCon() throws Exception{
		final String DRIVER="com.mysql.jdbc.Driver";
		final String DBID="root";
		final String DBPW="1234";
		final String DBURL="jdbc:mysql://localhost:3306/jspdb";


		Class.forName(DRIVER);

		

		con=DriverManager.getConnection(DBURL,DBID,DBPW);
		System.out.println("디비 연결&드라이버 로드 성공");
		return con;
	}
	//insertMember() 회원가입
	public void insertMember(MemberBean mb){
		
		//디비 연결&드라이버 로드
		try {
			con=getCon();
			String sql="insert into members (Name,Gender,Age,ID,Password,Email,reg_date) values(?,?,?,?,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,mb.getName());
			pstmt.setString(2,mb.getGender());
			pstmt.setInt(3,mb.getAge());
			pstmt.setString(4,mb.getId());
			pstmt.setString(5,mb.getPass());
			pstmt.setString(6,mb.getEmail());
			pstmt.setTimestamp(7,mb.getReg_date());
			pstmt.executeUpdate();
			System.out.println("회원가입완료");			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			//예외상관없이 항상 처리
			//자원 해제
			if(pstmt!=null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			if(con!=null){
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		
		
	} 
	
	
	//insertMember() 회원가입
	
	//idCheck(id,pass)
	public int idCheck(String id, String pass){
		int check=-1;//로그인 여부 체크변수
		try {
			//1,2단계 디비연결&드라이버로드
			con=getCon();
			//3. sql 생성, pstmt객체 생성
			String sql="select Password from members where ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);
			//4.실행
			rs=pstmt.executeQuery();
			//5. 데이터가 있는지 없는지에 따라서 처리
			if(rs.next()){
				//아이디 있다
				if(pass.equals(rs.getString("Password"))){
					//비밀번호 맞다
					check=1;
				}
				else{
					//비밀번호 틀리다
					check=0;
				}
			}
			else{
				//아이디 없다
				check=-1;
			}
			System.out.println("로그인 체크 완료: "+check);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return check;
	}
		//idCheck(id,pass)
	//getMember(id) id 해당하는 정보 가져오는 메서드
	public MemberBean getMember(String id){
		//DB 연결
		MemberBean mb=null;
		try {
			con=getCon();
			//sql작성
			String sql="select * from members where ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,id);			
			rs=pstmt.executeQuery();
			//실행, 결과처리
			//id에 해당하는 정보를 저장
			//MemberBean 저장
			if(rs.next()){
				mb=new MemberBean();
				mb.setAge(rs.getInt("Age"));
				mb.setEmail(rs.getString("Email"));
				mb.setGender(rs.getString("Gender"));
				mb.setId(rs.getString("ID"));
				mb.setName(rs.getString("Name"));
				mb.setPass(rs.getString("Password"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
			}System.out.println("id값에 해당하는 정보 확인 완료");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return mb;
	}
	
	//getMember(id) id 해당하는 정보 가져오는 메서드
	//update member
	public int updateMember(MemberBean mb){
		//드라이버로드&디비연결
		int check=0;
		try {
			con=getCon();
			String sql="select Password from members where ID=?";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, mb.getId());
			rs=pstmt.executeQuery();
			if(rs.next()){
				if(mb.getPass().equals(rs.getString("Password")) ){
					String sql2="update members set Name=?,Gender=?,Age=?,Email=? where ID=? ";
					pstmt=con.prepareStatement(sql2);
					pstmt.setString(1,mb.getName());
					pstmt.setString(2,mb.getGender());
					pstmt.setInt(3,mb.getAge());
					pstmt.setString(4,mb.getEmail());
					pstmt.setString(5,mb.getId());
					pstmt.executeUpdate();
					System.out.println("회원수정완료");		
					check=1;
			}else{
				check=0;//비밀번호 오류
			}}
			else{
				check=-1;//아이디 없음
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			
				try {
					if(rs!=null){rs.close();
				} 
				if(pstmt!=null){
					pstmt.close();
				}
				if(con!=null){
					con.close();
				}}
				catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
		}
		
		//sql 작성, pstmt객체 생성
		
		//동작
		
		
		return check;
	}
	public int deleteMember(String id, String pass){
	int check = -1;
	try {
		con=getCon();
		String sql="select Password form members where ID=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			if(pass.equals(rs.getString("Password"))){
				sql="delete from members where ID=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.executeUpdate();
				check=1;
			}
			else{
				check=0;
			}
		}
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
		return check;
	}
	//getMemberList();
	public List<MemberBean> getMemberList(){
		List<MemberBean>  memberList = new ArrayList<MemberBean>();
		try {
			con=getCon();
			String sql="select * from members";
			pstmt = con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				//한 사람의 정보를 저장 객체
				MemberBean mb=new MemberBean();
				mb.setAge(rs.getInt("Age"));
				mb.setEmail(rs.getString("Email"));
				mb.setGender(rs.getString("Gender"));
				mb.setId(rs.getString("ID"));
				mb.setName(rs.getString("Name"));
				mb.setPass(rs.getString("Password"));
				mb.setReg_date(rs.getTimestamp("reg_date"));
			//한변의 정보(MemberBean) ArrayList 한칸에 저장
				memberList.add(mb);
				
			}
									
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if(pstmt != null){
					pstmt.close();
				}
				if(con != null){
					con.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return memberList;
	}
	}
	//getMemberList();
	
