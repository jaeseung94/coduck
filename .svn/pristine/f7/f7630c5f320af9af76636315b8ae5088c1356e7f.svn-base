package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.coduck.dto.SearchTestDetailDto;
import kr.co.coduck.dto.SearchTestDto;
import kr.co.coduck.dto.TestQtDto;
import kr.co.coduck.dto.TestResultDto;
import kr.co.coduck.dto.TestSubjResultDto;
import kr.co.coduck.form.SearchTestForm;
import kr.co.coduck.form.SearchTestFormByAdm;
import kr.co.coduck.form.TestModifyForm;
import kr.co.coduck.form.TestSubmitForm;
import kr.co.coduck.vo.Ep;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.TestQt;
import kr.co.coduck.vo.TestResult;
import kr.co.coduck.vo.TestSubj;
import kr.co.coduck.vo.TestSubjResult;
import kr.co.coduck.vo.ViewCk;


@Transactional
public interface TestService {
	
	List<Test> getTestsTopN();
	
	void updateTestQt(TestModifyForm form);
	
	TestQt getTestQtByNo(int no);
	
	void updateTest(Test test);
	
	SearchTestDto searchTest(SearchTestForm form, int userNo);
	
	void insertTest(Test test, List<TestQt> qts);
	
	Test getTestByNo(int no);
	
	List<TestQtDto> getTestQtsDtoByNo(int testNo);
	
	List<TestQtDto> getTestQtsDtosByNoNSubjNo(Map<String, Integer> map);
	
	List<TestSubj> getTestSubjsByTestNo(int testNo);

	void insertTestResultNSubjResult(TestSubmitForm form, int userNo);
	
	TestResult getTestResultByTestNoNUserNo(int testNo, int userNo);
	
	List<TestSubjResultDto> getTestSubjResultDtosByTestNoNUserNo(int testNo, int userNo);
	
	List<TestResultDto> getTestResultDtosByTestNoNUserNo(Map<String, Object> map);
	
	List<Ep> getTestEpsByCateNo(int no);
	
	List<Ep> getAllTestEp();
	
	List<SearchTestDetailDto> userBySearchTestList(int userNo);
	
	List<String> getAllTestNameNEp();
	
	void deleteTestByTestNo(int testNo);
	
	void deleteTestQtsByTestNo(int testNo);
}
