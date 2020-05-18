package kr.co.coduck.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.coduck.dao.LectDao;
import kr.co.coduck.dto.LectureCourseDto;

@RestController
public class LectRestController {

	@Autowired
	private LectDao lectDao;
	
	@GetMapping("/api/lecture")
	public List<LectureCourseDto> getLectureCource() {
		return lectDao.getLectureCourseDto();
	}
	
}
