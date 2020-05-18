package kr.co.coduck.web.controller;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.coduck.dto.AdminLectCriteria;
import kr.co.coduck.dto.AdminLectDto;
import kr.co.coduck.dto.AdminLessonDto;
import kr.co.coduck.dto.NoticeCriteria;
import kr.co.coduck.form.NoticeAddForm;
import kr.co.coduck.form.NoticeUpdateForm;
import kr.co.coduck.service.AdminIncomeService;
import kr.co.coduck.service.AdminLectService;
import kr.co.coduck.service.AdminQnaService;
import kr.co.coduck.service.CategoryService;
import kr.co.coduck.service.LectService;
import kr.co.coduck.service.NoticeService;
import kr.co.coduck.vo.Category;
import kr.co.coduck.vo.Notice;
import kr.co.coduck.vo.Pagination;
import kr.co.coduck.vo.User;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private CategoryService categoryService;
	@Autowired
	private AdminLectService adminLectService;
	@Autowired
	private AdminQnaService adminQnaService;
	@Autowired
	private LectService lectService;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private AdminIncomeService adminIncomeService;
	
	@Value("${notice.source.directory}")
	// src/main/resources/META-INF/config/application-config.properties
	private String sourceDirectory;

	@GetMapping("/home.hta")
	public String home(Model model) {
		
		int adminLectIncomeByDay = adminIncomeService.getLectIncomeByDay();
   		int adminTestIncomeByDay = adminIncomeService.getTestIncomeByDay();
   		
   		model.addAttribute("adminLectIncomeByDay", adminLectIncomeByDay);
   		model.addAttribute("adminTestIncomeByDay", adminTestIncomeByDay);
   		
   		int adminLectIncomeByThree = adminIncomeService.getLectIncomeByThree();
   		int adminTestIncomeByThree = adminIncomeService.getTestIncomeByThree();
   		
   		model.addAttribute("adminLectIncomeByThree", adminLectIncomeByThree);
   		model.addAttribute("adminTestIncomeByThree", adminTestIncomeByThree);
   		
   		int adminLectIncomeByWeek = adminIncomeService.getLectIncomeByWeek();
   		int adminTestIncomeByWeek = adminIncomeService.getTestIncomeByWeek();
   		
   		model.addAttribute("adminLectIncomeByWeek", adminLectIncomeByWeek);
   		model.addAttribute("adminTestIncomeByWeek", adminTestIncomeByWeek);
   		
   		Map<String, Object> adminIncomeRate = adminIncomeService.getIncomeRate();
   		
   		model.addAttribute("adminIncomeRate", adminIncomeRate);
		
		return "admin/home";
	}

//	@GetMapping("/lecture.hta")
//	public String lecture() {
//		return "admin/lecture";
//	}

//	@GetMapping("/test.hta")
//	public String test() {
//		return "admin/test";
//	}

//	@GetMapping("/lecturecategory.hta")
//	public List<Category> lecturecategory(Model model) throws Exception {
//		
//		return categoryService.getLectureCategoryByAdmin();
//	}

	
	@GetMapping("/lecture.hta") 
	public String lectureSearch(AdminLectCriteria criteria, @RequestParam(value="pageno", required = false, defaultValue = "1") int pageNo, Model model) {
	 
		int totalCnt = adminLectService.getLectCntByCriteria(criteria); 
		Pagination pagination = new Pagination(pageNo, totalCnt, 10, 5);
	 
	    criteria.setBeginIndex(pagination.getBeginIndex());
	    criteria.setEndIndex(pagination.getEndIndex()); 
	    List<AdminLectDto> lectList = adminLectService.getLectByCriteria(criteria);
	    
	    List<Category> categories = categoryService.getLectureCategoryByAdmin();
	    model.addAttribute("categories", categories);
  
	    model.addAttribute("lectList", lectList ); 
	    model.addAttribute("pagination", pagination);
	 
	    return "admin/lecture";     
	}	  
	
	@PostMapping("/confirmlect.hta")
	@ResponseBody
	public void confirmlect(@RequestParam("lectNo") int lectNo) throws Exception {
		adminLectService.confirmLect(lectNo);
	}
	
	@PostMapping("/denylect.hta")
	@ResponseBody
	public void denylect(@RequestParam("lectNo") int lectNo) throws Exception {
		adminLectService.denyLect(lectNo);
	}
	
	@GetMapping("/lectdetail.hta")
	@ResponseBody
	public List<AdminLessonDto> lectDetail(@RequestParam("lectNo") int lectNo) throws Exception {
		
		return adminLectService.getLessonsByLectNo(lectNo);
	} 
	
	//-------------------------------------------------- 공지사항 
	@GetMapping("/notice.hta")
	public String notice(NoticeCriteria criteria, @RequestParam(value="pageNo", required = false, defaultValue = "1") int pageNo, Model model) throws Exception {
		
		int totalCnt = noticeService.getNoticeCntByCriteria(criteria); 
		Pagination pagination = new Pagination(pageNo, totalCnt, 10, 5);
	 
	    criteria.setBeginIndex(pagination.getBeginIndex());
	    criteria.setEndIndex(pagination.getEndIndex()); 
	    List<Notice> noticeList = noticeService.getNoticeByCriteria(criteria);
	    
	    model.addAttribute("noticeList", noticeList); 
	    model.addAttribute("pagination", pagination);
		
		return "admin/notice";
	}
	//-------------------------------------------------- 공지사항 디테일
	@GetMapping("/noticedetail.hta")
	@ResponseBody
	public Notice noticedetail(@RequestParam("noticeNo") int noticeNo) throws Exception {
		 Notice noticeDetail = noticeService.getNoticeByNo(noticeNo);
	      
		 return noticeDetail;
	}
	//-------------------------------------------------- 공지사항 글작성 폼으로
	@GetMapping("/noticeform.hta")
	public String noticeform() throws Exception {
		return "admin/noticeform";
	}
	//-------------------------------------------------- 공지사항 글 작성하기
	@PostMapping("/noticewrite.hta")
	public String noticewrite(NoticeAddForm form, HttpSession session) throws Exception {
		Notice notice = new Notice();
		User user = (User)session.getAttribute("LU");
		notice.setUserNo(user.getNo());
		
		BeanUtils.copyProperties(form, notice);
		
		MultipartFile uploadFile = form.getFileName();
		if (!uploadFile.isEmpty()) {
			String filename = uploadFile.getOriginalFilename();
			notice.setFileName(filename);
			
			FileCopyUtils.copy(uploadFile.getBytes(), new File(sourceDirectory, filename));
		}
		
		noticeService.insertNotice(notice);
		
		return "redirect:/admin/notice.hta";
	}
	
	// 공지사항 삭제하기
   @GetMapping("/deletenotice.hta")
   public String deleteNotice(@RequestParam("noticeNo") int noticeNo) {
      noticeService.deleteNotice(noticeNo);
      
      return "redirect:/admin/notice.hta";
   }
   
   	// 공지사항 수정하기 
   	@RequestMapping("/noticeupdatedetail.hta")
   	public String noticeUpdateDetail(@RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
   		Notice notice =  noticeService.getNoticeByNo(noticeNo);
   		model.addAttribute("notice", notice);
	   
   		return "admin/noticeupdateform";
   	}
   // 공지사항 수정하기 2
   	@PostMapping("/noticeupdate.hta")
   	public String noticeupdate(NoticeUpdateForm form, HttpSession session) throws Exception {
   		Notice notice = new Notice();
   		User user = (User)session.getAttribute("LU");
   		notice.setUserNo(user.getNo());
   		
   		BeanUtils.copyProperties(form, notice);
   		
   		MultipartFile uploadFile = form.getFileName();
   		if (!uploadFile.isEmpty()) {
   			String filename = uploadFile.getOriginalFilename();
   			notice.setFileName(filename);
   			
   			FileCopyUtils.copy(uploadFile.getBytes(), new File(sourceDirectory, filename));
   		}
   		
   		noticeService.updateNotice(notice);
   		
   		return "redirect:/admin/notice.hta";
   	}
   // 공지사항 첨부파일 받기
   	@GetMapping("/download.hta")
   	public String downloadFile(@RequestParam("noticeNo") int noticeNo, Model model) throws Exception {
   		Notice notice =  noticeService.getNoticeByNo(noticeNo);
   		String sourceFilename = notice.getFileName();
	
   		model.addAttribute("directory", sourceDirectory);
   		model.addAttribute("filename", sourceFilename);
	
   		return "fileDownloadView";
	}
   	
  
   
   
}