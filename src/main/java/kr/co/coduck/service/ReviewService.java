package kr.co.coduck.service;

import java.util.List;

import kr.co.coduck.dto.ReviewStarDto;
import kr.co.coduck.vo.Review;

public interface ReviewService {

	List<ReviewStarDto> getAllReivewStarAvg(int lectureNo);
	
	List<Review> getReviewByLectureNo(int lectureNo);
}
