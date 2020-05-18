package kr.co.coduck.dto;

import org.apache.ibatis.type.Alias;

@Alias("TestResultDto")
public class TestResultDto {
	
	private int no;
	private int qtNo;
	private int qtNum;
	private int ckNum;
	private String isTrue;
	private String content;
	private int score;
	private String img;
	private String v1;
	private String v2;
	private String v3;
	private String v4;
	private int ans;
	private int trueRate;
	private String subjName;
	private int subjNo;
	
	public TestResultDto() {}

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

	public int getQtNum() {
		return qtNum;
	}

	public void setQtNum(int qtNum) {
		this.qtNum = qtNum;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public int getTrueRate() {
		return trueRate;
	}

	public void setTrueRate(int trueRate) {
		this.trueRate = trueRate;
	}

	public String getSubjName() {
		return subjName;
	}

	public void setSubjName(String subjName) {
		this.subjName = subjName;
	}

	public int getSubjNo() {
		return subjNo;
	}

	public void setSubjNo(int subjNo) {
		this.subjNo = subjNo;
	}

	@Override
	public String toString() {
		return "TestResultDto [no=" + no + ", qtNo=" + qtNo + ", qtNum=" + qtNum + ", ckNum=" + ckNum + ", isTrue="
				+ isTrue + ", content=" + content + ", score=" + score + ", img=" + img + ", v1=" + v1 + ", v2=" + v2
				+ ", v3=" + v3 + ", v4=" + v4 + ", ans=" + ans + ", trueRate=" + trueRate + ", subjName=" + subjName
				+ ", subjNo=" + subjNo + "]";
	}
}
