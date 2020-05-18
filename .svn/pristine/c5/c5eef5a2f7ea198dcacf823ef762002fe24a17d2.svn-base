package kr.co.coduck.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.LectDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.ChapterDto;
import kr.co.coduck.dto.IncomeDto;
import kr.co.coduck.dto.LectureCourseDto;
import kr.co.coduck.dto.LectureDto;
import kr.co.coduck.dto.LessonDto;
import kr.co.coduck.dto.UserByLectDto;
import kr.co.coduck.vo.Lect;
import kr.co.coduck.vo.LectureCriteria;
import kr.co.coduck.vo.Lesson;
import kr.co.coduck.vo.LessonHistory;
import kr.co.coduck.vo.User;

@Service
public class LectServiceImpl implements LectService {
	

	@Autowired
	private LectDao lectDao;
	@Autowired
	private UserDao userDao;

	@Override
	public List<LessonDto> getLectListUserByNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<LessonDto> userLectList = lectDao.getLectListUserByNo(user.getNo());
		return userLectList;
	}

	@Override
	public Lect getLectByNo(int lectNo) {
		Lect lect = lectDao.getLectByNo(lectNo);
		return lect;
	}

	@Override
	public List<LectureDto> TopFiveLecturesByLike() {
		
		return lectDao.TopFiveLecturesByLike();
	}
	
	@Override
	public List<LectureDto> TopFiveFreeLectures() {

		return lectDao.TopFiveFreeLectures();
	}
	
	@Override
	public List<LectureDto> TopFourNewLectures() {
		
		return lectDao.TopFourNewLectures();
	}
	
	@Override
	public List<LectureDto> TopFourTestLectures() {

		return lectDao.TopFourTestLectures();
	}
	
	@Override
	public List<LectureDto> getLectureByCategoryNo(int cateNo) {

		return lectDao.getLectureByCategoryNo(cateNo);
	}

	@Override
	public LectureDto getLectureByLectureNo(int lectureNo) {

		return lectDao.getLectureByLectureNo(lectureNo);
	}

	@Override
	public List<LectureDto> getLectureListByCriteria(LectureCriteria cri) {

		return lectDao.getLectureListByCriteria(cri);
	}

	@Override
	public int getTeachersLectureCountByCriteria(LectureCriteria cri) {

		return lectDao.getTeachersLectureCountByCriteria(cri);
	}

	@Override
	public LessonDto getLessonCountAndLengthByLectureNo(int lectureNo) {

		return lectDao.getLessonCountAndLengthByLectureNo(lectureNo);
	}

	@Override
	public LectureDto getAllCountByLectureNo(int lectureNo) {

		return lectDao.getAllCountByLectureNo(lectureNo);
	}

	@Override
	public List<ChapterDto> getChapterByLectureNo(int lectureNo) {

		return lectDao.getChapterByLectureNo(lectureNo);
	}

	@Override
	public List<Lesson> getLessonByChpaterNo(int chapterNo) {

		return lectDao.getLessonByChpaterNo(chapterNo);
	}

	@Override
	public List<LectureCourseDto> getLectureByCriteria(LectureCriteria cri) {
		return lectDao.getLectureByCriteria(cri);
	}

	@Override
	public int getLectureCountByCriteria(LectureCriteria cri) {

		return lectDao.getLectureCountByCriteria(cri);
	}

	@Override
	public LessonDto getProgressPercentInDashboard(Map<String, Object> map) {
		LessonDto lessonDto = lectDao.getProgressPercentInDashboard(map);

		int needMinutes = lessonDto.getTotalTime();

		long hour = TimeUnit.MINUTES.toHours(needMinutes);
		long minutes = TimeUnit.MINUTES.toMinutes(needMinutes) - TimeUnit.HOURS.toMinutes(hour);

		lessonDto.setNewTotalTime(hour + ":" + minutes);

		return lectDao.getProgressPercentInDashboard(map);
	}

	@Override
	public LectureCourseDto getLectureCourseByLecureNo(int lectureNo) {

		return lectDao.getLectureCourseByLecureNo(lectureNo);
	}
	
	@Override 
	public List<IncomeDto> getTeacherIncomeByCriteria(LectureCriteria cri) {

		List<IncomeDto> incomeDtos = lectDao.getTeacherIncomeByCriteria(cri);
		for (IncomeDto income : incomeDtos) {
			if (income.getGrade().equals("1")) {
				income.setGrade("입문");
			} else if (income.getGrade().equals("2")) {
				income.setGrade("초급");
			} else if (income.getGrade().equals("3")) {
				income.setGrade("중급");
			} else if (income.getGrade().equals("4")) {
				income.setGrade("활용");
			}
		}
		return incomeDtos; 
	}
  
	@Override
	public double getTeacherAvgScore(int userNo) {
		
		return lectDao.getTeacherAvgScore(userNo);
	}
	
	@Override
	public IncomeDto getTeacherIncomeStatistics(int userNo) {
		
		return lectDao.getTeacherIncomeStatistics(userNo);
	}
  
	 @Override
	public List<Lesson> getLessonByRecent(Map<String, Object> map) {

		return lectDao.getLessonByRecent(map);
	}
	 
	@Override
	public LessonHistory getLessonHistoryByLessonHistory(LessonHistory lessonHistory) {

		return lectDao.getLessonHistoryByLessonHistory(lessonHistory);
	}
	
	@Override
	public Lesson getLessonByLessonNo(int lessonNo) {

		return lectDao.getLessonByLessonNo(lessonNo);
	}
	
	@Override
	public void insertLessonHistory(LessonHistory lessonHistory) {
		lectDao.insertLessonHistory(lessonHistory);
	}
	
	@Override
	public void updateLessonByLessonHistory(LessonHistory lessonHistory) {
		lectDao.updateLessonByLessonHistory(lessonHistory);
	}
	
	@Override
	public Lesson getFirstLessonByLectureNo(int lectureNo) {

		return lectDao.getFirstLessonByLectureNo(lectureNo);
	}
	
	@Override
	public List<LessonHistory> getAllLessonHistoryByMap(Map<String, Object> map) {

		return lectDao.getAllLessonHistoryByMap(map);
	}
	
	@Override
	public List<LessonDto> getLectProcessivityByUserNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<LessonDto> userLectProcessivity = lectDao.getLectProcessivityByUserNo(user.getNo());
		return userLectProcessivity;
	}

	@Override
	public List<Lect> getFindLectByUserNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<Lect> userFindLectByUserNo = lectDao.getFindLectByUserNo(user.getNo());
		return userFindLectByUserNo;
	}
}
