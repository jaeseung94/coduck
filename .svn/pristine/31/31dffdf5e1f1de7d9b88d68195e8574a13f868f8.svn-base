package kr.co.coduck.dao;

import java.util.List;

import kr.co.coduck.dto.AdminQnaCriteria;
import kr.co.coduck.dto.AdminQnaDto;
import kr.co.coduck.vo.AdQna;
import kr.co.coduck.vo.AdQnaFile;

public interface AdminQnaDao {
	List<AdQnaFile> getAdQnaFilesByQnaNo(int qnaNo);
	List<AdQna> getAdQnasByUserNo(int userNno);
	AdQna getAdQnaByNo(int no);
	List<AdminQnaDto> getQnaByCriteria(AdminQnaCriteria adminQnaCriteria);
	int getQnaCntByCriteria(AdminQnaCriteria adminQnaCriteria);
}
