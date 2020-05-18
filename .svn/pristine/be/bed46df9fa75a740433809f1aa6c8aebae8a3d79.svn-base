package kr.co.coduck.web.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.coduck.dto.ChapterDto;
import kr.co.coduck.dto.LessonDto;
import kr.co.coduck.dto.ReviewStarDto;
import kr.co.coduck.service.CategoryService;
import kr.co.coduck.service.LectService;
import kr.co.coduck.service.QuestionService;
import kr.co.coduck.service.ReviewService;
import kr.co.coduck.vo.Category;
import kr.co.coduck.vo.LectureCriteria;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/lecture")
public class LectureController {

	private static Logger log = Logger.getLogger(LectureController.class);

	@Autowired
	private LectService lectservice;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private QuestionService questionService;

	@RequestMapping("/main.hta")
	public String mainByCateNo(LectureCriteria cri, Model model) {

		List<Category> categories = categoryService.getAllLectureCategories();

		model.addAttribute("categories", categories);

		return "lecture/main";
	}

	@RequestMapping("/detail/description.hta")
	public String description(@RequestParam("lectureNo") int lectureNo, Model model) {

		List<ChapterDto> chapters = lectservice.getChapterByLectureNo(lectureNo);
		chapters.forEach(c -> c.setLessons(lectservice.getLessonByChpaterNo(c.getChapter().getNo())));

		List<ReviewStarDto> reviewStarAvgs = reviewService.getAllReivewStarAvg(lectureNo);

		model.addAttribute("lecture", lectservice.getLectureByLectureNo(lectureNo));
		model.addAttribute("chapters", chapters);
		model.addAttribute("counts", lectservice.getAllCountByLectureNo(lectureNo));
		model.addAttribute("reviews", reviewService.getReviewByLectureNo(lectureNo));
		model.addAttribute("reviewStarAvgs", setReviewStarAverage(reviewStarAvgs));

		return "lecture/detail/description";
	}

	@RequestMapping("/detail/dashboard.hta")
	public String dashboard(@RequestParam("lectureNo") int lectureNo, Model model, HttpSession session) {

		User user = (User) session.getAttribute("LU");
	
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("userNo", user.getNo()); 
		map.put("lectureNo", lectureNo);
		log.info("최근" + lectservice. getLessonByRecent(map));
		model.addAttribute("lecture", lectservice.getLectureByLectureNo(lectureNo));
		model.addAttribute("counts", lectservice.getAllCountByLectureNo(lectureNo));
		model.addAttribute("questions", questionService.getQuestionByRecent(lectureNo));
		model.addAttribute("lessonDto", lectservice.getProgressPercentInDashboard(map));
		model.addAttribute("recentList", lectservice. getLessonByRecent(map));

		return "lecture/detail/dashboard";
	}

	@RequestMapping("/detail/question.hta")
	public String question(@RequestParam("lectureNo") int lectureNo, Model model) {

		model.addAttribute("lecture", lectservice.getLectureByLectureNo(lectureNo));
		model.addAttribute("counts", lectservice.getAllCountByLectureNo(lectureNo));

		return "lecture/detail/question";
	}

	@RequestMapping("/player/player.hta")
	public String player(@RequestParam("lectureNo") int lectureNo, Model model, HttpSession session) {

		User user = (User) session.getAttribute("LU");
	
		Map<String, Object> map = new HashMap<String, Object>(); 
		map.put("userNo", user.getNo()); 
		map.put("lectureNo", lectureNo);
		
		model.addAttribute("lecture", lectservice.getLectureByLectureNo(lectureNo));
		model.addAttribute("counts", lectservice.getAllCountByLectureNo(lectureNo));
		model.addAttribute("questions", questionService.getQuestionByRecent(lectureNo));
		model.addAttribute("lessonDto", lectservice.getProgressPercentInDashboard(map));
		
		return "lecture/player/player";
	}

	// 리뷰 평균평점 계산
	private List<ReviewStarDto> setReviewStarAverage(List<ReviewStarDto> reviewStarAvgs) {

		int[] tempStar = new int[5];

		reviewStarAvgs.forEach(r -> tempStar[r.getStar() - 1] = r.getStar());

		for (int i = 0; i < tempStar.length; i++) {
			if (tempStar[i] == 0)
				reviewStarAvgs.add(new ReviewStarDto(i + 1, 0, 0));
		}

		reviewStarAvgs.sort((o1, o2) -> o1.getStar() > o2.getStar() ? -1 : 1);

		return reviewStarAvgs;
	}
}
