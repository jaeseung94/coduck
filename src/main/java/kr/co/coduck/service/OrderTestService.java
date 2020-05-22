package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.OrderTestDetailListDto;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.OrdTestInfo;

public interface OrderTestService {

	void insertOrderTestInfo(OrdTestInfo ordTestInfo);
	List<OrderTestDetailListDto> getOrderTestInfoByOrderNo(int userNo);
	OrdTest getOrdTestByTestNoNUserNo(Map<String, Integer> map);
	void insertOrderTest(int userNo, List<Integer> testNos, int point);
	int getOrderNo();
}
