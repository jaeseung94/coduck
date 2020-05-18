package kr.co.coduck.dao;

import java.util.List;

import kr.co.coduck.dto.NoticeCriteria;
import kr.co.coduck.vo.Notice;

public interface NoticeDao {

	void insertNotice(Notice notice);
	List<Notice> getNotices();
	Notice getNoticeByNo(int noticeNo);
	void updateNotice(Notice notice);
	void deleteNotice(int noticeNo);
	
	List<Notice> getNoticeByCriteria(NoticeCriteria noticeCriteria);
	int getNoticeCntByCriteria(NoticeCriteria noticeCriteria);
}
