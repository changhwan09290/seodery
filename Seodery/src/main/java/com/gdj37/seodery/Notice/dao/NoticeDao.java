package com.gdj37.seodery.Notice.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDao implements INoticeDao{

	@Autowired
	public SqlSession sqlSession;

	
	@Override
	public int getNCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Notice.getNCnt", params);
	}


	@Override
	public List<HashMap<String, String>> getNoticeList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("Notice.getNoticeList", params);
	}


	@Override
	public int NoticeAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("Notice.NoticeAdd", params);
	}


	@Override
	public HashMap<String, String> getNotice(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("Notice.getNotice", params);
	}


	@Override
	public int UpdateNotice(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("Notice.UpdateNotice", params);
	}


	@Override
	public int deleteNotice(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("Notice.deleteNotice", params);
	}


	@Override
	public void updateHit(HashMap<String, String> params) throws Throwable {
	
		
	}


	

	
}
