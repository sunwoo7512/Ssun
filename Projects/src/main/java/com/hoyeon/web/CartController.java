package com.hoyeon.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.hoyeon.dto.CartDTO;
import com.hoyeon.dto.ProductDTO;
import com.hoyeon.service.CartService;
import com.hoyeon.service.ProductService;

@Controller
public class CartController {

	CartService cartService;
	ProductService productService;
	
	@Autowired
	public CartController(CartService cartService, ProductService productService) {
		this.cartService = cartService;
		this.productService = productService;
	}
	
	@GetMapping(value="cart")
	public ModelAndView getCartList(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView("cart");
		System.out.println("### id => "+id);
//		List<CartDTO> cartList = cartService.getCartList(id);
//		System.out.println("### cartList -> " + cartList.toString());
//		mv.addObject("cartList", cartList);
		
		Map<String, Object> cartMap = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> cartList = cartService.getCartMap(id);
		//cartMap = cartService.getCartMap(id);
		System.out.println("### cartList -> " + cartList.toString());
		mv.addObject("cartList", cartList);
		
		return mv;
	}
	
	@RequestMapping(value="/addCart", method=RequestMethod.GET)
	public String getCart(@RequestParam HashMap<String, String> map) {
		
		// product_no, 상품 번호
		// member_no, 사용자 식별값
		// increase_total, 추가(생성)할 상품 개수		
		int product_no = Integer.parseInt(map.get("product_no"));
		int member_no = Integer.parseInt(map.get("member_no"));
		int increase_total = Integer.parseInt(map.get("increase_total"));
		
		// DB 조회 결과 null일 경우 0으로, 기존 값이 있을 경우 반환
		int exitTotal = cartService.getCartProductTotal(map);

		if(exitTotal != 0) {
			// 이미 등록된 상품일 경우
			int cart_total = exitTotal + increase_total; // 기존값과 증가 요청 값 합산

			map.put("increase_total", Integer.toString(cart_total));
			cartService.postCart(map);
		}else {
			// 등록되지 않은 상품의 경우
			int cart_total = increase_total; // 증가 요청 값 그대로 전달
			
			ProductDTO pd = productService.detail(product_no);
			CartDTO cartDTO = new CartDTO(cart_total, product_no, member_no, pd.getProduct_name(), pd.getProduct_price(), pd.getProduct_imgName());
			cartService.postCart(cartDTO);
		}
		return "redirect:NewFile?no="+product_no;
	}
}
