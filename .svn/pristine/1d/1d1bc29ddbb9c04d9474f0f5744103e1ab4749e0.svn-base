package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.AdminQnaDao;
import kr.co.coduck.dto.AdminQnaCriteria;
import kr.co.coduck.dto.AdminQnaDto;

@Service
public class AdminQnaServiceImpl implements AdminQnaService {
	
	@Autowired
	private AdminQnaDao adminQnaDao;

	@Override
	public List<AdminQnaDto> getQnaByCriteria(AdminQnaCriteria adminQnaCriteria) {
		return adminQnaDao.getQnaByCriteria(adminQnaCriteria);
	}

	@Override
	public int getQnaCntByCriteria(AdminQnaCriteria adminQnaCriteria) {
		return adminQnaDao.getQnaCntByCriteria(adminQnaCriteria);
	}
}
