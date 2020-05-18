package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.QuestionDao;
import kr.co.coduck.vo.Answer;
import kr.co.coduck.vo.LectureCriteria;
import kr.co.coduck.vo.Question;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired
	private QuestionDao questionDao;
	
	@Override
	public List<Question> getQuestionByLectureNo(LectureCriteria cri) {
		
		return questionDao.getQuestionByLectureNo(cri);
	}
	
	@Override
	public List<Question> getQuestionByLessonNo(LectureCriteria cri) {
		
		return questionDao.getQuestionByLessonNo(cri);
	}
	
	@Override
	public Answer getAnswerByQuestionNo(int questionNo) {

		return questionDao.getAnswerByQuestionNo(questionNo);
	}
	
	@Override
	public void insertQuestion(Question question) {
		questionDao.insertQuestion(question);
		
	}
	@Override
	public Question getQuestionByQuestionNo(int questionNo) {

		return questionDao.getQuestionByQuestionNo(questionNo);
	}
	
	@Override
	public List<Question> getQuestionByRecent(int lectureNo) {
		
		return questionDao.getQuestionByRecent(lectureNo);
	}
}
