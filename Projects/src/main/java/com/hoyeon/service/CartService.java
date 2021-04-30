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

	public CartService(CartDAO cartDAO) {
		this.cartDAO = cartDAO; 
	}
	
	public List<CartDTO> getCartList(int member_no) {
		List<CartDTO> cartList = cartDAO.getCartList(member_no);
		return cartList; 
	}
}
