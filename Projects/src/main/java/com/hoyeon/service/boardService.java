package com.hoyeon.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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


	public void write(Map<String, Object> map) {
		boardDAO.write(map);
	}


	public BoardDTO detail(int no) {
		return boardDAO.detail(no);
	}

}
