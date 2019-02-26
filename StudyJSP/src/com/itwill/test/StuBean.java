package com.itwill.test;

public class StuBean {
	//단순 정보 저장용 객체
	
	
	
	private String StuNum;
	private String Name;
	private int Kor,Eng,Math;
	
	public StuBean(){
		//기본 생성자
		
		
		//자신의 정보를 출력하는 메서드 생성
		//Info() 이름, 학번, 국,영,수
		
		
	}

	



	public String getStuNum() {
		return StuNum;
	}





	public void setStuNum(String stuNum) {
		StuNum = stuNum;
	}





	public String getName() {
		return Name;
	}





	public void setName(String name) {
		Name = name;
	}





	public int getKor() {
		return Kor;
	}

	public void setKor(int kor) {
		Kor = kor;
	}

	public int getEng() {
		return Eng;
	}

	public void setEng(int eng) {
		Eng = eng;
	}

	public int getMath() {
		return Math;
	}

	public void setMath(int math) {
		Math = math;
	}
	public void info(){
		System.out.println("이름 : "+Name);
		System.out.println("학번 : "+StuNum);
		System.out.println("국어 : "+Kor);
		System.out.println("영어 : "+Eng);
		System.out.println("수학 : "+Math);
	}
	
	
}
