package kr.co.coduck.dao;

import java.util.List;

import kr.co.coduck.dto.LikeLectListDto;
import kr.co.coduck.vo.Likelect;

public interface LikeLectDao {

	void insertLikeLect(Likelect likelect);
	List<LikeLectListDto> getLikeLectsByUserNo(int userNo);
}
