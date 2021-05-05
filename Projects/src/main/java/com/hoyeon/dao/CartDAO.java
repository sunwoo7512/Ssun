package com.hoyeon.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoyeon.dto.CartDTO;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class CartDAO {

	private SqlSession sqlSession;
	
	@Autowired
	public CartDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public int getCartProduct(CartDTO CartDTO) {
		int exit_cart_no = 100;
		
		exit_cart_no = sqlSession.selectOne("cart.selectCartProductTotal", CartDTO);
		
		return exit_cart_no;
	}
	
	public List<CartDTO> getCartList(int member_no){
		
		return sqlSession.selectList("cart.selectCartList", member_no);
	}
		
	public List<HashMap<String, Object>> getCartMap(int member_no){
		
		return sqlSession.selectList("cart.selectCartMap", member_no);
	}
	
	// 신규 상품 장바구니에 등록
	public void postCart(CartDTO cartDTO) {
		sqlSession.insert("cart.insertCart", cartDTO);
	}
	
	// 기존 상품 개수 증가
//	public void postCart(Map<String, Integer> updateMap) {
//		sqlSession.update("cart.updateCartProductTotal", updateMap);
//	}
	
	public void postCart(Map<String, String> updateMap) {
		sqlSession.update("cart.updateCartProductTotal", updateMap);
	}
	
//	public Integer getCartProductTotal(Map<String, Integer> cartMap ) {
//		return sqlSession.selectOne("cart.selectCartProductTotal", cartMap);
//	}
	
	public Integer getCartProductTotal(Map<String, String> cartMap ) {
		return sqlSession.selectOne("cart.selectCartProductTotal", cartMap);
	}
	
	public void deleteSelectedItem(Map<String, String> selectedItems) {
		sqlSession.delete("cart.deleteSelectedItem", selectedItems);
	}
	
}
