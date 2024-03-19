package com.soa.model;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.soa.database.SqlSessionManager;
import com.soa.model.MessageRoom;

public class MessageRoomDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();

	public int createRoom(MessageRoom room) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		MessageRoom res1 = sqlSession.selectOne("com.soa.database.ChatRoomMapper.select", room);
		int res = 0;
		
		if (res1 != null) {

		} else {
			res = sqlSession.insert("com.soa.database.ChatRoomMapper.create", room);
			sqlSession.close();
		}

		return res;
	}

	public int roomCheck(MessageRoom room) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		//System.out.println(room.getBuyer());
		
		String res = sqlSession.selectOne("com.soa.database.ChatRoomMapper.checkrnum", room);
		System.out.println(res);
		int rnum = Integer.parseInt(res);
//		System.out.println(rnum);
		
		sqlSession.close();
		
		return rnum;
	}
	
	public List<MessageRoom> getList(String id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		List<MessageRoom> list = sqlSession.selectList("com.soa.database.ChatRoomMapper.getlist", id);
		sqlSession.close();
		
		return list;
	}
	
	public MessageRoom createMessageRoom(MessageRoom room) {
		
		SqlSession sqlSession = sessionFactory.openSession(true);
		
		String userId1 = room.getSeller();
		String userId2 = room.getBuyer();
		
		Map<String, String> params = new HashMap<>();
		params.put("userId1", userId1);
		params.put("userId2", userId2);
		MessageRoom existingRoom = sqlSession.selectOne("com.soa.database.ChatRoomMapper.findMessageRoomByUsers",params);
		
		if(existingRoom == null) {
			sqlSession.insert("com.soa.database.ChatRoomMapper.createMessageRoom",room);
		}
		
		sqlSession.close();
		
		return existingRoom ;
	}
}
