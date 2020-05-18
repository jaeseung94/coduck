package kr.co.coduck.dao;

import java.util.List;

import kr.co.coduck.vo.Answer;
import kr.co.coduck.vo.LectureCriteria;
import kr.co.coduck.vo.Question;

public interface QuestionDao {

	List<Question> getQuestionByLectureNo(LectureCriteria cri);
	Answer getAnswerByQuestionNo(int questionNo);
	void insertQuestion(Question question);
	List<Question> getQuestionByRecent(int lectureNo);
}
