package kr.co.coduck.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;

import kr.co.coduck.vo.Category;
import kr.co.coduck.vo.Lect;

@Alias("LectureCourseDto")
public class LectureCourseDto {

	private Category category;
	private Lect lecture;
	private List<ChapterDto> chapters;
	private LectureDto lectureDto;

	public LectureCourseDto() {}
	
	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public Lect getLecture() {
		return lecture;
	}

	public void setLecture(Lect lecture) {
		this.lecture = lecture;
	}

	public List<ChapterDto> getChapters() {
		return chapters;
	}

	public void setChapters(List<ChapterDto> chapters) {
		this.chapters = chapters;
	}

	public LectureDto getLectureDto() {
		return lectureDto;
	}

	public void setLectureDto(LectureDto lectureDto) {
		this.lectureDto = lectureDto;
	}

	@Override
	public String toString() {
		return "LectureCourseDto [category=" + category + ", lecture=" + lecture + ", chapters=" + chapters
				+ ", lectureDto=" + lectureDto + "]";
	}

}
