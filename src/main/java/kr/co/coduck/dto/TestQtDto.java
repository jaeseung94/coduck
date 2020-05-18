package kr.co.coduck.dto;

import org.apache.ibatis.type.Alias;

@Alias("TestQtDto")
public class TestQtDto {
	
	private int subjNo;
	private String subjName;
	private int subjQtCnt;
	private int subjLv;
	private int qtNo;
	private int qtNum;
	private String contents;
	private int score;
	private String v1;
	private String v2;
	private String v3;
	private String v4;
	private int ans;
	private String img;
	private int testNo;
	private String name;
	private String ep;
	private int qtCnt;
	
	public TestQtDto () {}

	public int getSubjNo() {
		return subjNo;
	}

	public void setSubjNo(int subjNo) {
		this.subjNo = subjNo;
	}

	public String getSubjName() {
		return subjName;
	}

	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}

	public int getSubjQtCnt() {
		return subjQtCnt;
	}

	public void setSubjQtCnt(int subjQtCnt) {
		this.subjQtCnt = subjQtCnt;
	}

	public int getSubjLv() {
		return subjLv;
	}

	public void setSubjLv(int subjLv) {
		this.subjLv = subjLv;
	}

	public int getQtNo() {
		return qtNo;
	}

	public void setQtNo(int qtNo) {
		this.qtNo = qtNo;
	}

	public int getQtNum() {
		return qtNum;
	}

	public void setQtNum(int qtNum) {
		this.qtNum = qtNum;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getV1() {
		return v1;
	}

	public void setV1(String v1) {
		this.v1 = v1;
	}

	public String getV2() {
		return v2;
	}

	public void setV2(String v2) {
		this.v2 = v2;
	}

	public String getV3() {
		return v3;
	}

	public void setV3(String v3) {
		this.v3 = v3;
	}

	public String getV4() {
		return v4;
	}

	public void setV4(String v4) {
		this.v4 = v4;
	}

	public int getAns() {
		return ans;
	}

	public void setAns(int ans) {
		this.ans = ans;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getTestNo() {
		return testNo;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEp() {
		return ep;
	}

	public void setEp(String ep) {
		this.ep = ep;
	}

	public int getQtCnt() {
		return qtCnt;
	}

	public void setQtCnt(int qtCnt) {
		this.qtCnt = qtCnt;
	}

	@Override
	public String toString() {
		return "TestQtDto [subjNo=" + subjNo + ", subjName=" + subjName + ", subjQtCnt=" + subjQtCnt + ", subjLv=" + subjLv
				+ ", qtNo=" + qtNo + ", qtNum=" + qtNum + ", contents=" + contents + ", score=" + score + ", v1=" + v1
				+ ", v2=" + v2 + ", v3=" + v3 + ", v4=" + v4 + ", ans=" + ans + ", img=" + img + ", testNo=" + testNo
				+ ", name=" + name + ", ep=" + ep + ", qtCnt=" + qtCnt + "]";
	}

}
