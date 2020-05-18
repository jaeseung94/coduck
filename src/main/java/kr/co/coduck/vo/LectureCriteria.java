package kr.co.coduck.vo;

import java.util.Arrays;

import org.apache.ibatis.type.Alias;

@Alias("LectureCriteria")
public class LectureCriteria {
	

	private int cateNo;
	private int userNo;
	private int no;
	private int lessonNo;
	private int[] grades;
	private String keyword;
	private String sort;
	private String[] options;
	private int discount;
	private int page;
	private int beginIndex;
	private int endIndex;
	private String startDate;
	private String endDate;


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

	public int getLessonNo() {
		return lessonNo;
	}

	public void setLessonNo(int lessonNo) {
		this.lessonNo = lessonNo;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
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

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "LectureCriteria [cateNo=" + cateNo + ", userNo=" + userNo + ", no=" + no + ", lessonNo=" + lessonNo
				+ ", grades=" + Arrays.toString(grades) + ", keyword=" + keyword + ", sort=" + sort + ", options="
				+ Arrays.toString(options) + ", discount=" + discount + ", page=" + page + ", beginIndex=" + beginIndex
				+ ", endIndex=" + endIndex + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

}
