package kr.co.coduck.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coduck.dto.ViewNoticeDto;
import kr.co.coduck.service.NoticeService;
import kr.co.coduck.service.ViewNoticeService;

@Controller
@RequestMapping("/view")
public class ViewNoticeController {

	@Autowired
	private ViewNoticeService viewNoticeService;
	@Autowired
	private NoticeService noticeService;
	
	@GetMapping("/viewnotice.hta")
	public String viewnotice(Model model) {
		List<ViewNoticeDto> viewnotice = viewNoticeService.getNoticesList();
		model.addAttribute("viewnotice", viewnotice);
		return "user/viewnotice";
	}
	
	@GetMapping("/noticedetail.hta")
	public String noticedetail(@RequestParam("noticeNo") int noticeNo, Model model){
		ViewNoticeDto noticedetail = viewNoticeService.getNoticesListByNoticeNo(noticeNo);
		viewNoticeService.updateHitCnt(noticeNo);
		model.addAttribute("noticedetail", noticedetail);
		return "user/viewnoticedetail";
	}
	
	
	
	
	
}
