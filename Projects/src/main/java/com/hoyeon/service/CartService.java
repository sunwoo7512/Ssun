package com.hoyeon.service;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoyeon.dao.CartDAO;
import com.hoyeon.dto.CartDTO;

@Service
public class CartService {
	
	CartDAO cartDAO;

	@Autowired
	public CartService(CartDAO cartDAO) {
		this.cartDAO = cartDAO; 
	}
	
	public List<CartDTO> getCartList(int member_no) {
		List<CartDTO> cartList = cartDAO.getCartList(member_no);
		return cartList; 
	}
	
	public ArrayList<HashMap<String, Object>> getCartMap(int member_no){
		// boardService.list 참고했습니다
		return (ArrayList<HashMap<String, Object>>) cartDAO.getCartMap(member_no);
		
	}
	
	public void postCart(CartDTO cartDTO) {
		cartDAO.postCart(cartDTO);
	}
	
//	public void postCart(Map<String, Integer> updateMap) {
//		cartDAO.postCart(updateMap);
//	}
	
	public void postCart(Map<String, String> updateMap) {
		cartDAO.postCart(updateMap);
	}
	
//	public int getCartProductTotal(Map<String, Integer> cartMap) {
//		Integer cart_total = cartDAO.getCartProductTotal(cartMap);
//		int returnValue = (cart_total==null) ? 0: cart_total.intValue();
//		return returnValue;
//	}
	
	public int getCartProductTotal(Map<String, String> cartMap) {
		Integer cart_total = cartDAO.getCartProductTotal(cartMap);
		int returnValue = (cart_total==null) ? 0: cart_total.intValue();
		return returnValue;
	}
}
