package com.itwill.test;

public class Calcul {
	public void sum(String stuNum, String name, int kor, int eng, int math){
	 	 System.out.println("학번 : "+stuNum);
	 	System.out.println("이름 : "+name);
	 	System.out.println("총점 : "+(kor+eng+math));
	 	
	}
	public double avg(int k, int e, int m){
		return (k+e+m)/3;
		}
	
	public void sum(StuBean stu){//stu=stubean2
	 	 System.out.println("학번 : "+stu.getStuNum());
	 	System.out.println("이름 : "+stu.getName());
	 	System.out.println("총점 : "+(stu.getKor()+stu.getEng()
	 	+stu.getMath()));
	}
	public double avg(StuBean s){
		return((s.getKor()+s.getEng()+s.getMath())/3.0);
	}
}
