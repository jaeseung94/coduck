package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.TestDao;
import kr.co.coduck.dto.SearchTestDetailDto;
import kr.co.coduck.form.SearchTestFormByAdm;

@Service
public class AdminTestServiceImpl implements AdminTestService{

	@Autowired
	private TestDao testDao;
	
	@Override
	public int searchTestCnt(SearchTestFormByAdm form) {
		return testDao.searchTestCnt(form);
	}
	
	@Override
	public List<SearchTestDetailDto> searchTestByAdm(SearchTestFormByAdm form) {
		return testDao.searchTestByAdm(form);
	}
}
