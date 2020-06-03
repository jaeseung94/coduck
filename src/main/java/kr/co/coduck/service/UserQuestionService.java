package kr.co.coduck.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.UserQuestionDto;
import kr.co.coduck.form.userQuestionToAdm;
import kr.co.coduck.vo.AdQna;
import kr.co.coduck.vo.AdQnaFile;

public interface UserQuestionService {
	void deleteQnaFile(int qnaNo);
	void deleteQna(int qnaNo);
	void updateQna(AdQna adQna);
	List<AdQnaFile> getAdQnaFilesByQnaNo(int qnaNo);
	List<AdQna> getAdQnasByUserNo(int userNno);
	List<AdQna> getAdQnasByCriteria(Map<String, Integer> criteria);
	int getAllAdQnaCntByUserNo(int userNo);
	AdQna getAdQnaByNo(int no);
	void insertAdQnaFile(AdQnaFile file);
	int insertAdQna(userQuestionToAdm form, int userNo) throws IOException;
	List<UserQuestionDto> getUserQuestionListByUserNo(int userNo);
	List<UserQuestionDto> searchQuestion(Map<String, Object> criteria);
}
