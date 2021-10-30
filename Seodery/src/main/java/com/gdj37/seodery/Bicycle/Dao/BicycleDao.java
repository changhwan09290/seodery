package com.gdj37.seodery.Bicycle.Dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BicycleDao  implements IBicycleDao{
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getASCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("bicycleAS.getASCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getASList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("bicycleAS.getASList", params);
	}

	@Override
	public int getASAdd(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("bicycleAS.getASAdd", params);
	}

	@Override
	public HashMap<String, String> getASDtl(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("bicycleAS.getASDtl", params);
	}

	@Override
	public int getASUpdate(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("bicycleAS.getASUpdate", params);
	}

	@Override
	public int getASDelete(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("bicycleAS.getASDelete", params);
	}

}
