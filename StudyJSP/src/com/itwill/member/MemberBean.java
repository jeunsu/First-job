package com.itwill.member;

import java.sql.Timestamp;

public class MemberBean {
		//DB 안에 잇는 테이블에 정보를 저장하기 위한 형태
		//DB 테이블 안에 있는 컬럼의 이름과 동일하게 처리
		
		//회원 가입하는 사람 1명의 정보
		
		private String id;
		private String pass;
		private String name;
		private int age;
		private String gender;
		private String email;
		private Timestamp reg_date;
		//DTO(Data Transfer Object)
		public String getId() {
			return id;
		}
		public void setId(String id) {
			this.id = id;
		}
		public String getPass() {
			return pass;
		}
		public void setPass(String pass) {
			this.pass = pass;
		}
		public String getName() {
			return name;
		}
		public void setName(String name) {
			this.name = name;
		}
		public int getAge() {
			return age;
		}
		public void setAge(int age) {
			this.age = age;
		}
		public String getGender() {
			return gender;
		}
		public void setGender(String gender) {
			this.gender = gender;
		}
		public String getEmail() {
			return email;
		}
		public void setEmail(String email) {
			this.email = email;
		}
		public Timestamp getReg_date() {
			return reg_date;
		}
		public void setReg_date(Timestamp reg_date) {
			this.reg_date = reg_date;
		}
		
}
