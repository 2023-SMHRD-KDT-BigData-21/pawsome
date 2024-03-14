package com.soa.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.soa.database.SqlSessionManager;

public class ProductDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// 글 정보 넣기
	public String insert(Product pd) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		sqlSession.insert("com.smhrd.database.ProductMapper.insert", pd);
		String res = sqlSession.selectOne("com.smhrd.database.ProductMapper.select", pd);
		sqlSession.close();
		return res;
	}
	
	// 글 정보들 리스트로 불러오기
	public List<Product> productList() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Product> list = sqlSession.selectList("com.smhrd.database.ProductMapper.list");
		sqlSession.close();
		return list;
	}
	
	// 한 게시글의 전체 정보 불러오기
	public Product productContent(int product_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Product product = sqlSession.selectOne("com.smhrd.database.ProductMapper.content", product_id);
		sqlSession.close();
		return product;
	}
	
}
