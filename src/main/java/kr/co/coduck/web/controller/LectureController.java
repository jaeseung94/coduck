package kr.co.coduck.web.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.coduck.dto.ChapterDto;
import kr.co.coduck.dto.LectureCourseDto;
import kr.co.coduck.dto.ReviewStarDto;
import kr.co.coduck.service.CategoryService;
import kr.co.coduck.service.LectService;
import kr.co.coduck.service.QuestionService;
import kr.co.coduck.service.ReviewService;
import kr.co.coduck.vo.Category;
import kr.co.coduck.vo.Lect;
import kr.co.coduck.vo.LectureCriteria;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/lecture")
public class LectureController {

	private final String VIDEO_PATH = "C:\\projects\\spring_workspace\\coduck\\src\\main\\webapp\\resources\\video";
	private final String VIDEO_PATH2 = "C:\\app\\apache-tomcat-9.0.27\\wtpwebapps\\coduck\\resources\\video";
	private final String IMAGE_PATH = "C:\\projects\\spring_workspace\\coduck\\src\\main\\webapp\\resources\\images\\lecture";
	private final String IMAGE_PATH2 = "C:\\app\\apache-tomcat-9.0.27\\wtpwebapps\\coduck\\resources\\images\\lecture";
	private static Logger log = Logger.getLogger(LectureController.class);

	@Autowired
	private LectService lectservice;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private CategoryService categoryService;

	@Autowired
	private QuestionService questionService;

	// 강좌 등록 폼
	@RequestMapping("/form/lecture-form")
	public String lectrueForm(Model model) {

		model.addAttribute("categories", categoryService.getAllLectureCategories());

		return "lecture/form/lecture-form";
	}

	// 레슨 등록 폼
	@RequestMapping(value = "/form/lesson-form", method = RequestMethod.GET)
	public String lessonForm(Model model) {

		return "lecture/form/lesson-form";
	}

	// 강좌 등록
	@PostMapping("/addLecture")
	public String addLecture(@RequestParam("sampleVideo") MultipartFile vmf,
			@RequestParam("thumbnailImage") MultipartFile imf, Lect lecture, HttpSession session) throws Exception {

		String videoFileName = UUID.randomUUID().toString() + vmf.getOriginalFilename();
		String imageFileName = UUID.randomUUID().toString() + imf.getOriginalFilename();

		log.info("VIDEO FILE NAME: " + videoFileName);
		log.info("IMAGE FILE NAME: " + imageFileName);

		File videoFile = new File(VIDEO_PATH, videoFileName); // new 파일이 아닌 파일 객체를 생성
		File videoFile2 = new File(VIDEO_PATH2, videoFileName); // new 파일이 아닌 파일 객체를 생성
		File imageFile = new File(IMAGE_PATH, imageFileName); // new 파일이 아닌 파일 객체를 생성
		File imageFile2 = new File(IMAGE_PATH2, imageFileName); // new 파일이 아닌 파일 객체를 생성
		try {
			vmf.transferTo(videoFile);
			FileUtils.copyFile(videoFile, videoFile2);
			imf.transferTo(imageFile);

		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}

		User user = (User) session.getAttribute("LU");
		lecture.setUserNo(user.getNo());
		lecture.setSamplePath("/resources/video/" + videoFileName);
		lecture.setImagePath("/resources/images/lecture/" + imageFileName);
		lecture.setFree();
		lectservice.insertLecture(lecture);
		return "redirect:/teacher/main.hta";
	}

	// 강좌 메인
	@RequestMapping("/main.hta")
	public String mainByCateNo(LectureCriteria cri, Model model) {

		List<Category> categories = categoryService.getAllLectureCategories();

		model.addAttribute("categories", categories);

		return "lecture/main";
	}

	// 강좌 소개
	@RequestMapping("/detail/description.hta")
	public String description(@RequestParam("lectureNo") int lectureNo, Model model, HttpSession session) {

		List<ChapterDto> chapters = lectservice.getChapterByLectureNo(lectureNo);
		chapters.forEach(c -> c.setLessons(lectservice.getLessonByChpaterNo(c.getChapter().getNo())));

		List<ReviewStarDto> reviewStarAvgs = reviewService.getAllReivewStarAvg(lectureNo);

		model.addAttribute("lecture", lectservice.getLectureByLectureNo(lectureNo));
		model.addAttribute("chapters", chapters);
		model.addAttribute("counts", lectservice.getAllCountByLectureNo(lectureNo));
		model.addAttribute("reviews", reviewService.getReviewByLectureNo(lectureNo));
		model.addAttribute("reviewStarAvgs", setReviewStarAverage(reviewStarAvgs));

		User user = (User) session.getAttribute("LU");
		if (user != null) {

			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userNo", user.getNo());
			map.put("lectureNo", lectureNo);

			model.addAttribute("buyer", lectservice.getIsPurchaseLectureByUser(map));

		}

		return "lecture/detail/description";
	}

	// 강좌 대시보드
	@RequestMapping("/detail/dashboard.hta")
	public String dashboard(@RequestParam("lectureNo") int lectureNo, Model model, HttpSession session) {

		User user = (User) session.getAttribute("LU");
		if (user != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userNo", user.getNo());
			map.put("lectureNo", lectureNo);

			model.addAttribute("buyer", lectservice.getIsPurchaseLectureByUser(map));
			model.addAttribute("lessonDto", lectservice.getProgressPercentInDashboard(map));
			model.addAttribute("recentList", lectservice.getLessonByRecent(map));
		}

		model.addAttribute("lecture", lectservice.getLectureByLectureNo(lectureNo));
		model.addAttribute("counts", lectservice.getAllCountByLectureNo(lectureNo));
		model.addAttribute("questions", questionService.getQuestionByRecent(lectureNo));

		return "lecture/detail/dashboard";
	}

	// 강좌 질문
	@RequestMapping("/detail/question.hta")
	public String question(@RequestParam("lectureNo") int lectureNo, Model model, HttpSession session) {

		User user = (User) session.getAttribute("LU");
		if (user != null) {
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("userNo", user.getNo());
			map.put("lectureNo", lectureNo);

			model.addAttribute("buyer", lectservice.getIsPurchaseLectureByUser(map));
		}
		model.addAttribute("lecture", lectservice.getLectureByLectureNo(lectureNo));
		model.addAttribute("counts", lectservice.getAllCountByLectureNo(lectureNo));

		return "lecture/detail/question";
	}

	// 강좌 플레이어
	@RequestMapping("/player/player.hta")
	public String player(@RequestParam("lectureNo") int lectureNo, Model model, HttpSession session) {

		User user = (User) session.getAttribute("LU");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("userNo", user.getNo());
		map.put("lectureNo", lectureNo);

		LectureCourseDto lectureCourseDto = lectservice.getLectureCourseByLecureNo(lectureNo);

		model.addAttribute("lectureCourse", lectureCourseDto);
		model.addAttribute("lessonDto", lectservice.getProgressPercentInDashboard(map));
		model.addAttribute("firstLesson", lectservice.getFirstLessonByLectureNo(lectureNo));
		model.addAttribute("historys", lectservice.getAllLessonHistoryByMap(map));

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
