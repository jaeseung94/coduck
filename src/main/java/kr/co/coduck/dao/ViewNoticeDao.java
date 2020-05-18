package kr.co.coduck.dao;

import java.util.List;

import kr.co.coduck.dto.ViewNoticeDto;

public interface ViewNoticeDao {

	void updateHitCnt(int noticeNo);
	List<ViewNoticeDto> getNoticesList();
	ViewNoticeDto getNoticesListByNoticeNo(int noticeNo);
}
