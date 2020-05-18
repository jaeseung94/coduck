package kr.co.coduck.dao;

import java.util.List;

import kr.co.coduck.dto.OrderLectDetailListDto;
import kr.co.coduck.dto.OrderLectListDto;
import kr.co.coduck.vo.OrdLect;
import kr.co.coduck.vo.OrderLectInfo;

public interface OrderLectDao {

	void insertOrderLect(OrdLect ordLect);
	void insertOrderLectInfo(OrderLectInfo orderLectInfo);
	List<OrderLectListDto> getOrderLectListByUserNo(int userNo);
	List<OrderLectDetailListDto> getOrderLectInfoByOrderNo(int orderNo);
}
