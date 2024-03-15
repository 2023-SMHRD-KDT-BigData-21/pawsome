package com.soa.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.soa.model.Member;
import com.soa.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int join(Member member) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.insert("com.soa.database.MemberMapper.join", member);
		sqlSession.close();
		return res;
	}
	
	public Member login(Member member) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Member res = sqlSession.selectOne("com.soa.database.MemberMapper.login", member);
		sqlSession.close(); 
		return res ;
	}
	
	public Member idCheck(String user_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Member res = sqlSession.selectOne("com.soa.database.MemberMapper.idcheck", user_id);
		sqlSession.close(); 
		return res ;
	}
	
	public Member nickCheck(String user_nick) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Member res = sqlSession.selectOne("com.soa.database.MemberMapper.nickCheck", user_nick);
		sqlSession.close(); 
		return res ;
	}
	
	public Member emailCheck(String user_email) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		Member res = sqlSession.selectOne("com.soa.database.MemberMapper.emailCheck", user_email);
		sqlSession.close();
		return res;
	}

	public int MemberUp(Member member) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		int res = sqlSession.update("com.soa.database.MemberMapper.memberUpdate", member);
		sqlSession.close();
		return res;
	}
}
