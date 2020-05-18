package kr.co.coduck.vo;

import org.apache.ibatis.type.Alias;

@Alias("LectCart")
public class LectCart {

	private int no;
	private int lectNo;
	private int userNo;
	
	public LectCart() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getLectNo() {
		return lectNo;
	}

	public void setLectNo(int lectNo) {
		this.lectNo = lectNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	
}
