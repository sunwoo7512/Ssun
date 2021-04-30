package com.hoyeon.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hoyeon.dto.CartDTO;
import com.hoyeon.service.CartService;

@Controller
public class CartController {

	CartService cartService;
	
	@Autowired
	public CartController(CartService cartService) {
		this.cartService = cartService;
	}
	
	@RequestMapping(value="cart", method=RequestMethod.GET)
	public ModelAndView getCartList(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView("cart");
		
		List<CartDTO> cartList = cartService.getCartList(id);
		mv.addObject("cartList", cartList);
		
		return mv;
	}
}
