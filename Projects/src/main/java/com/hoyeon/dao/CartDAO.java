package com.hoyeon.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoyeon.dto.CartDTO;

import java.util.List;

@Repository
public class CartDAO {

	private SqlSession sqlSession;
	
	@Autowired
	public CartDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	public List<CartDTO> getCartList(int member_no){
		
		return sqlSession.selectList("cart.selectCartList");
	}
}
