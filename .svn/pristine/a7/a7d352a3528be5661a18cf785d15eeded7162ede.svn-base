package kr.co.coduck.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	
	@GetMapping("/main.hta")
	public String main() {
		return "teacher/main";
	}
	
	@GetMapping("/statistics/revenue.hta")
	public String revenue() {
		return "teacher/statistics/revenue";
	}
}
