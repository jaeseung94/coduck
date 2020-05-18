package kr.co.coduck.vo;

import java.util.Arrays;

import org.apache.ibatis.type.Alias;

@Alias("LectureCriteria")
public class LectureCriteria {

	private int cateNo;
	private int no;
	private int[] grades;
	private String keyword;
	private String sort;
	private String[] options;
	private int page;
	private int beginIndex;
	private int endIndex;

	public LectureCriteria() {}
	
	public String[] getOptions() {
		return options;
	}

	public void setOptions(String[] options) {
		this.options = options;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0)
			page = 1;
		this.page = page;
	}
	
	public int getBeginIndex() {
		return beginIndex;
	}

	public void setBeginIndex(int beginIndex) {
		this.beginIndex = beginIndex;
	}

	public int getEndIndex() {
		return endIndex;
	}

	public void setEndIndex(int endIndex) {
		this.endIndex = endIndex;
	}

	public int getCateNo() {
		return cateNo;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public void setCateNo(int cateNo) {
		this.cateNo = cateNo;
	}

	public int[] getGrades() {
		return grades;
	}

	public void setGrades(int[] grades) {
		this.grades = grades;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@Override
	public String toString() {
		return "LectureCriteria [cateNo=" + cateNo + ", no=" + no + ", grades=" + Arrays.toString(grades) + ", keyword="
				+ keyword + ", sort=" + sort + ", page=" + page + ", options=" + Arrays.toString(options) + "]";
	}

}
