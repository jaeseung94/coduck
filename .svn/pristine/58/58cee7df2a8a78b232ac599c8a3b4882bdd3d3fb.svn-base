package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.CartChoiceLectListDto;
import kr.co.coduck.dto.CartLectDto;
import kr.co.coduck.vo.LectCart;

public interface CartLectService {

	List<CartLectDto> getCartLectListByUserNo(int userNo);
	CartChoiceLectListDto getCartChoiceLecttByCartChoiceLectNo(Map<String, Object> criteria);
	void deleteCartLect(int lectNo);
	void insertLectCart(LectCart lectCart);
}
