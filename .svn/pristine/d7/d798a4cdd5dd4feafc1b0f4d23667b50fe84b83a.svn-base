package kr.co.coduck.dao;

import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.UserQuestionDto;
import kr.co.coduck.vo.AdQna;
import kr.co.coduck.vo.AdQnaFile;

public interface UserQuestionDao {
	
	List<AdQnaFile> getAdQnaFilesByQnaNo(int qnaNo);
	List<AdQna> getAdQnasByUserNo(int userNno);
	AdQna getAdQnaByNo(int no);
	void insertAdQnaFile(AdQnaFile file);
	void insertAdQna(AdQna adQna);
	List<UserQuestionDto> getUserQuestionListByUserNo(int userNo);
	List<UserQuestionDto> searchQuestion(Map<String, Object> criteria);
}
