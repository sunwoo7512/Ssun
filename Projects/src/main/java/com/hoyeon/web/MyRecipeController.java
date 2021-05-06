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
import com.hoyeon.service.boardService;
import com.hoyeon.util.CommandMap;
import com.hoyeon.util.FileSave;

@Controller
public class MyRecipeController {
	@Autowired
	private boardService boardService;
	@Autowired
	private FileSave fileSave;
	@Autowired
	private ServletContext servletContext;
	
	
	   @GetMapping(value = "/myRecipe")
	   public ModelAndView list(CommandMap map, HttpServletRequest request) {
	      // search이 들어온다면
	      // if(map.containsKey("search")) {
	      System.out.println("검색 들어옴 " + map.get("search"));
	      System.out.println("검색 주제 " + map.get("key"));
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
	      
	      ModelAndView mv = new ModelAndView("myRecipe");
	      ArrayList<HashMap<String, Object>> list = null;
	      if (map.containsKey("cate")) {
	    	  if (map.get("cate").equals("new")) {
	    		  list = boardService.newWrite(map.getMap());
			}else if(map.get("cate").equals("popular")){
				list = boardService.popularWrite(map.getMap());
			}
	    	
		}else {
		     list = boardService.list(map.getMap());

		}
	      if (list.size() > 0) {
	         mv.addObject("list", list);
	         mv.addObject("totalCount", list.get(0).get("count"));

	      }
	      mv.addObject("page", page);
	      System.out.println(map.getMap());
	      return mv;
	   }
	   
	  

	@GetMapping(value = "write")
	public String writeView(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("name") != null &&
				session.getAttribute("no") != null	) {
			return "write";			
		}else {
			return "redirect:/loginError";
		}
	}
	
	@PostMapping(value = "write1")
	public String write(HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		HttpSession session = request.getSession();
		
		if(session.getAttribute("no") != null 
				&& session.getAttribute("name") != null
				&& request.getParameter("title") != ""
				&& request.getParameter("content") != "") {

				BoardDTO dto = new BoardDTO();
				dto.setBoard_title(request.getParameter("title"));
				dto.setBoard_content(request.getParameter("content"));
				dto.setMember_no((Integer) session.getAttribute("no"));
				
				String realPath = servletContext.getRealPath("resources/");
				if (file.getOriginalFilename() != null
						&& file.getSize() > 0) {
					String realFileName = fileSave.save(realPath + "upload", file);
					dto.setBoard_file(realFileName);
				}
				
				boardService.write(dto); 

				return "redirect:/myRecipe";

		} else {
				return "redirect:/loginError";
		}
	}
	
	//디테일
	@GetMapping(value = "detail")
	public ModelAndView detail(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView("detail");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		
		BoardDTO dto = boardService.detail(bno);
		ArrayList<HashMap<String, Object>> comment = boardService.commentList(bno);
		mv.addObject("comment", comment);
		mv.addObject("dto", dto);
		return mv;
	}
	//수정하기
	@GetMapping(value = "update")
	public ModelAndView update(BoardDTO dto, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("update");
		
		HttpSession session = request.getSession();
		
		dto.setMember_no((Integer) session.getAttribute("no"));
		
		dto.setBoard_no(Integer.parseInt( request.getParameter("bno")));
 		dto = boardService.detail(dto);
 		
		mv.addObject("dto", dto);
	
		return mv;
		
	}
	@PostMapping(value = "update")
	public String update(CommandMap map, HttpServletRequest request, @RequestParam("file") MultipartFile file) {
		
		HttpSession session = request.getSession();
		if (session.getAttribute("no")!=null
				&&session.getAttribute("name")!=null) {
			
			if (map.containsKey("bno")
					&&map.containsKey("title")
					&&map.containsKey("content")) {
				
				String realPath = servletContext.getRealPath("resources/");
				if (file.getOriginalFilename() != null
						&& file.getSize() > 0) {
					String realFileName = fileSave.save(realPath + "upload", file);
					map.put("file", realFileName);
				}
				
				map.put("no", session.getAttribute("no"));
				
				boardService.update2(map.getMap());
				
				return "redirect:/myRecipe"; /* "redirect:/detail?bno=" + map.get("bno"); */
			}else {
				return "redirect:/myRecipe";
			}
		}else {
			return "redirect:/loginError";
		}

	}
	
	@GetMapping(value = "delete")
	public String delete(CommandMap map, HttpServletRequest request) {
		
		HttpSession session = request.getSession();

		if (session.getAttribute("no") != null 
				&& session.getAttribute("name") != null){

			if (map.containsKey("bno")) {

				map.put("no", session.getAttribute("no"));
				
				boardService.delete(map.getMap());

				return "redirect:/myRecipe";
				
			} else {
				return "redirect:/myRecipe";
			}
			
			
		} else {
			return "redirect:/loginError";
		}		
	}
	
	
	@PostMapping(value = "/comment")
	public String comment(CommandMap map, HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("name")!=null && session.getAttribute("no")!= null) {
			if (map.containsKey("bno") && map.containsKey("comment")) {
				map.put("member_no", session.getAttribute("no"));
				boardService.commentInsert(map.getMap());
				System.out.println(map.get("comment"));
				return "redirect:/detail?bno=" + map.get("bno");
			}else {
				return "redirect:/myRecipe";
			}
		}else {
			return "redirect:/loginError";
		}
		
		
		
	}
	
	
}