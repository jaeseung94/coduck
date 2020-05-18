package kr.co.coduck.dao;

import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.SearchTestDetailDto;
import kr.co.coduck.dto.TestQtDto;
import kr.co.coduck.dto.TestResultDto;
import kr.co.coduck.dto.TestSubjResultDto;
import kr.co.coduck.form.SearchTestFormByAdm;
import kr.co.coduck.vo.Ep;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.TestQt;
import kr.co.coduck.vo.TestResult;
import kr.co.coduck.vo.TestSubj;
import kr.co.coduck.vo.TestSubjResult;
import kr.co.coduck.vo.ViewCk;

public interface TestDao {
	
	List<Ep> getTestEpsByCateNo(int no);
	
	List<Ep> getAllTestEp();
	
	List<SearchTestDetailDto> searchTest(Map<String, Object> map);
	
	Test getTestByNo(int no);
	
	void insertTest(Test test);
	
	void insertTestQt(TestQt qt);
	
	List<TestQtDto> getTestQtsDtoByNo(int testNo);
	
	List<TestSubj> getTestSubjsByTestNo(int testNo);
	
	void insertTestSubjResult(TestSubjResult testSubjResult);
	
	void insertTestResult(TestResult testResult);
	
	TestResult getTestResultByTestNoNUserNo(Map<String, Integer> map);
	
	List<TestSubjResultDto> getTestSubjResultDtosByTestNoNUserNo(Map<String, Integer> map);
	
	void insertViewCk(ViewCk viewCk);
	
	List<TestResultDto> getTestResultDtosByTestNoNUserNo(Map<String, Object> map);
	
	List<SearchTestDetailDto> searchTestByAdm(SearchTestFormByAdm form);
	
}
