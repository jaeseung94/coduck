package kr.co.coduck.dao;

import kr.co.coduck.vo.CartItem;

public interface CartDao {
	
	//장바구니에 넣기
	void insertCartItem(CartItem item);
}
