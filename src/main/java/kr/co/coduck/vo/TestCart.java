package kr.co.coduck.vo;

import org.apache.ibatis.type.Alias;

@Alias("TestCart")
public class TestCart {

	private int no;
	private int testNo;
	private int userNo;
	
	public TestCart() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getTestNo() {
		return testNo;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
}
