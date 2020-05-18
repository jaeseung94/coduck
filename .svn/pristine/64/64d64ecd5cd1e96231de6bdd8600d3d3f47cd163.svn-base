package kr.co.coduck.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.CategoryDao;
import kr.co.coduck.dao.TestDao;
import kr.co.coduck.dto.SearchTestDetailDto;
import kr.co.coduck.dto.SearchTestDto;
import kr.co.coduck.dto.TestQtDto;
import kr.co.coduck.dto.TestResultDto;
import kr.co.coduck.dto.TestSubjResultDto;
import kr.co.coduck.form.SearchTestForm;
import kr.co.coduck.form.TestSubmitForm;
import kr.co.coduck.vo.Category;
import kr.co.coduck.vo.Ep;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.TestQt;
import kr.co.coduck.vo.TestResult;
import kr.co.coduck.vo.TestSubj;
import kr.co.coduck.vo.TestSubjResult;
import kr.co.coduck.vo.ViewCk;

@Service
public class TestServiceImpl implements TestService{
	
	@Autowired
	private TestDao testDao;
	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public SearchTestDto searchTest(SearchTestForm form, int userNo) {
		SearchTestDto dto = new SearchTestDto();
		System.out.println("form? " + form);
		int upCateNo = form.getUpCateNo();
		int downCateNo = form.getDownCateNo();
		int testNo = form.getTestNo();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", userNo);
		
		//시험 카테고리에 속하는 상위카테고리 조회(기사, 기능사)
		List<Category> upCategories = categoryDao.getCatesByMainCateNo(20000);
		System.out.println("upCategories : "  + upCategories); 
		dto.setUpCategories(upCategories);
		
		//하위카테고리(정보처리기사, 산업기사등) 조회
		if(upCateNo != 0) {
			List<Category> downcateCategories = categoryDao.getCatesByMainCateNo(upCateNo);
			dto.setDownCategories(downcateCategories);
			map.put("upCateNo", upCateNo);
		}
			
		//회차조회하기
		if(downCateNo != 0) {
			List<Ep> eps = testDao.getTestEpsByCateNo(downCateNo);
			dto.setEps(eps);
			map.put("downCateNo", downCateNo);
		}
		
		//시험 조회하기
		if(testNo != 0) {
			map.put("testNo", testNo);
		}
		
		if(map.isEmpty()) {
			return dto;
		}
		
		List<SearchTestDetailDto> tests = testDao.searchTest(map);
		System.out.println("------------------tests?---------- " + tests);
		dto.setSearchTestDetailDtos(tests);
		
		return dto;
	}

	@Override
	public void insertTest(Test test) {
		testDao.insertTest(test);
	}

	@Override
	public void insertTestQt(TestQt qt) {
		testDao.insertTestQt(qt);
		
	}

	@Override
	public List<TestQtDto> getTestQtsDtoByNo(int testNo) {
		return testDao.getTestQtsDtoByNo(testNo);
	}

	@Override
	public List<TestSubj> getTestSubjsByTestNo(int testNo) {
		return testDao.getTestSubjsByTestNo(testNo);
	}

	@Override
	public Test getTestByNo(int no) {
		return testDao.getTestByNo(no);
	}
	
	@Override
	public void insertTestResultNSubjResult(TestSubmitForm form, int userNo) {
		int testNo = form.getTestNo();
		List<Integer> ans =  form.getAns();
		List<TestSubj> subjs = testDao.getTestSubjsByTestNo(testNo);
		List<TestQtDto> dtos = testDao.getTestQtsDtoByNo(testNo);
		
		int i = 0;
		int failCnt = 0;//과락개수
		int totalScore = 0;//과목별 점수의 총점
		
		for(TestSubj e : subjs) {
			int qtCnt = i + e.getQtCnt();
			int score = 0;//과목별 점수
			int ansCnt = 0;//과목별 정답수
			String isPassed = "Y";
			//과목의 문항수만큼 반복
			while(i < qtCnt) {
				ViewCk viewCk = new ViewCk();
				viewCk.setQtNo(dtos.get(i).getQtNo());
				viewCk.setUserNo(userNo);
				viewCk.setCkNum(ans.get(i));
				viewCk.setIsTrue("N");
				if(ans.get(i) == dtos.get(i).getAns()) {
					viewCk.setIsTrue("Y");
					score += dtos.get(i).getScore();
					ansCnt++;
				}
				testDao.insertViewCk(viewCk);
				i++;
			}
			
			totalScore +=score;
			//해당 과목의 정답수와 총점을 db에 넣기
			if(score < 40) {
				isPassed = "N";
				failCnt++;
			}
			
			TestSubjResult testSubjResult = new TestSubjResult();
			testSubjResult.setUserNo(userNo);
			testSubjResult.setTestNo(testNo);
			testSubjResult.setSubjNo(e.getNo());
			testSubjResult.setScore(score);
			testSubjResult.setAnsCnt(ansCnt);
			testSubjResult.setIsPassed(isPassed);		
			
			testDao.insertTestSubjResult(testSubjResult);
		}
		
		TestResult testResult = new TestResult();
		testResult.setAvg(totalScore/(subjs.size()*1.0));
		if(failCnt > 0) {
			testResult.setIsPassed("N");
		} else {
			testResult.setIsPassed("Y");
		}
		testResult.setPassedTime(form.getTime());
		testResult.setTestNo(testNo);
		testResult.setUserNo(userNo);
		
		testDao.insertTestResult(testResult);
	}

	@Override
	//유저번호
	public TestResult getTestResultByTestNoNUserNo(int testNo, int userNo) {
		Map<String , Integer> map = new HashMap<String, Integer>();
		map.put("testNo", testNo);
		map.put("userNo", userNo);
		return testDao.getTestResultByTestNoNUserNo(map);
	}
	
	
	@Override
	public List<TestSubjResultDto> getTestSubjResultDtosByTestNoNUserNo(int testNo, int userNo) {
		Map<String , Integer> map = new HashMap<String, Integer>();
		map.put("testNo", testNo);
		map.put("userNo", userNo);
		return testDao.getTestSubjResultDtosByTestNoNUserNo(map);
	}

	@Override
	public List<TestResultDto> getTestResultDtosByTestNoNUserNo(Map<String, Object> map) {
		return testDao.getTestResultDtosByTestNoNUserNo(map);
	}
	
}

