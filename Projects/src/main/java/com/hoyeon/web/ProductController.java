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
public class ProductController {
	@Autowired
	private boardService boardService;
	@Autowired
	private ProductService productService;
	@Autowired
	private FileSave fileSave;
	@Autowired
	private ServletContext servletContext;
	
	
	@GetMapping(value = "product") // url (웹 주소창)에 도메인/value가 입력됬을 때 실행되는 Method jsp?
	   public ModelAndView list(CommandMap map, HttpServletRequest request) { // <- method, 함수 
	     // GetMapping의 의미 ->
		// 그 전에 도메인이 뭐에요 알아요? 홈페이지 주소? 그렇다칩시다.. 여기서는 localhost에요
		// localhost/value 가 입력됬을 때 이 함수가 실행되게 한다. 라고 설정한게 @GetMapping(value="")에요
		// 여기가 왜 실행되느냐? localhost/myRecipe라는 값이 들어왔기 때문에. value가 myRecipe이기 때문에.
		// 생각나는대로 수정해서 한 번 돌려봐요
	      int page = 1;
			if (map.containsKey("page")) {
				page = Integer.parseInt((String) map.get("page"));
			}
			map.put("page", (page - 1) * 10);

			ModelAndView mv = new ModelAndView("product");
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
				
				return "redirect:/product";
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