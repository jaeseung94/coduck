package kr.co.coduck.dto;

import org.apache.ibatis.type.Alias;

@Alias("ReviewStarDto")
public class ReviewStarDto {

	private int star;
	private int count;
	private int avgStar;
	
	public ReviewStarDto() {}
	
	public ReviewStarDto(int star, int count, int avgStar) {
		super();
		this.star = star;
		this.count = count;
		this.avgStar = avgStar;
	}
	
	public int getStar() {
		return star;
	}
	public void setStar(int star) {
		this.star = star;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getAvgStar() {
		return avgStar;
	}
	public void setAvgStar(int avgStar) {
		this.avgStar = avgStar;
	}
	
	@Override
	public String toString() {
		return "ReviewStarDto [star=" + star + ", count=" + count + ", avgStar=" + avgStar + "]";
	}


	
	
}
