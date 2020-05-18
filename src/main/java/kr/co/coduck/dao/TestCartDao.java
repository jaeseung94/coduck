package kr.co.coduck.dao;

import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.CartChoiceTestListDto;
import kr.co.coduck.dto.CartTestDto;
import kr.co.coduck.vo.TestCart;

public interface TestCartDao {

	List<CartTestDto> getCartTestListUserByNo(int userNo);
	int getTestCartCntByUserNo(int userNo);
	CartChoiceTestListDto getCartChoiceTestListByCartChoiceTestNo(Map<String, Object> criteria);
	void deleteCartTest(int testNo);
	void insertCartTest(TestCart testCart);
	TestCart getCartTestByTestNoNUserNo(Map<String, Integer> map);
	
}
