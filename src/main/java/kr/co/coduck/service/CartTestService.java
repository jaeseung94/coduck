package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import kr.co.coduck.dto.CartChoiceTestListDto;
import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.vo.TestCart;

@Transactional
public interface CartTestService {

	List<CartTestDto> getCartTestListUserByNo(int userNo);
	int getTestCartCntByUserNo(int userNo);
	CartChoiceTestListDto getCartChoiceTestListByCartChoiceTestNo(Map<String, Object> criteria);
	void deleteCartTest(int testNo);
	Map<String, Object> insertCartTest(List<Integer> testNos, int userNo);
	void insertOneCartTest(TestCart testCart);
	TestCart getCartTestByTestNoNUserNo(Map<String, Integer> map);
}
