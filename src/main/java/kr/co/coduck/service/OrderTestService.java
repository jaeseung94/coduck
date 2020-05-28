package kr.co.coduck.service;

import java.util.List;
import java.util.Map;

import com.siot.IamportRestHttpClientJava.response.IamportResponse;
import com.siot.IamportRestHttpClientJava.response.Payment;

import kr.co.coduck.dto.OrderTestDetailDto;
import kr.co.coduck.vo.OrdTest;
import kr.co.coduck.vo.OrdTestInfo;
import kr.co.coduck.vo.PointHistory;

public interface OrderTestService {
	PointHistory getPointHistoryByOrdNo(PointHistory history);
	void insertPointHistory(PointHistory pointHistory);
	public void cancelIamportPayment(String orderNo) throws Exception;
	void deleteOrdTest(int orderNo);
	int insertOrderTestInfo(List<Integer> testNos, int userNo, int orderNo);
	List<OrderTestDetailDto> getOrderTestInfoByOrderNo(int orderNo);
	int insertOrderTest(int userNo, List<Integer> testNos, int point, int orderNo) throws Exception;
	List<OrderTestDetailDto> getOrderTestByUserNo(Map<String, Object> map);
	OrdTest getOrderTestByOrderNo(int orderNo);
	int getOrderNo();
	public IamportResponse<Payment> getIamportPayment(int orderNo) throws Exception;
}
