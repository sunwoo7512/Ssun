package com.hoyeon.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoyeon.dao.BoardDAO;
import com.hoyeon.dto.BoardDTO;
@Service
public class boardService {
	@Autowired
	private BoardDAO boardDAO;


	public ArrayList<HashMap<String, Object>> list(Map<String, Object> map) {
		return (ArrayList<HashMap<String, Object>>) boardDAO.list(map);
	}

	public void write(BoardDTO dto) {
		boardDAO.write(dto);
	}

	public BoardDTO detail(int bno) {
		return boardDAO.detail(bno);
	}
	
	public BoardDTO detail(BoardDTO dto) {
		return boardDAO.detail(dto);
	}


	public void update2(Map<String, Object> map) {
		boardDAO.update2(map);
	}

	public void delete(Map<String, Object> map) {
		boardDAO.delete(map);
	}

	public void commentInsert(Map<String, Object> map) {
		boardDAO.commentInsert(map);
		
	}

	public ArrayList<HashMap<String, Object>> commentList(int bno) {
		
		return (ArrayList<HashMap<String, Object>>)boardDAO.commentList(bno);
	}

	public ArrayList<HashMap<String, Object>> newWrite(Map<String, Object> map) {
		return (ArrayList<HashMap<String, Object>>) boardDAO.newWrite(map);
	}

	public ArrayList<HashMap<String, Object>> popularWrite(Map<String, Object> map) {
		return (ArrayList<HashMap<String, Object>>) boardDAO.popularWrite(map);
	}






}
