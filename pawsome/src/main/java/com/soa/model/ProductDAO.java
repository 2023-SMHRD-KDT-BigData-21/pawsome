package com.soa.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.soa.database.SqlSessionManager;

public class ProductDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// 글 정보 넣기
	public String insert(Product pd) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		sqlSession.insert("com.soa.database.ProductMapper.insert", pd);
		String res = sqlSession.selectOne("com.soa.database.ProductMapper.select", pd);
		sqlSession.close();
		return res;
	}
	
	// 글 정보들 리스트로 불러오기
	public List<Product> productList() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Product> list = sqlSession.selectList("com.soa.database.ProductMapper.list");
		sqlSession.close();
		return list;
	}
	
	// 한 게시글의 전체 정보 불러오기
	public Product productContent(int product_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Product product = sqlSession.selectOne("com.soa.database.ProductMapper.content", product_id);
		sqlSession.close();
		return product;
	}
	
	// seller_id = user_id인 게시글 정보 불러오기
	public List<Product> myProduct(String user_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Product> list = sqlSession.selectList("com.soa.database.ProductMapper.mycontent", user_id);
		sqlSession.close();
		return list;
	}
	
	// buyer_id = user_id인 게시글 정보 불러오기
	public List<Product> myBuyProduct(String user_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Product> list = sqlSession.selectList("com.soa.database.ProductMapper.mybuycontent", user_id);
		sqlSession.close();
		return list;
	}
	
	// 유저가 찜한 product_id에 해당하는 게시글 정보 불러오기(product_id에 해당하는 게시글 정보 가져오기)
	public Product likeProduct(BigDecimal product_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Product product = sqlSession.selectOne("com.soa.database.ProductMapper.likecontent", product_id);
		sqlSession.close();
		return product;
		
	}
	
	// 게시글 정보 삭제(del_yn업데이트)
	public int deleteProduct(String product_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.update("com.soa.database.ProductMapper.deleteproduct", product_id);
		sqlSession.close();
		return res;
	}
	
	// 판매완료 상태로 변경하기 ( chat창에서 product_status 변경 )
	public int updateStatus(Product product) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.update("com.soa.database.ProductMapper.updateproduct", product);
		sqlSession.close();
		return res;
	}

	public List<Product> search(Product pd) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		List<Product> list = sqlSession.selectList("com.soa.database.ProductMapper.search",pd);
		sqlSession.close();
		
		return list;
	}

	public List<Product> cate(Product pd) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<Product> list = sqlSession.selectList("com.soa.database.ProductMapper.catelist",pd);
		sqlSession.close();
		return list;
	}
	
	
}
