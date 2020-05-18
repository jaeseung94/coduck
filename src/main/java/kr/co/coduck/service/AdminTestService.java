package kr.co.coduck.service;

import java.util.List;

import kr.co.coduck.dto.SearchTestDetailDto;
import kr.co.coduck.form.SearchTestFormByAdm;

public interface AdminTestService {
	
	List<SearchTestDetailDto> searchTestByAdm(SearchTestFormByAdm form);
	int searchTestCnt(SearchTestFormByAdm form);
}
