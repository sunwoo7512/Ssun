package com.hoyeon.web;


import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hoyeon.dto.ProductDTO;
import com.hoyeon.dto.UserDTO;
import com.hoyeon.service.ProductService;
import com.hoyeon.service.UserService;




@Controller
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	
	@GetMapping(value = "/")
	public String index() {
		// localhost/value가 입력됬을 때 이 함수가 실행되게함
		// 이 때 value값이 없으므로 이 함수가 실행되는 url은
		// localhost/임
		
		
		return "redirect:product";
		// 이 때 return-> 결과로 무엇을 주겠다 라는 곳에서
		// redirect:product 라고 작성하셨음
		// 기존엔 redirect:myRecipe였음
		// redirect 뜻 -> 다른 페이지로 연결함
		// 결국 localhost 만입력해도 localhost/product로 강제 이동하게하는 함수를 완성함
	}
	@GetMapping(value = "/login")// 로그인 화면 , 데이터베이스 연결안되서 안나오는건지
	public String login() {
		return "login";
	}
	
	@GetMapping(value = "/join")
	public String join() {
		return "join";
	}
	
	@PostMapping(value = "/join")
	public ModelAndView join(UserDTO dto) {
		ModelAndView mv = new ModelAndView("join");
		userService.join(dto);
		
		return mv;
	
	}
	@GetMapping("/NewFile")
	public ModelAndView newFile(int no) {
		ProductDTO pd = productService.detail(no);
		System.out.println(pd.getProduct_price());
		System.out.println(pd.getProduct_imgName());
//		Vector<ProductDTO> product = new Vector<ProductDTO>();
//		product.add(pd);
		
//		return new ModelAndView("NewFile", "product", product);
		return new ModelAndView("NewFile", "pd", pd);
	}
	
	  @RequestMapping(value="/idcheck", produces="text/plain;charset=utf-8")
	  public @ResponseBody String idcheck(HttpServletRequest request){ 
		  int count = 1; 
		  System.out.println(request.getParameter("id")); 
		  count = userService.idcheck(request.getParameter("id"));
	  
	 System.out.println(count); 
	 return count+"";
	 }
	 
	
	/*
	 * @RequestMapping(value="/idcheck") public @ResponseBody String idCheck(UserDTO
	 * dto) { System.out.println("Controller.idCheck() 호출");
	 * System.out.println(dto.getUser_id()); int result=1; result =
	 * userService.checkid(dto); System.out.println("result : " + result);
	 * 
	 * return String.valueOf(result);
	 * 
	 * }
	 */

	
	
	
}