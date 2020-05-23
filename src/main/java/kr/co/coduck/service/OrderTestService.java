package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.OrderTestDetailListDto;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.OrdTestInfo;

public interface OrderTestService {
	
	void deleteOrdTest(int orderNo);
	int insertOrderTestInfo(List<Integer> testNos, int userNo, int orderNo);
	List<OrderTestDetailListDto> getOrderTestInfoByOrderNo(int userNo);
	OrdTest getOrdTestByTestNoNUserNo(Map<String, Integer> map);
	int insertOrderTest(int userNo, List<Integer> testNos, int point, int orderNo);
	int getOrderNo();
}
