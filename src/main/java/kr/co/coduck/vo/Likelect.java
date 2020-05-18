package kr.co.coduck.vo;

import org.apache.ibatis.type.Alias;

@Alias("Likelect")
public class Likelect {

	private int no;
	private int userNo;
	private int lectNo;
	
	public Likelect() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getLectNo() {
		return lectNo;
	}

	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}
	
}
