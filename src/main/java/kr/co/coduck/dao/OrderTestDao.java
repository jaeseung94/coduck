package kr.co.coduck.dao;

import java.util.List;
import java.util.Map;

import kr.co.coduck.dto.OrderTestDetailDto;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.OrdTestInfo;
import kr.co.coduck.vo.PointHistory;

public interface OrderTestDao {
	
	//시험이든 강의든 주문번호로 조회하기
	PointHistory getPointHistoryByOrdNo(PointHistory history);
	void insertPointHistory(PointHistory pointHistory);
	void deleteOrdTest(int orderNo);
	int getOrderNo();
	void insertOrderTest(OrdTest ordTest);
	void insertOrderTestInfo(OrdTestInfo ordTestInfo);
	List<OrderTestDetailDto> getOrderTestInfoByOrderNo(int orderNo);
	List<OrderTestDetailDto> getOrderTestByUserNo(Map<String, Object> map);
	OrdTest getOrderTestByOrderNo(int orderNo);
	
}
