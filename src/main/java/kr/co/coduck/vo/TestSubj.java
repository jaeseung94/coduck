package kr.co.coduck.vo;

import org.apache.ibatis.type.Alias;

@Alias("TestSubj")
public class TestSubj {
	
	private int no;
	private String name;
	private int passScore;
	private int qtCnt;
	private int cateNo;
	private int lv;
	
	public TestSubj() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPassScore() {
		return passScore;
	}

	public void setPassScore(int passScore) {
		this.passScore = passScore;
	}

	public int getQtCnt() {
		return qtCnt;
	}

	public void setQtCnt(int qtCnt) {
		this.qtCnt = qtCnt;
	}

	public int getCateNo() {
		return cateNo;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public int getLv() {
		return lv;
	}

	public void setLv(int lv) {
		this.lv = lv;
	}

	@Override
	public String toString() {
		return "TestSubj [no=" + no + ", name=" + name + ", passScore=" + passScore + ", qtCnt=" + qtCnt + ", cateNo="
				+ cateNo + ", lv=" + lv + "]";
	}

}
