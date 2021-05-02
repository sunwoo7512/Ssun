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
		ModelAndView mv = new ModelAndView("cart"); // controller에서 연결할 jsp 이름 결정
		System.out.println("### id => "+id); 
		// url로 입력된 query string 값 확인 
		// localhost/cart?id=임의값
		// 위 형식으로 url에 입력됬을 때 임의값을 sts console창에 출력해줌

		ArrayList<HashMap<String, Object>> cartList = cartService.getCartMap(id);
		// DTO형식으로 가져오려고했는데
		// DTO가 계속 type error 나와서 Map으로 받아버렸습니다
		// HashMap<키,값>
		// ex. HashMap<product_name, 간장> / HashMap<product_price, 10000>
		// ex. HashMap<cart_total, 146>
		// 이런 형태로 상품 한 줄을 가져오는데
		// 이것들을 ArrayList를 통해 하나씩 저장함
		// ex. ArrayList<0, HashMap1>, ArrayList<0, HashMap1>, ArrayList<0, HashMap2>
		
		System.out.println("### cartList -> " + cartList.toString());
		// cartList에 담긴 것들을 확인함
		// cartList -> [{}, {}, {}] 형태로 반환되는걸 확인 가능
		// {} 하나가 HashMap 하나임
		// ex. [{cart_total=146, member_no=123, product_imgName=gjgj.jpg, cart_no=4, product_price=10000, product_no=1, product_name=간장}, {cart_total=2010, member_no=123, product_imgName=gjgj.jpg, cart_no=5, product_price=10000, product_no=3, product_name=간장}, {cart_total=3, member_no=123, product_imgName=gjgj.jpg, cart_no=6, product_price=10000, product_no=2, product_name=간장}]
		
		mv.addObject("cartList", cartList);
		// modelView에 cartList를 사용하겠다 라고 넘겨줌, 이 때 이름은 "cartList"로 사용하겠다라고 명시
		
		
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
//		return "redirect:NewFile?no="+product_no;
		return "redirect:cart?id=123";
	}
}
