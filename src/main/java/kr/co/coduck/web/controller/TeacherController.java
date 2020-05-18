package kr.co.coduck.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coduck.dto.IncomeDto;
import kr.co.coduck.dto.LectureDto;
import kr.co.coduck.dto.LessonDto;
import kr.co.coduck.service.LectService;
import kr.co.coduck.vo.LectureCriteria;
import kr.co.coduck.vo.Pagination;
import kr.co.coduck.vo.User;

@RequestMapping("/teacher")
@Controller
public class TeacherController {
	
	private static Logger log = Logger.getLogger(TeacherController.class);
	
	@Autowired
	private LectService lectservice;
	 
	 @GetMapping("/main")
	 public String main() {
		 return "teacher/main";
	 }
	 
	// 강사가 등록한 강좌 조건별 조회 
	@GetMapping("/searchMyLecture")
	@ResponseBody
	public Map<String, Object> main(HttpSession session, LectureCriteria cri) {
		
		User teacher = (User) session.getAttribute("LU");
		cri.setUserNo(teacher.getNo());
		cri.setPage(cri.getPage() <= 0 ? 1 : cri.getPage());
		
		// Pagination
		int totalCount = lectservice.getTeachersLectureCountByCriteria(cri);
		
		Pagination pagination = new Pagination(cri.getPage(), totalCount, 15, 3);
		cri.setBeginIndex(pagination.getBeginIndex());
		cri.setEndIndex(pagination.getEndIndex());
		
		Map<String, Object> model = new HashMap<String, Object>();
		
		List<LectureDto> lectureDtos = lectservice.getLectureListByCriteria(cri);
		
		for (LectureDto lecture : lectureDtos) {
			lecture.setCounts(lectservice.getAllCountByLectureNo(lecture.getNo()));
			lecture.setLessonDto(lectservice.getLessonCountAndLengthByLectureNo(lecture.getNo())); 
		}

		model.put("lectures", lectureDtos);
		model.put("beginPage", pagination.getBeginPage());
		model.put("endPage", pagination.getEndPage());
		model.put("totalPage", pagination.getTotalPagesCount());
		
		return model;
	}
	
	 @GetMapping("/statistics")
	 @ResponseBody
	 public List<IncomeDto> income(LectureCriteria cri, HttpSession session) {
	  
		 User teacher = (User) session.getAttribute("LU");
		 cri.setUserNo(teacher.getNo());
		  
		 List<IncomeDto> incomes = lectservice.getTeacherIncomeByCriteria(cri);
		
		 return incomes; 
	 }

	// 강사 수익 조회
	@GetMapping("/income")
	public String income(HttpSession session, Model model) {
		
		User teacher = (User) session.getAttribute("LU");
		
		IncomeDto incomeDto = lectservice.getTeacherIncomeStatistics(teacher.getNo());
		if (incomeDto.getTeacherScore() != 0) {
			incomeDto.setTeacherScore(lectservice.getTeacherAvgScore(teacher.getNo()));
		}
		model.addAttribute("income", incomeDto);
		return "teacher/income";
	} 
	
	@GetMapping("/question")
	public String question() {
		return "teacher/question";
	}

}
