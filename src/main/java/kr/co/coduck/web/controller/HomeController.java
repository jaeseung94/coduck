package kr.co.coduck.web.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.coduck.dto.LectureDto;
import kr.co.coduck.service.LectService;
import kr.co.coduck.service.TestService;
import kr.co.coduck.vo.Test;

@Controller
public class HomeController {
	
	private static Logger log = Logger.getLogger(LectureController.class);
	
	@Autowired
	private LectService lectservice;
	
	@Autowired
	private TestService testService;
	
	
	@RequestMapping("/home.hta")
	public String coduckHome(Model model) {
		
		List<LectureDto> likeLects = lectservice.TopFiveLecturesByLike();
		for(LectureDto like : likeLects) {
			LectureDto counts = lectservice.getAllCountByLectureNo(like.getNo());
			like.setCounts(counts);
		}
		
		List<LectureDto> freeLects = lectservice.TopFiveFreeLectures();
		for(LectureDto free : freeLects) {
			LectureDto counts = lectservice.getAllCountByLectureNo(free.getNo());
			free.setCounts(counts);
		}
		
		List<LectureDto> newLects = lectservice.TopFourNewLectures();
		for(LectureDto newLect : newLects) {
			LectureDto counts = lectservice.getAllCountByLectureNo(newLect.getNo());
			newLect.setCounts(counts);
		}
		
		List<LectureDto> testLects = lectservice.TopFourTestLectures();
		for(LectureDto test : testLects) {
			LectureDto counts = lectservice.getAllCountByLectureNo(test.getNo());
			test.setCounts(counts);
		}
		
		model.addAttribute("likeLects", likeLects);
		model.addAttribute("freeLects", freeLects);
		model.addAttribute("newLects", newLects);
		model.addAttribute("testLects", testLects);
		model.addAttribute("tests", testService.getTestsTopN());
		
		return "home";
	}
	
}
