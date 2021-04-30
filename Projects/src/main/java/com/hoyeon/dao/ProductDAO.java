package com.hoyeon.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoyeon.dto.ProductDTO;

@Repository
public class ProductDAO {
	@Autowired
	private SqlSession sqlSession;


	public List<HashMap<String, Object>> list(Map<String, Object> map) {
		return sqlSession.selectList("product.list",map);
	}

	public ProductDTO detail(int no) {
		return sqlSession.selectOne("product.detail",no);
	}
	
	
}
