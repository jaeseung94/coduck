package kr.co.coduck.form;

import java.util.ArrayList;
import java.util.List;

public class TestSubmitForm {
	
	private int testNo;
	private int time;
	private List<Integer> qtNos = new ArrayList<Integer>();
	private List<Integer> ans = new ArrayList<Integer>();
	
	public TestSubmitForm() {}

	public List<Integer> getAns() {
		return ans;
	}

	public void setAns(List<Integer> ans) {
		this.ans = ans;
	}

	public int getTestNo() {
		return testNo;
	}

	public void setTestNo(int testNo) {
		this.testNo = testNo;
	}

	public List<Integer> getQtNos() {
		return qtNos;
	}

	public void setQtNos(List<Integer> qtNos) {
		this.qtNos = qtNos;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	@Override
	public String toString() {
		return "TestSubmitForm [testNo=" + testNo + ", time=" + time + ", qtNos=" + qtNos + ", ans=" + ans + "]";
	}
	
}
