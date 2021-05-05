package com.hoyeon.web;

import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	public ModelAndView getCartList(@RequestParam("id") int id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("cart"); // controller에서 연결할 jsp 이름 결정
		
		// 세션, 쿠키 기능이 완성될 경우 사용할 방식	
		// 매개변수로 받는 RequestParam값 삭제해야함
//		String userName = "";
//		String userNo = "";
//		if(request.getSession().getAttribute("name") != null) {
//			// session에 저장된 name값이 있다면
//			// name 값을 변수에 저장
//			userName =(String) request.getSession().getAttribute("name");
//		}else return mv = new ModelAndView("myRecipe");
//		if(request.getSession().getAttribute("no") != null) {
//			// session에 저장된 no값이 있다면
//			// no 값을 변수에 저장
//			userNo =(String) request.getSession().getAttribute("no");
//		}else return mv = new ModelAndView("myRecipe");
//		ArrayList<HashMap<String, Object>> cartList = cartService.getCartMap(Integer.parseInt(userNo));
		
		
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
		System.out.println("!");
		// cartList에 담긴 것들을 확인함
		// cartList -> [{}, {}, {}] 형태로 반환되는걸 확인 가능
		// {} 하나가 HashMap 하나임
		// ex. [{cart_total=146, member_no=123, product_imgName=gjgj.jpg, cart_no=4, product_price=10000, product_no=1, product_name=간장}, {cart_total=2010, member_no=123, product_imgName=gjgj.jpg, cart_no=5, product_price=10000, product_no=3, product_name=간장}, {cart_total=3, member_no=123, product_imgName=gjgj.jpg, cart_no=6, product_price=10000, product_no=2, product_name=간장}]
		
		mv.addObject("cartList", cartList);
		// modelView에 cartList를 사용하겠다 라고 넘겨줌, 이 때 이름은 "cartList"로 사용하겠다라고 명시
		
		
		return mv;
	}
	
	@RequestMapping(value="/addCart", method=RequestMethod.GET)
	public String getCart(@RequestParam HashMap<String, String> map, HttpServletRequest request) {
		
		// 세션, 쿠키 기능이 완성될 경우 사용할 방식
		// NewFile에 있는
		// <input type="hidden" name="member_no" value="123">
		// 이 값을 MemberNo로 받고있었는데, 전면적으로 수정해야함
//		String userName = "";
//		String userNo = "";
//		if(request.getSession().getAttribute("name") != null) {
//			// session에 저장된 name값이 있다면
//			// name 값을 변수에 저장
//			userName =(String) request.getSession().getAttribute("name");
//		} else return "redirect:myRecipe";
//		if(request.getSession().getAttribute("no") != null) {
//			// session에 저장된 no값이 있다면
//			// no 값을 변수에 저장
//			userNo =(String) request.getSession().getAttribute("no");
//		} else return "redirect:myRecipe";
//		int product_no = Integer.parseInt(map.get("product_no"));
//		int member_no = Integer.parseInt(userNo);
//		int increase_total = Integer.parseInt(map.get("increase_total"));
		
		// product_no, 상품 번호
		// member_no, 사용자 식별값
		// increase_total, 추가(생성)할 상품 개수		
		int product_no = Integer.parseInt(map.get("product_no"));
		int member_no = Integer.parseInt(map.get("member_no"));
		int amount = Integer.parseInt(map.get("amount"));
		
		// DB 조회 결과 null일 경우 0으로, 기존 값이 있을 경우 반환
		int exitTotal = cartService.getCartProductTotal(map);

		if(exitTotal != 0) {
			// 이미 등록된 상품일 경우
			int cart_total = exitTotal + amount; // 기존값과 증가 요청 값 합산

			map.put("increase_total", Integer.toString(cart_total));
			cartService.postCart(map);
		}else {
			// 등록되지 않은 상품의 경우
			int cart_total = amount; // 증가 요청 값 그대로 전달
			
			ProductDTO pd = productService.detail(product_no);
			CartDTO cartDTO = new CartDTO(cart_total, product_no, member_no, pd.getProduct_name(), pd.getProduct_price(), pd.getProduct_imgName());
			cartService.postCart(cartDTO);
		}
		
		return "redirect:cart?id=123";

		// 세션, 쿠키 기능이 완성될 경우 사용할 방식	
		//return "redirect:cart";
	}
	@ResponseBody
	@RequestMapping(value="/deleteSelectedCart", method=RequestMethod.POST)
	public void deleteSelectedItem(HttpServletRequest request, @RequestParam(value="array[]") List<String> array) {
		if(array != null) {
			int arrayLength = array.size();
			for(int i=0; i<arrayLength; i++) {
				String arrayItem = array.get(i);
				HashMap<String, String> productNoAndMemberNo = new HashMap<String, String>();
				productNoAndMemberNo.put("product_no", arrayItem);
				productNoAndMemberNo.put("member_no", "123");
				cartService.deleteSelectedItem(productNoAndMemberNo) ;
			}
		}else System.out.println("array is empty");
		
	}
	
	@RequestMapping(value="/increaseTotal", method=RequestMethod.POST)
	public void increaseSelectedItemsTotal(HttpServletRequest request, @RequestParam(value="productNo") String productNo) {
		HttpSession session = request.getSession();
		String userName = "";
		String userNo = "";
		if(session.getAttribute("name") != null && session.getAttribute("name") != "") userName = (String) session.getAttribute("name");
		if(session.getAttribute("userNo") != null && session.getAttribute("userNo") != "") userNo = Integer.toString((Integer)session.getAttribute("no"));
		
		userNo = "123"; // 세션 생성되기 전까지 임시로 123으로 테스트 세션 만들어지면 이 행을 삭제한다.
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("product_no", productNo);
		map.put("member_no", userNo);
		int exitTotal = cartService.getCartProductTotal(map);
		map.put("amount", Integer.toString(++exitTotal));
		cartService.postCart(map);
		System.out.println("increaseTotal executed");
	}
	
	@RequestMapping(value="/decreaseTotal", method=RequestMethod.POST)
	public void decreaseSelectedItemsTotal(HttpServletRequest request, @RequestParam(value="productNo") String productNo) {
		HttpSession session = request.getSession();
		String userName = "";
		String userNo = "";
		if(session.getAttribute("name") != null && session.getAttribute("name") != "") userName = (String) session.getAttribute("name");
		if(session.getAttribute("userNo") != null && session.getAttribute("userNo") != "") userNo = Integer.toString((Integer)session.getAttribute("no"));
		
		userNo = "123"; // 세션 생성되기 전까지 임시로 123으로 테스트 세션 만들어지면 이 행을 삭제한다.
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("product_no", productNo);
		map.put("member_no", userNo);
		int exitTotal = cartService.getCartProductTotal(map);
		map.put("amount", Integer.toString(--exitTotal));
		cartService.postCart(map);
		System.out.println("decreaseTotal executed");
	}
	
	@RequestMapping(value="/modifyTotal", method=RequestMethod.POST)
	public void modifySelectedItemsTotal(HttpServletRequest request, @RequestParam(value="productNo") String productNo, @RequestParam(value="amount") String amount) {
		HttpSession session = request.getSession();
		String userName = "";
		String userNo = "";
		if(session.getAttribute("name") != null && session.getAttribute("name") != "") userName = (String) session.getAttribute("name");
		if(session.getAttribute("userNo") != null && session.getAttribute("userNo") != "") userNo = Integer.toString((Integer)session.getAttribute("no"));
		
		userNo = "123"; // 세션 생성되기 전까지 임시로 123으로 테스트 세션 만들어지면 이 행을 삭제한다.
		
		System.out.println("### productNo : " + productNo);
		System.out.println("### amount : " + amount);
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("product_no", productNo);
		map.put("member_no", userNo);
		map.put("amount", amount);
		cartService.postCart(map);
		System.out.println("modifyTotal executed");
	}
}
