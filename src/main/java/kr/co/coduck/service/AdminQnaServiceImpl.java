package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.AdminQnaDao;
import kr.co.coduck.dto.AdQnaDto;
import kr.co.coduck.dto.AdminAnswerDto;
import kr.co.coduck.dto.AdminQnaCriteria;
import kr.co.coduck.dto.AdminQnaDto;
import kr.co.coduck.vo.AdQna;
import kr.co.coduck.vo.AdQnaFile;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {
	
	// 파일을 저장할 경로 지정하기
    @Value("${user.question.img.directory}")
    private String imageDirectory;
	
	@Autowired
	private AdminQnaDao adminQnaDao;
	
	@Override
	public void deleteQna(int qnaNo) {
		adminQnaDao.deleteQna(qnaNo);
	}
	
	@Override
	public List<AdQnaFile> getAdQnaFilesByQnaNo(int qnaNo) {
		return adminQnaDao.getAdQnaFilesByQnaNo(qnaNo);
	}
	
	@Override
	public List<AdQna> getAdQnasByUserNo(int userNo) {
		return adminQnaDao.getAdQnasByUserNo(userNo);
	}
	
	@Override
	public AdQna getAdQnaByNo(int no) {
		return adminQnaDao.getAdQnaByNo(no);
	}
	
	@Override
	public List<AdminQnaDto> getQnaByCriteria(AdminQnaCriteria adminQnaCriteria) {
		return adminQnaDao.getQnaByCriteria(adminQnaCriteria);
	}

	@Override
	public int getQnaCntByCriteria(AdminQnaCriteria adminQnaCriteria) {
		return adminQnaDao.getQnaCntByCriteria(adminQnaCriteria);
	}

	@Override
	public AdminAnswerDto getAnswerByNo(int no) {
		return adminQnaDao.getAnswerByNo(no);
	}

	@Override
	public AdQnaDto getQnaByNo(int no) {
		return adminQnaDao.getQnaByNo(no);
	}

	@Override
	public void addAnswer(AdminAnswerDto adminAnswerDto) {
		adminQnaDao.addAnswer(adminAnswerDto);
	}

	@Override
	public void updateQna(AdQnaDto adQnaDto) {
		adminQnaDao.updateQna(adQnaDto);
	}

}
