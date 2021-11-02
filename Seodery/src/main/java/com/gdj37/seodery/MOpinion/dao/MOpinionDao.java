package com.gdj37.seodery.MOpinion.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MOpinionDao implements IMOpinionDao{

	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getCSCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("MOpinion.getCSCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getMOpinionList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("MOpinion.getMOpinionList", params);
	}

	@Override
	public int MOpinionAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("MOpinion.MOpinionAdd", params);
	}

	@Override
	public HashMap<String, String> getMOpinion(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("MOpinion.getMOpinion", params);
	}

	@Override
	public int UpdateMOpinion(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("MOpinion.UpdateMOpinion", params);
	}

	@Override
	public int deleteMOpinion(HashMap<String, String> params) throws Throwable {
		return sqlSession.delete("MOpinion.deleteMOpinion", params);
	}
}
