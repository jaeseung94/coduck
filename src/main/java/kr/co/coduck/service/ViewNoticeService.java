package kr.co.coduck.service;

import java.util.List;

import kr.co.coduck.dto.ViewNoticeDto;

public interface ViewNoticeService {

	void updateHitCnt(int noticeNo);
	List<ViewNoticeDto> getNoticesList();
	ViewNoticeDto getNoticesListByNoticeNo(int noticeNo);
}
