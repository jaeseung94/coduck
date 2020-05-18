package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.ReviewDao;
import kr.co.coduck.dto.ReviewStarDto;
import kr.co.coduck.vo.Review;

@Service
public class ReviewServiceImpl implements ReviewService {

	@Autowired
	private ReviewDao reviewDao;
	
	@Override
	public List<ReviewStarDto> getAllReivewStarAvg(int lectureNo) {

		return reviewDao.getAllReivewStarAvg(lectureNo);
	}
	
	@Override
	public List<Review> getReviewByLectureNo(int lectureNo) {
		
		return reviewDao.getReviewByLectureNo(lectureNo);
	}
}
