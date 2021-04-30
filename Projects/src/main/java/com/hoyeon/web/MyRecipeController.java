package com.hoyeon.web;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hoyeon.dto.BoardDTO;
import com.hoyeon.service.ProductService;
import com.hoyeon.service.boardService;
import com.hoyeon.util.CommandMap;
import com.hoyeon.util.FileSave;

@Controller
public class MyRecipeController {
	@Autowired
	private boardService boardService;
	@Autowired
	private ProductService productService;
	@Autowired
	private FileSave fileSave;
	@Autowired
	private ServletContext servletContext;
	
	
	@GetMapping(value = "myRecipe")
	   public ModelAndView list(CommandMap map, HttpServletRequest request) {
	     
	      int page = 1;
			if (map.containsKey("page")) {
				page = Integer.parseInt((String) map.get("page"));
			}
			map.put("page", (page - 1) * 10);

			ModelAndView mv = new ModelAndView("myRecipe");
			ArrayList<HashMap<String, Object>> list = productService.list(map.getMap());
			mv.addObject("list", list);
			mv.addObject("totalCount", list.get(0).get("count"));
			mv.addObject("page", page);

	      return mv;
	   }
   
	@RequestMapping(value = "write", method = { RequestMethod.GET, RequestMethod.POST })
	public String write(CommandMap map, HttpServletRequest request, MultipartFile file) {
			HttpSession session = request.getSession();
			
				if(map.containsKey("title") && map.containsKey("content")) {
				map.put("no", session.getAttribute("no"));//추가한거
				boardService.write(map.getMap());
				
				System.out.println();
				String realPath = servletContext.getRealPath("resources/");
				System.out.println(realPath); 
				map.put("realPath", realPath);
				
				if (file.getOriginalFilename() != null
						&& file.getSize() > 0) {
					// 파일 업로드
					fileSave.save(realPath + "upload", file);
				}
				
				return "redirect:/myRecipe";
				}else {
					return "write";
				}

	}
	@GetMapping(value = "detail")
	public ModelAndView detail(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("detail");
		//이건 보드넘버여
		int no = Integer.parseInt(request.getParameter("no"));
		
		BoardDTO dto = boardService.detail(no);
		System.out.println(dto.getBoard_title());
		mv.addObject("dto", dto);
		return mv;
	}
	

	

}