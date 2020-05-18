package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.LectDao;
import kr.co.coduck.dao.UserDao;
import kr.co.coduck.dto.ChapterDto;
import kr.co.coduck.dto.LectureCourseDto;
import kr.co.coduck.dto.LectureDto;
import kr.co.coduck.dto.UserByLectDto;
import kr.co.coduck.vo.Category;
import kr.co.coduck.vo.Lect;
import kr.co.coduck.vo.LectureCriteria;
import kr.co.coduck.vo.Lesson;
import kr.co.coduck.vo.User;

@Service
public class LectServiceImpl implements LectService {

	@Autowired
	private LectDao lectDao;
	@Autowired
	private UserDao userDao;
	
	@Override
	public List<UserByLectDto> getLectListUserByNo(int userNo) {
		User user = userDao.getUserProfilByNo(userNo);
		List<UserByLectDto> userLectList = lectDao.getLectListUserByNo(user.getNo());
		return userLectList;
	}

	@Override
	public Lect getLectByNo(int lectNo) {
		Lect lect = lectDao.getLectByNo(lectNo);
		return lect;
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

}
