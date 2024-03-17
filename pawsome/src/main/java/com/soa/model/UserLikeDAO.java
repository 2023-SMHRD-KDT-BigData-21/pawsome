package com.soa.model;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.soa.database.SqlSessionManager;

public class UserLikeDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();

	public void updateLike(UserLike like) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		UserLike isLike = sqlSession.selectOne("com.soa.database.UserLikeMapper.check",like);
		int res = 0;
		if(isLike!=null) {
			sqlSession.delete("com.soa.database.UserLikeMapper.delete", like);
		} else {
			res = sqlSession.insert("com.soa.database.UserLikeMapper.insert",like);
		}
		
		sqlSession.close();
	}

	public UserLike checkLike(UserLike like) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		UserLike islike = sqlSession.selectOne("com.soa.database.UserLikeMapper.check",like);
		
		sqlSession.close();
		
		return islike;
	}
	
	// 해당 유저가 찜한 게시글의 product_id 가져오기
	public List<BigDecimal> likeProduct(String user_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<BigDecimal> list = sqlSession.selectList("com.soa.database.UserLikeMapper.likeproduct", user_id);
		sqlSession.close();
		return list;
	}

}
