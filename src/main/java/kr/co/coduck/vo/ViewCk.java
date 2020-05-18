package kr.co.coduck.vo;

import org.apache.ibatis.type.Alias;

@Alias("ViewCk")
public class ViewCk {
	
	private int no;
	private int qtNo;
	private int userNo;
	private int ckNum;
	private String isTrue;
	
	public ViewCk() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getQtNo() {
		return qtNo;
	}

	public void setQtNo(int qtNo) {
		this.qtNo = qtNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public int getCkNum() {
		return ckNum;
	}

	public void setCkNum(int ckNum) {
		this.ckNum = ckNum;
	}

	public String getIsTrue() {
		return isTrue;
	}

	public void setIsTrue(String isTrue) {
		this.isTrue = isTrue;
	}

	@Override
	public String toString() {
		return "ViewCk [no=" + no + ", qtNo=" + qtNo + ", userNo=" + userNo + ", ckNum=" + ckNum + ", isTrue=" + isTrue + "]";
	}
	
}
