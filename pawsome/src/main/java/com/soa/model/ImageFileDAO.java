package com.soa.model;

import java.io.File;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.soa.converter.ImageToBase64;
import com.soa.database.SqlSessionManager;

public class ImageFileDAO {
	SqlSessionFactory sessionFactory = SqlSessionManager.getSqlSessionFactory();
	
	// 받은 사진 Insert
	public int imgInsert(ImageFile imageFile, String pdId) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		imageFile.setProduct_id(pdId);
		int res = sqlSession.insert("com.soa.database.ImageFileMapper.insert", imageFile);
	    sqlSession.close();
	    return res;
	}

	// 각 게시글의 1번 사진들만 가져오기
	public List<ImageFile> imageFileList() {
		SqlSession sqlSession = sessionFactory.openSession(true);
		List<ImageFile> list = sqlSession.selectList("com.soa.database.ImageFileMapper.list");
		sqlSession.close();
		return list;
	}
	
	// 한 게시글의 모든 사진 정보 가져오기
	public List<String> imgContent(int product_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		ImageFile imageFile = sqlSession.selectOne("com.soa.database.ImageFileMapper.content", product_id);
		sqlSession.close();
		// 가지고 온 파일 -> 텍스트형태로 변환 (converter - base64)
		ImageToBase64 converter = new ImageToBase64();
		
		List<String> list = new ArrayList<String>();
		
		File file1 = new File("C:\\Users\\user\\Desktop\\Web(Server)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pawsome\\upload\\"
				+imageFile.getFile_name1());
		String fileStringValue1 = converter.convert(file1);
		list.add(fileStringValue1);
		
		if (imageFile.getFile_name2() != null) {
			File file2 = new File("C:\\Users\\user\\Desktop\\Web(Server)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pawsome\\upload\\"
					+imageFile.getFile_name2());
			String fileStringValue2 = converter.convert(file2);
			list.add(fileStringValue2);
			
		} 
		if(imageFile.getFile_name3() != null){
			File file3 = new File("C:\\Users\\user\\Desktop\\Web(Server)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pawsome\\upload\\"
					+imageFile.getFile_name3());
			String fileStringValue3 = converter.convert(file3);
			list.add(fileStringValue3);
			
		} 
		if(imageFile.getFile_name4() != null){
			File file4 = new File("C:\\Users\\user\\Desktop\\Web(Server)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pawsome\\upload\\"
					+imageFile.getFile_name4());
			String fileStringValue4 = converter.convert(file4);
			list.add(fileStringValue4);
			
		} 
		if(imageFile.getFile_name5() != null){
			File file5 = new File("C:\\Users\\user\\Desktop\\Web(Server)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pawsome\\upload\\"
					+imageFile.getFile_name5());
			String fileStringValue5 = converter.convert(file5);
			list.add(fileStringValue5);
		} 
		
		return list;
		
	}
	
	// 내 게시글의 1번 사진들만 가져오기
	public String myProductImage(BigDecimal product_id) {
		SqlSession sqlSession = sessionFactory.openSession(true);
		String myProductImage = sqlSession.selectOne("com.soa.database.ImageFileMapper.mylist", product_id);
		sqlSession.close();
		
		ImageToBase64 converter = new ImageToBase64();
		
		File file = new File("C:\\Users\\user\\Desktop\\Web(Server)\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\pawsome\\upload\\"
				+myProductImage);
		String fileStringValue = converter.convert(file);
		
		return fileStringValue;
	}
	
}
