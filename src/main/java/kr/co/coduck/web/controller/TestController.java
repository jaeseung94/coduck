package kr.co.coduck.web.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.co.coduck.dto.SearchTestDto;
import kr.co.coduck.dto.TestQtDto;
import kr.co.coduck.dto.TestResultDto;
import kr.co.coduck.dto.TestSubjResultDto;
import kr.co.coduck.form.AddTestFormByExcel;
import kr.co.coduck.form.SearchTestForm;
import kr.co.coduck.form.TestSubmitForm;
import kr.co.coduck.service.CategoryService;
import kr.co.coduck.service.TestService;
import kr.co.coduck.vo.Category;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.TestQt;
import kr.co.coduck.vo.TestResult;
import kr.co.coduck.vo.TestSubj;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@Autowired
	private TestService testService;
	
	@Autowired
	private CategoryService categoryService;
	
	@GetMapping("/getTestInfo.hta")
	@ResponseBody
	public Test getTestInfo(@RequestParam("testno") int testNo, HttpSession session) {
		return testService.getTestByNo(testNo);
	}
	
	//시험목록에서 자세히보기
	@GetMapping("/clickShowDetailTest.hta")
	@ResponseBody
	public List<TestSubjResultDto> clickShowDetailTest(@RequestParam("testNo") int testNo, HttpSession session){
		User user = (User)session.getAttribute("LU");
		return testService.getTestSubjResultDtosByTestNoNUserNo(testNo, user.getNo());
	}
	
	//시험결과
	@GetMapping("/test-result.hta")
	public String showTestResult(@RequestParam("testNo") int testNo,  Model model, HttpSession session) {
		User user = (User)session.getAttribute("LU");
		Test test = testService.getTestByNo(testNo);
		List<TestSubjResultDto> subjResults = testService.getTestSubjResultDtosByTestNoNUserNo(testNo, user.getNo());
		List<TestSubj> subjs = testService.getTestSubjsByTestNo(testNo);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("testNo", testNo);
		map.put("userNo", user.getNo());
		map.put("isTrue", "N");
		List<TestResultDto> falseQts = testService.getTestResultDtosByTestNoNUserNo(map);

		map.put("isTrue", "Y");
		List<TestResultDto> trueQts = testService.getTestResultDtosByTestNoNUserNo(map);
		
		model.addAttribute("test", test);
		model.addAttribute("subjResults", subjResults);
		model.addAttribute("trueQts", trueQts);
		model.addAttribute("falseQts", falseQts);
		return "test/test-result";
	}
	
	//폼의 입력값에 대해서 유효성 검사
	@PostMapping("/submitTest.hta")
	@Transactional
	//public String submitTest(@Validated TestSubmitForm form) { 공백을 null로 바꿀때
	public String submitTest(TestSubmitForm form, HttpSession session) {
		
		User user =  (User)session.getAttribute("LU");
		System.out.println("=====================");
		System.out.println(form);
		
		testService.insertTestResultNSubjResult(form, user.getNo());
		
		return "redirect:/test/test-result.hta?testNo=" + form.getTestNo();
	}

	//시험 문제지 창
	@GetMapping("/takeaTest.hta")
	public String takeaTest(@RequestParam("testNo") int testNo, Model model) {
		Test test = testService.getTestByNo(testNo);
		List<TestSubj> subjs = testService.getTestSubjsByTestNo(testNo);
		List<TestQtDto> testQtDtos = testService.getTestQtsDtoByNo(testNo);
		
		System.out.println("===========================");
		System.out.println(test);
		System.out.println(subjs);
		System.out.println("testQtDtos" + testQtDtos);
		
		model.addAttribute("test", test);
		model.addAttribute("subjs", subjs);
		model.addAttribute("testQtDtos", testQtDtos);
		
		return "/test/test-qt";
	}
	
	//시험 검색
	@GetMapping("/getTestData.hta")
	@ResponseBody
	public SearchTestDto searchTest(SearchTestForm form, HttpSession session) {
		System.out.println("--------------------------form?" + form);
		User user = (User)session.getAttribute("LU");
		SearchTestDto sTDto = testService.searchTest(form, user.getNo());
		System.out.println("sTDto : " + sTDto);
		
		return sTDto;
	}
	
	@RequestMapping("/test-list.hta")
	public String searchPage() {
		return "test/test-list";
	}
	
	/* Converts empty strings into null when a form is submitted */  
	/*
	 * @InitBinder public void initBinder(WebDataBinder binder) {
	 * binder.registerCustomEditor(String.class, new StringTrimmerEditor(true)); }
	 */
	@InitBinder
	public void stringToDateBinding(WebDataBinder binder) {
		SimpleDateFormat simpeDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(simpeDateFormat, false));
	}
	
}
