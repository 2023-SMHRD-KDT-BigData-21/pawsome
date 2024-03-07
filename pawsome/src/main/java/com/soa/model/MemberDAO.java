package com.soa.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.soa.database.SqlSessionManager;

public class MemberDAO {

	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int join(Member member) {
		SqlSession sqlSession = sessionFactory.openSession(true);

		int res = sqlSession.insert("", member);
		sqlSession.close();

		return res;
	}

	public Member login(Member member) {
		SqlSession sqlSession = sessionFactory.openSession(true);

		Member res = sqlSession.selectOne("", member);
		sqlSession.close();

		return res;

	}
}
