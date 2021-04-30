package com.hoyeon.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hoyeon.dao.ProductDAO;
import com.hoyeon.dto.ProductDTO;
@Service
public class ProductService {
	@Autowired
	private ProductDAO productDAO;


	public ArrayList<HashMap<String, Object>> list(Map<String, Object> map) {
		return (ArrayList<HashMap<String, Object>>) productDAO.list(map);
	}

	public ProductDTO detail(int no) {
		return productDAO.detail(no);
	}

}
