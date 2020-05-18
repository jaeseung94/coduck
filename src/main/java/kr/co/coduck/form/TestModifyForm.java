package kr.co.coduck.form;

import org.apache.ibatis.type.Alias;

@Alias("TestModifyForm")
public class TestModifyForm {
	
	private int qtNo;
	private String content;
	private String img;
	private int score;
	private String v1;
	private String v2;
	private String v3;
	private String v4;
	private int ans;
	
	public TestModifyForm() {}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
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

	public int getQtNo() {
		return qtNo;
	}

	public void setQtNo(int qtNo) {
		this.qtNo = qtNo;
	}

	public int getAns() {
		return ans;
	}

	public void setAns(int ans) {
		this.ans = ans;
	}

	@Override
	public String toString() {
		return "TestModifyForm [qtNo=" + qtNo + ", content=" + content + ", img=" + img + ", score=" + score + ", v1="
				+ v1 + ", v2=" + v2 + ", v3=" + v3 + ", v4=" + v4 + ", ans=" + ans + "]";
	}

}
