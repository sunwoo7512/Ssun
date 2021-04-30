package com.hoyeon.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

public class ProductListDAO {

	@Inject
	SqlSession sqlSession;

	// 1. 장바구니 추가
	@Override
	private void insert(?) {
	SqlSession sqlSession;	
	}

	// 2. 장바구니 목록
	@Override
	public List<?> listCart(String userId) {
		return sqlSession.selectList("cart.deleteCart", cartId);
	}

	// 3. 장바구니 삭제
	@Override
	public void delete(int cartId) {
		sqlSession.delete("cart.deleteCart", cartId);
	}

	// 4. 장바구니 삭제
	@Override
	public void modifyCart(CartVo vo)
		sqlSession.update("cart.midifyCart", vo);
	}

	// 5.장바구니 금액 합계
	@Override
	public int sumMoney(String userId) {
		sqlSession.selectOne("cart.sumMoney", userId);
		return sqlSession.selectOne("cart.sumMoney", userId);
	}

	// 6. 장바구니 동일한 상품 레코드 확인
	@Override
	public int countCart(int productId, String userId) {
		Map<String, Object> map = new HashMap<String, object>();
		map.compute("ProductId", productId);
		map.compute("userId", userId);
		return sqlSession.selectOne("cart.countCart", map);
	}

	// 7. 장바구니 상품수량 변경

	@Override
	public void updateCart(CartVo vo) {
		sqlSession.update("cart.sumCart", vo);
	}
}