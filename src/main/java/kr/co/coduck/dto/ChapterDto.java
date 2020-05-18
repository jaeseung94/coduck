package kr.co.coduck.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import kr.co.coduck.vo.Chapter;
import kr.co.coduck.vo.Lesson;

@Alias("ChapterDto")
public class ChapterDto {
	
	private Chapter chapter;
	private List<Lesson> lessons;
	
	public ChapterDto() {}

	public Chapter getChapter() {
		return chapter;
	}

	public void setChapter(Chapter chapter) {
		this.chapter = chapter;
	}

	public List<Lesson> getLessons() {
		return lessons;
	}

	public void setLessons(List<Lesson> lessons) {
		this.lessons = lessons;
	}

	@Override
	public String toString() {
		return "ChapterDto [chapter=" + chapter + ", lessons=" + lessons + "]";
	}
	
}
