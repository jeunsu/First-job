package com.itwill.test;
class Cal{
	public int total(int a, int b, int c){
		return a+b+c;
	}
	
	double ave(int a, int b, int c){
		return (a+b+c)/3.0;
			}
	
}
class Info{
	String stuNum1="itwill02";
	String name1="Jacobs";
	int kor1=95,eng1=99,math1=93;
}

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		//학번, 이름, 국,영,수
		String stuNum="itwill01";
		String name="James";
		int kor=89,eng=77,math=90;
		//학생 이름, 학번, 점수 총합, 평균 출력
		System.out.println("Name : "+name);
		System.out.println("Student Number : "+stuNum);
		System.out.println("Total score : "+(kor+eng+math));
		System.out.println("Average : "+(kor+eng+math)/3.0);
		//클래스 메서드를 사용하여 총점, 평균 계산
		System.out.println("---------------------------");
		Cal cal=new Cal();
		int tot= cal.total(kor,eng,math);
		System.out.println(tot);
		System.out.println(cal.ave(kor,eng,math));
		//////////////////////////////////////////////////////
		//학생 정보를 클래스로 저장
		//test패키지에 StuBean 클래스 생성
		//학생 이름, 학번, 국,영,수 점수 저장 가능하게 생성
		System.out.println("------------------------------");
		
		//학생 2명 객체를 생성
		//학생정보 각각 저장 후 정보를 출력
		StuBean stubean1= new StuBean();
		stubean1.setName("홍길동");
		stubean1.setStuNum("itwill03");
		stubean1.setKor(87);
		stubean1.setEng(65);
		stubean1.setMath(89);
		stubean1.info();
		cal.total(stubean1.getEng(), stubean1.getKor(), stubean1.getMath());
		cal.ave(stubean1.getEng(), stubean1.getKor(), stubean1.getMath());
		//stubean1 학생 총점, 평균
		StuBean stubean2= new StuBean();
		stubean2.setName("Obrien");
		stubean2.setStuNum("itwill04");
		stubean2.setMath(97);
		stubean2.setEng(56);
		stubean2.setKor(90);
		stubean2.info();
		//stubean2 학생 총점, 평균
		
		//계산기 객체를 생성
		//총점 sum 평균 avg 메서드 생성
		//총점 : 이름, 학번, 국,영,수=>"000/000는 총점 00점"
		//평균: 국,영,수=> 리턴값을 가져와서 Main클래스에서 출력
		Calcul c = new Calcul();
		c.sum(stuNum, name, kor, eng, math);
		c.sum(stubean1.getStuNum(),stubean1.getName(),
		stubean1.getKor(),stubean1.getEng(),stubean1.getMath());
		
		c.avg(stubean1.getKor(), stubean1.getEng(), stubean1.getMath());
		
		System.out.println("------------------------");
		//Cal 객체에 메서드를 추가 생성
		//기존의 sum, avg 메서드를 오버로딩 사용
		//한번에 한명의 학생의 정보를 모두 가져가서 
		//Cal 객체에서 사용하고 결과를 보여주는 형태로 만들기
		c.sum(stubean2);
		System.out.println(c.avg(stubean2));
		
		
		
		
		
		
		
		
		
	}

}
