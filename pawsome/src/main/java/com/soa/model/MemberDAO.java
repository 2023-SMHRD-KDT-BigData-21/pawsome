package com.soa.model;

import java.io.File;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.soa.model.Member;
import com.soa.converter.ImageToBase64;
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
		ImageToBase64 converter = new ImageToBase64();

		File file = new File("C:\\Users\\user\\Desktop\\Web(Server)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pawsome\\profile\\"
				+res.getUser_img());
		String fileStringValue = converter.convert(file);
		res.setUser_img(fileStringValue);
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
