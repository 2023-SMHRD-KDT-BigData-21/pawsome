package com.soa.model;

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
	
	

}
