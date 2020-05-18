package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.AdminLectDao;
import kr.co.coduck.dao.LectDao;
import kr.co.coduck.dto.AdminLectCriteria;
import kr.co.coduck.dto.AdminLectDto;
import kr.co.coduck.vo.Lect;

@Service
public class AdminLectServiceImpl implements AdminLectService {
	
	@Autowired
	private AdminLectDao adminLectDao;
	@Autowired
	private LectDao lectDao;
	
	@Override
	public List<AdminLectDto> getLectByCriteria(AdminLectCriteria adminLectCriteria) {
	
		return adminLectDao.getLectByCriteria(adminLectCriteria);
	}

	@Override
	public int getLectCntByCriteria(AdminLectCriteria adminLectCriteria) {
		
		return adminLectDao.getLectCntByCriteria(adminLectCriteria);
	}

	@Override
	public void confirmLect(int lectNo) {
		Lect lect = adminLectDao.getLectByLectNo(lectNo);
		lect.setIsDisplay("Y");
		adminLectDao.updateLect(lect);
	}

	@Override
	public void denyLect(int lectNo) {
		Lect lect = adminLectDao.getLectByLectNo(lectNo);
		lect.setIsDisplay("D");
		adminLectDao.updateLect(lect);
	}
}
