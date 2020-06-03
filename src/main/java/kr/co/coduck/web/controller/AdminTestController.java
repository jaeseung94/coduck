package kr.co.coduck.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coduck.dto.SearchTestDto;
import kr.co.coduck.dto.TestQtDto;
import kr.co.coduck.form.AddTestFormByExcel;
import kr.co.coduck.form.SearchTestFormByAdm;
import kr.co.coduck.form.TestModifyForm;
import kr.co.coduck.service.AdminTestService;
import kr.co.coduck.service.CategoryService;
import kr.co.coduck.service.TestService;
import kr.co.coduck.vo.Category;
import kr.co.coduck.vo.Pagination;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.TestQt;
import kr.co.coduck.vo.TestSubj;

@Controller
@RequestMapping("/admin")
public class AdminTestController {
	
	@Autowired
	private AdminTestService adminTestService; 
	
	@Autowired
	private CategoryService categoryService;
	
	@Autowired
	private TestService testService;
	
	//엑셀 다운
	@GetMapping("/excelDown.hta")
	public String excelDown(@RequestParam("testNo") int testNo, Model model) {
		Test test = testService.getTestByNo(testNo);
		List<TestQtDto> qts = testService.getTestQtsDtoByNo(testNo);
		model.addAttribute("test", test);
		model.addAttribute("qts", qts);
		
		return "excelDownView";
	}
	
	//가격 수정하기
	@PostMapping("/modifyPrice.hta")
	@ResponseBody
	public Test modifyPrice(@RequestParam("testNo") int testNo, 
			@RequestParam("modify-price") int price, @RequestParam("input-timer") int time ) {
		Test test = testService.getTestByNo(testNo);
		test.setNo(testNo);
		test.setPrice(price);
		test.setLtdTime(time);
		
		testService.updateTest(test);
		 
		return test;
	}
	
	//총점 계산하기
	@GetMapping("/getTotalScore.hta")
	@ResponseBody
	public Integer getTotalScore(@RequestParam("testNo") int testNo, @RequestParam("score") int score,
								@RequestParam("changedScore") int changedScore) {
		Test test = testService.getTestByNo(testNo);
		int totalScore = test.getTotalScore();
		System.out.println("=======================================================");
		System.out.println("totalScore : " + totalScore);
		totalScore -= (score - changedScore);
		System.out.println("totalScore : " + totalScore);
		test.setTotalScore(totalScore);
		testService.updateTest(test);
		return test.getTotalScore();
	}
	
	//문제 수정하기 제출할 때
	@GetMapping("/modifyQt.hta")
	@ResponseBody
	public TestQt modifyQt(TestModifyForm form) {
		testService.updateTestQt(form);
		return testService.getTestQtByNo(form.getQtNo());
	}
	
	//문제 수정폼 데이터
	@GetMapping("/getTestQt.hta")
	@ResponseBody
	public TestQt getTestQt(@RequestParam("qtNo") int qtNo) {
		return testService.getTestQtByNo(qtNo);
	}
	
	//시험 문제 확인하기 페이지
	@GetMapping("/test-qt-confirm.hta")
	public String showTestSubjQts(@RequestParam("testNo") int testNo, 
									@RequestParam("subjNo") int subjNo, Model model) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("testNo", testNo);
		map.put("subjNo", subjNo);
		model.addAttribute("testQtDtos", testService.getTestQtsDtosByNoNSubjNo(map));
		
		return "admin/test-qt-confirm";
	}
	
	//해당 시험의 과목별 정보 가져오기
	@GetMapping("/showSubjInfo.hta")
	@ResponseBody
	public List<TestSubj> showSubjInfo(@RequestParam("testNo") int testNo) {
		return testService.getTestSubjsByTestNo(testNo);
	}
	
	//수정하기 버튼 누를 때
	@GetMapping("/modifyTest.hta")
	@ResponseBody
	public SearchTestDto updateTest(SearchTestFormByAdm form){
		System.out.println("=============================");
		System.out.println("폼 조회 : " + form);
		System.out.println("=============================");
		System.out.println("관리자 시험 조회 : " + adminTestService.searchTestByAdm(form));
		
		SearchTestDto searchTestDto = new SearchTestDto();
		searchTestDto.setUpCategories(categoryService.getCatesByMainNo(20000));
		if(form.getMainCateNo() == -1) {
			searchTestDto.setDownCategories(categoryService.getTestCategoryByAdmin());
		} else {
			searchTestDto.setDownCategories(categoryService.getCatesByMainNo(form.getMainCateNo()));
		}
		
		if(form.getCateNo() == -1) {
			searchTestDto.setEps(testService.getAllTestEp());
		} else {
			searchTestDto.setEps(testService.getTestEpsByCateNo(form.getCateNo()));
		}
		searchTestDto.setSearchTestDetailDtos(adminTestService.searchTestByAdm(form));
		
		System.out.println("++++++++++++++++++++++++++++++++++++");
		System.out.println("searchTestDto : " + searchTestDto);
		return searchTestDto;
	}
	
	//시험 및 시험문제 삭제
	@GetMapping("/deleteTest.hta")
	public String deleteTest(@RequestParam("testNo") int testNo) {
		testService.deleteTestQtsByTestNo(testNo);
		testService.deleteTestByTestNo(testNo);
		
		return "redirect:/admin/test.hta";
	}
	
	//시험문제 올리고 확인할 때
	@GetMapping("/checkTestQt.hta")
	public String checkTestQt(Model model, @RequestParam("testNo") int testNo) {
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
		
		return "test/test-qt-check";
	}
	
	//공개 및 비공개 버튼 클릭시
	@GetMapping("/clickShowButton.hta")
	@ResponseBody
	public String clickShowButton(@RequestParam("testNo") int testNo) {
		Test findTest = testService.getTestByNo(testNo);
		System.out.println("=====================================================");
		System.out.println("findTest : " + findTest);
		String status = "";
		if(findTest.getIsDisplay().equals("Y")) {
			findTest.setIsDisplay("N");
			status += "N";
		} else {
			findTest.setIsDisplay("Y");
			status += "Y";
		}
		testService.updateTest(findTest);
		System.out.println("=====================================================");
		System.out.println("changedFindTest : " + findTest);
		return status;
	}
	
	//관리자 시험 조회
	@GetMapping("/searchTestByAdm.hta")
	@ResponseBody
	public SearchTestDto searchTestByAdmin(SearchTestFormByAdm form) {
		System.out.println("=============================");
		System.out.println("폼 조회 : " + form);
		System.out.println("=============================");
		System.out.println("관리자 시험 조회 : " + adminTestService.searchTestByAdm(form));
		
		SearchTestDto searchTestDto = new SearchTestDto();
		searchTestDto.setUpCategories(categoryService.getCatesByMainNo(20000));
		if(form.getMainCateNo() == -1) {
			searchTestDto.setDownCategories(categoryService.getTestCategoryByAdmin());
		} else {
			searchTestDto.setDownCategories(categoryService.getCatesByMainNo(form.getMainCateNo()));
		}
		
		if(form.getCateNo() == -1) {
			searchTestDto.setEps(testService.getAllTestEp());
		} else {
			searchTestDto.setEps(testService.getTestEpsByCateNo(form.getCateNo()));
		}
		//System.out.println("페이지번호 : " + pageNo);
		
		//int cnt = adminTestService.searchTestCnt(form);
		//Pagination pagination = new Pagination(pageNo, cnt, 10, 5);
		
		//System.out.println("페이지네이션 : " + pagination);
		
//		form.setBeginIndex(pagination.getBeginIndex());
//		form.setEndIndex(pagination.getEndIndex());
		
		searchTestDto.setSearchTestDetailDtos(adminTestService.searchTestByAdm(form));
		//searchTestDto.setPagination(pagination);
		
		System.out.println("++++++++++++++++++++++++++++++++++++");
		System.out.println("searchTestDto : " + searchTestDto);
		return searchTestDto;
	}
	
	//관리자 시험 조회
	@GetMapping("/test.hta")
	public String test(Model model) {
		List<Category> testMainCates = categoryService.getCatesByMainNo(20000);
		model.addAttribute("testMainCates", testMainCates);
		return "admin/test";
	}
	
	@GetMapping("/getTestNameNEp")
	@ResponseBody
	public List<String> getTestNameNEp(){
		return testService.getAllTestNameNEp();
	}
	
	@GetMapping("/getCates.hta")
	@ResponseBody
	public List<Category> getCates(@RequestParam("mainCateNo") int mainCateNo){
		System.out.println("maincateNo? " + mainCateNo);
		return categoryService.getCatesByMainNo(mainCateNo);
	}
	
	//엑셀로 시험 추가
	@PostMapping("/addTestByExcel.hta")
	public String addTest(AddTestFormByExcel form) throws Exception {
		
		System.out.println("=================form================" + form);
		
		if(form.getXlsfile().isEmpty()) {
			return "redirect:/admin/test.hta";
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
		System.out.println("==========================================");
		System.out.println("testDate : " + testDate);
		test.setTestDate(format.parse(testDate));
		System.out.println("test.getTestDate() : " + test.getTestDate());
		test.setName(name);
		test.setEp(ep);
		test.setPrice(form.getPrice());
		test.setPassScore(passScore);
		test.setLtdTime(ltdTime);
		test.setQtCnt(qtCnt);
		test.setCateNo(form.getTestCateNo());
		
		int rowCnt = sheet.getLastRowNum();
		
		List<TestQt> qts = new ArrayList<TestQt>();
		
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
			String img ="";
			if(row.getCell(9).getStringCellValue().equals("")) {
				img = null;
			} else {
				img = row.getCell(9).getStringCellValue();
			}
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
			//qt.setTestNo(test.getNo());
			
			qts.add(qt);
			System.out.println("===================================");
			System.out.println("TestQt : " + qt);
			
		}
		testService.insertTest(test, qts);
		
		return "redirect:/admin/test.hta";
	}
	
	//셀의 값을 문자열로 읽어오기
	private String getCellValue(Cell cell) {
		if (cell.getCellType() == CellType.STRING) {
			return cell.getStringCellValue();
		}
		return String.valueOf(cell.getNumericCellValue());
	}
	
}
