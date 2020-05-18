package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.NoticeDao;
import kr.co.coduck.dto.NoticeCriteria;
import kr.co.coduck.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public void insertNotice(Notice notice) {
		noticeDao.insertNotice(notice);
	}

	@Override
	public List<Notice> getNoticeByCriteria(NoticeCriteria noticeCriteria) {
		return noticeDao.getNoticeByCriteria(noticeCriteria);
	}

	@Override
	public int getNoticeCntByCriteria(NoticeCriteria noticeCriteria) {
		return noticeDao.getNoticeCntByCriteria(noticeCriteria);
	}

	@Override
	public Notice getNoticeByNo(int noticeNo) {
		return noticeDao.getNoticeByNo(noticeNo);
	}

	@Override
	public void updateNotice(Notice notice) {
		noticeDao.updateNotice(notice);
	}

	@Override
	public void deleteNotice(int noticeNo) {
		noticeDao.deleteNotice(noticeNo);
	}
	
}
