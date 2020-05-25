package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.OrderTestDetailDto;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.OrdTestInfo;
import kr.co.coduck.vo.PointHistory;

public interface OrderTestService {
	PointHistory getPointHistoryByOrdNo(int no);
	void insertPointHistory(PointHistory pointHistory);
	public void cancelIamportPayment(String orderNo) throws Exception;
	void deleteOrdTest(int orderNo);
	int insertOrderTestInfo(List<Integer> testNos, int userNo, int orderNo);
	List<OrderTestDetailDto> getOrderTestInfoByOrderNo(int orderNo);
	OrdTest getOrdTestByTestNoNUserNo(Map<String, Integer> map);
	int insertOrderTest(int userNo, List<Integer> testNos, int point, int orderNo) throws Exception;
	int getOrderNo();
}
