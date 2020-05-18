package kr.co.coduck.vo;

import java.util.concurrent.TimeUnit;

import org.apache.ibatis.type.Alias;

@Alias("Lesson")
public class Lesson {

	private int no;
	private int chapterNo;
	private String lessonTitle;
	private String videoPath;
	private int totalTime;
	
	public Lesson() {
		
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getChapterNo() {
		return chapterNo;
	}

	public void setChapterNo(int chapterNo) {
		this.chapterNo = chapterNo;
	}

	public String getLessonTitle() {
		return lessonTitle;
	}

	public void setLessonTitle(String lessonTitle) {
		this.lessonTitle = lessonTitle;
	}

	public String getVideoPath() {
		return videoPath;
	}

	public void setVideoPath(String videoPath) {
		this.videoPath = videoPath;
	}

	public int getTotalTime() {
		return totalTime;
	}
	
	public String getNewTotalTime() {
		
		int needMinutes = totalTime;
		long hour = TimeUnit.MINUTES.toHours(needMinutes); 
		long minutes = TimeUnit.MINUTES.toMinutes(needMinutes) - TimeUnit.HOURS.toMinutes(hour); 
		
		return hour + ":" + minutes;
	}
	

	public void setTotalTime(int totalTime) {
		this.totalTime = totalTime;
	}
	@Override
	public String toString() {
		return "Lesson [no=" + no + ", chapterNo=" + chapterNo + ", lessonTitle=" + lessonTitle + ", videoPath="
				+ videoPath + ", totalTime=" + totalTime + "]";
	}

}
