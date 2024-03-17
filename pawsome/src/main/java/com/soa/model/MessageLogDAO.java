package com.soa.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.soa.database.SqlSessionManager;

public class MessageLogDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	public void mLog(MessageLog log) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		int res = sqlSession.insert("com.soa.database.MessageLogMapper.insert",log);
		
		sqlSession.close();
	}

	public List<MessageLog> getLog(MessageLog log) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		List<MessageLog> list = sqlSession.selectList("com.soa.database.MessageLogMapper.getlog",log);
		
		sqlSession.close();
		
		return list;
	}
	
	public String getLast(String rnum) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		String log = sqlSession.selectOne("com.soa.database.MessageLogMapper.getlast",rnum);
		
		return log;
	}
}
