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
import com.hoyeon.service.CartService;

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
   public ModelAndView getCartList(HttpServletRequest request) {
      
	   ModelAndView mv = new ModelAndView("cart"); // controller에서 연결할 jsp 이름 결정
      
      HttpSession session = request.getSession();
	  int userNo = 0;
	  if(session.getAttribute("no") != null && session.getAttribute("no") != "") userNo = Integer.parseInt(session.getAttribute("no").toString());
	  else {
		  System.out.println("userNo is empty at /cart");
		  return new ModelAndView("login");
	  }
      ArrayList<HashMap<String, Object>> cartList = cartService.getCartMap(userNo);
      // DTO형식으로 가져오려고했는데
      // DTO가 계속 type error 나와서 Map으로 받아버렸습니다
      // HashMap<키,값>
      // ex. HashMap<product_name, 간장> / HashMap<product_price, 10000>
      // ex. HashMap<cart_total, 146>
      // 이런 형태로 상품 한 줄을 가져오는데
      // 이것들을 ArrayList를 통해 하나씩 저장함
      // ex. ArrayList<0, HashMap1>, ArrayList<0, HashMap1>, ArrayList<0, HashMap2>
      
      //System.out.println("### cartList -> " + cartList.toString());
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
      
	  HttpSession session = request.getSession();
	  String userNo = "";
	  if(session.getAttribute("no") != null && session.getAttribute("no") != "") userNo = session.getAttribute("no").toString();
	  else {
		  System.out.println("userNo is empty at /addCart");
		  return "redirect:login";
	  }
	   
      // product_no, 상품 번호
      // member_no, 사용자 식별값
      // increase_total, 추가(생성)할 상품 개수      
      int product_no = Integer.parseInt(map.get("product_no"));
      int member_no = Integer.parseInt(userNo);
      int amount = Integer.parseInt(map.get("amount"));
      
      map.put("member_no", userNo);
      
      // DB 조회 결과 null일 경우 0으로, 기존 값이 있을 경우 반환
      int exitTotal = 0;
      exitTotal = cartService.getCartProductTotal(map);

      if(exitTotal > 0) {
         // 이미 등록된 상품일 경우
         int cart_total = exitTotal + amount; // 기존값과 증가 요청 값 합산
         map.put("amount", Integer.toString(cart_total));
         cartService.postCart(map);
      }else {
         // 등록되지 않은 상품의 경우
         int cart_total = amount; // 증가 요청 값 그대로 전달
         
         ProductDTO pd = productService.p_detail(product_no);
         CartDTO cartDTO = new CartDTO(cart_total, product_no, member_no, pd.getProduct_name(), pd.getProduct_price(), pd.getProduct_imgName());
         cartService.postCart(cartDTO);
      }
      
      return "redirect:cart";
   }
   @ResponseBody
   @RequestMapping(value="/deleteSelectedCart", method=RequestMethod.POST)
   public void deleteSelectedItem(HttpServletRequest request, @RequestParam(value="array[]") List<String> array) {

	  HttpSession session = request.getSession();
	  String member_no="";
	  if (session.getAttribute("no") != null && session.getAttribute("no") != ""){
		  member_no = session.getAttribute("no").toString();         
	  }else return;
	  
      if(array != null) {
         int arrayLength = array.size();
         for(int i=0; i<arrayLength; i++) {
            String arrayItem = array.get(i);
            HashMap<String, String> productNoAndMemberNo = new HashMap<String, String>();
            productNoAndMemberNo.put("product_no", arrayItem);
            productNoAndMemberNo.put("member_no", member_no);
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
      else return;
      if(session.getAttribute("no") != null && session.getAttribute("no") != "") userNo = session.getAttribute("no").toString();
      else return;
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("product_no", productNo);
      map.put("member_no", userNo);
      int exitTotal = cartService.getCartProductTotal(map);
      map.put("amount", Integer.toString(++exitTotal));
      cartService.postCart(map);
   }
   
   @RequestMapping(value="/decreaseTotal", method=RequestMethod.POST)
   public void decreaseSelectedItemsTotal(HttpServletRequest request, @RequestParam(value="productNo") String productNo) {
      HttpSession session = request.getSession();
      String userName = "";
      String userNo = "";
      if(session.getAttribute("name") != null && session.getAttribute("name") != "") userName = (String) session.getAttribute("name");
      else return;
      if(session.getAttribute("no") != null && session.getAttribute("no") != "") userNo = session.getAttribute("no").toString();
      else return;
      
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("product_no", productNo);
      map.put("member_no", userNo);
      int exitTotal = cartService.getCartProductTotal(map);
      map.put("amount", Integer.toString(--exitTotal));
      cartService.postCart(map);
   }
   
   @RequestMapping(value="/modifyTotal", method=RequestMethod.POST)
   public void modifySelectedItemsTotal(HttpServletRequest request, @RequestParam(value="productNo") String productNo, @RequestParam(value="amount") String amount) {
	  HttpSession session = request.getSession();
	  String userName = "";
	  String userNo = "";
	  if(session.getAttribute("name") != null && session.getAttribute("name") != "") userName = (String) session.getAttribute("name");
	  else return;
	  if(session.getAttribute("no") != null && session.getAttribute("no") != "") userNo = session.getAttribute("no").toString();
	  else return;
      
      System.out.println("### productNo : " + productNo);
      System.out.println("### amount : " + amount);
      
      HashMap<String, String> map = new HashMap<String, String>();
      map.put("product_no", productNo);
      map.put("member_no", userNo);
      map.put("amount", amount);
      cartService.postCart(map);
   }
   
   @GetMapping(value = "/deleteAll")
   public String delete(HttpServletRequest request) {
      
      HttpSession session = request.getSession();
      String member_no="";
      if (session.getAttribute("no") != null && session.getAttribute("no") != ""){
    	  // no가 null이어선 안됨 + no가 "" 빈 값이어도 안됨. 
    	  // 빈값 체크를 안하면 빈값이 xml parameter로 넘어갈 수 있음
    	  member_no = session.getAttribute("no").toString();         
      }else return "redirect:cart";
      
      cartService.deleteAllItems(member_no);
      return "redirect:cart";
   }
   //이렇게 해서 service랑 mapper랑 xml이랑 parameter String 형태로 다시 짜보라고 하세요
   
}