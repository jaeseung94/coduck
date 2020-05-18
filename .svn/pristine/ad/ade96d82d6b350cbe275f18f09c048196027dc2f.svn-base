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
	
	//엑셀로 시험 추가
	@PostMapping("/addTestByExcel.hta")
	public String addTest(AddTestFormByExcel form) throws Exception {
		
		System.out.println("=================form================" + form);
		
		if(form.getXlsfile().isEmpty()) {
			return "redirect:/test/test-manage.hta";
		}
		
		Workbook workBook = WorkbookFactory.create(form.getXlsfile().getInputStream());
		
		Sheet sheet = workBook.getSheetAt(0);
		
		Row mainRow = sheet.getRow(1);
		String name = mainRow.getCell(0).getStringCellValue();
		String testDate = mainRow.getCell(1).getStringCellValue();
		String ep = mainRow.getCell(2).getStringCellValue();
		int passScore = (int)mainRow.getCell(3).getNumericCellValue();
		int ltdTime = (int)mainRow.getCell(4).getNumericCellValue();
		int qtCnt = (int)mainRow.getCell(5).getNumericCellValue();
		
		Test test = new Test();
		SimpleDateFormat format = new SimpleDateFormat("yyyy.MM.dd");
		test.setTestDate(format.parse(testDate));
		test.setName(name);
		test.setEp(ep);
		test.setPrice(form.getPrice());
		test.setPassScore(passScore);
		test.setLtdTime(ltdTime);
		test.setQtCnt(qtCnt);
		test.setCateNo(form.getTestCateNo());
		
		testService.insertTest(test);
		
		int rowCnt = sheet.getLastRowNum();
		
		for(int i=10; i<=rowCnt; i++) {
			Row row = sheet.getRow(i);
			
			int num = (int)row.getCell(0).getNumericCellValue();
			String content = row.getCell(1).getStringCellValue();
			int score = (int)row.getCell(2).getNumericCellValue();
			String v1 = getCellValue(row.getCell(3));
			String v2 = getCellValue(row.getCell(4));
			String v3 = getCellValue(row.getCell(5));
			String v4 = getCellValue(row.getCell(6));
			int ans = (int)row.getCell(7).getNumericCellValue();
			int trueRate = (int)row.getCell(8).getNumericCellValue();
			String img = row.getCell(9).getStringCellValue();
			int subjNo = (int)row.getCell(10).getNumericCellValue();
			
			TestQt qt = new TestQt();
			qt.setNum(num);
			qt.setContent(content);
			qt.setScore(score);
			qt.setV1(v1);
			qt.setV2(v2);
			qt.setV3(v3);
			qt.setV4(v4);
			qt.setAns(ans);
			qt.setTrueRate(trueRate);
			qt.setImg(img);
			qt.setSubjNo(subjNo);
			qt.setTestNo(test.getNo());
			
			System.out.println("===================================");
			System.out.println("TestQt : " + qt);
			
			
			testService.insertTestQt(qt);
		}
		
		return "redirect:/test/test-manage.hta";
	}
	
	//셀의 값을 문자열로 읽어오기
	private String getCellValue(Cell cell) {
		if (cell.getCellType() == CellType.STRING) {
			return cell.getStringCellValue();
		}
		return String.valueOf(cell.getNumericCellValue());
	}
	
	//시험 관리 창
	@RequestMapping("/test-manage.hta")
	public String manageTest(Model model) {
		List<Category> testMainCates = categoryService.getCatesByMainNo(20000);
		model.addAttribute("testMainCates", testMainCates);
		return "/test/test-manage";
	}

	@GetMapping("/getCates.hta")
	@ResponseBody
	public List<Category> getCates(@RequestParam("mainCateNo") int mainCateNo){
		System.out.println("maincateNo? " + mainCateNo);
		return categoryService.getCatesByMainNo(mainCateNo);
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
