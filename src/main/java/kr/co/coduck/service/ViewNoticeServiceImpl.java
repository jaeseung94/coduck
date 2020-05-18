package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.ViewNoticeDao;
import kr.co.coduck.dto.ViewNoticeDto;

@Service
public class ViewNoticeServiceImpl implements ViewNoticeService{

	@Autowired
	private ViewNoticeDao viewNoticeDao;
	
	@Override
	public void updateHitCnt(int noticeNo) {
		viewNoticeDao.updateHitCnt(noticeNo);
		
	}

	@Override
	public List<ViewNoticeDto> getNoticesList() {
		return viewNoticeDao.getNoticesList();
	}

	@Override
	public ViewNoticeDto getNoticesListByNoticeNo(int noticeNo) {
		return viewNoticeDao.getNoticesListByNoticeNo(noticeNo);
	}

}
