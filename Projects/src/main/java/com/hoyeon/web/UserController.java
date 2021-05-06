package com.hoyeon.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hoyeon.dto.UserDTO;
import com.hoyeon.service.UserService;




@Controller
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping(value = "/")
	public String index() {
		return "index";
		//메인
	}
	@GetMapping(value = "/login")// 로그인 화면 , 데이터베이스 연결안되서 안나오는건지
	public String login() {
		return "login";
	}
	
	@GetMapping(value = "/join")
	public String join() {
		return "join";
	}
	@GetMapping(value = "/join3")
	public String join3() {
		return "join3";
	}
	
	@PostMapping(value = "/join")
	public ModelAndView join(UserDTO dto) {
		ModelAndView mv = new ModelAndView("redirect:/join3");
		userService.join(dto);
		
		return mv;	
	}
	
	
	  @RequestMapping(value="/idcheck", produces="text/plain;charset=utf-8")
	  public @ResponseBody String idcheck(HttpServletRequest request){ 
		  int count = 1; 
		  System.out.println(request.getParameter("id")); 
		  count = userService.idcheck(request.getParameter("id"));
	  
	 System.out.println(count); 
	 return count+"";
	 }
	 
	  @GetMapping(value = "/main")
		public String main() {
			return "main";
		}
		
		@GetMapping(value = "/loginError")
		public String loginError() {
			return "loginError";
		}
		 
		@PostMapping(value = "/login")
		public ModelAndView login(HttpServletRequest request) {
			
			ModelAndView mv = new ModelAndView("redirect:/loginError");
			
			if (request.getParameter("id") != "" 
					&& request.getParameter("pw") != "") {
				//System.out.println("id"+request.getParameter("id"));
				//System.out.println("pw"+request.getParameter("pw"));
				UserDTO dto = new UserDTO();
				
				dto.setMember_id(request.getParameter("id"));
				dto.setMember_pw(request.getParameter("pw"));		

				UserDTO dto2 = userService.login(dto);
				if(dto2 != null) {
					
					HttpSession session = request.getSession();
					session.setAttribute("name", dto2.getMember_name());
					session.setAttribute("no", dto2.getMember_no());
					
					mv.setViewName("redirect:/myRecipe");
					
				}
			}	
			return mv;
		}
		
		@PostMapping(value = "/loginError")
		public ModelAndView loginError(HttpServletRequest request) {
			
			ModelAndView mv = new ModelAndView("loginError");
			
			return mv;
		}
		
		@GetMapping(value = "/logout")
		public String logout(HttpServletRequest request) {
			
			HttpSession session = request.getSession();
			
			if (session.getAttribute("name") != null) {
				session.removeAttribute("name");
			}
			
			if (session.getAttribute("no") != null) {
				session.removeAttribute("no");
			}	
			return "redirect:/myRecipe";
		}
	

	
	
	
}