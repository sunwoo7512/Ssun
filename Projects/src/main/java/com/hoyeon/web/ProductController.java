package com.hoyeon.web;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hoyeon.dto.BoardDTO;
import com.hoyeon.dto.ProductDTO;
import com.hoyeon.service.ProductService;
import com.hoyeon.service.boardService;
import com.hoyeon.util.CommandMap;
import com.hoyeon.util.FileSave;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;

	
	
	   @GetMapping(value = "/product")
	   public ModelAndView list(CommandMap map, HttpServletRequest request) {
	      // search이 들어온다면
	      // if(map.containsKey("search")) {
	      System.out.println("검색 들어옴 " + map.get("search"));
	      System.out.println(map.getMap());
	     
	      // map에 담아서 뒤로 보내기
	      // map.put("search", request.getParameter("search"));
	      // map.put("key", request.getParameter("key"));
	      // }
	      int page = 1;
	      if (map.containsKey("page")) {
	    	  
	         page = Integer.parseInt((String) map.get("page"));
	      }
	      map.put("page", (page - 1) * 15);
	      
	      ModelAndView mv = new ModelAndView("product");
	      ArrayList<HashMap<String, Object>> list = productService.list(map.getMap());;
	    
		
	      if (list.size() > 0) {
	         mv.addObject("list", list);
	         mv.addObject("totalCount", list.get(0).get("count"));

	      }
	      mv.addObject("page", page);
	      System.out.println(map.getMap());
	      return mv;
	   }

	 //디테일
		@GetMapping(value = "p_detail")
		public ModelAndView p_detail(HttpServletRequest request) {
			
			ModelAndView mv = new ModelAndView("p_detail");
			
			int pno = Integer.parseInt(request.getParameter("pno"));
			
			ProductDTO dto = productService.p_detail(pno); // DB에서 product DB에서 모든 값을 조회한 다음 ProductDTO 형태로 저장
			mv.addObject("pd", dto); //p_detail.jsp로 dto를 전송, 이 때 이름을 dto로 지정
			// 그러나 오류가 발생하는 이유
			// p_detail에서는 기존에 pd.product_name 등 전송받은 객체 이름을 pd라고 사용했음
			// 따라서 아무런 값도 전달되지 않음
			// 오류를 고치는 방법
			// 1. controller에서 전달하는 객체 이름을 pd로 지정 (기존에 pd로 사용했으니 이게 간단)
			// 2. jsp에서 전달받은 객체 이름을 dto로 변경 (jsp에 있는 pd.product_name 같은 아이들을 모두 dto.product_name으로 수정)
			return mv;
		}
	
}