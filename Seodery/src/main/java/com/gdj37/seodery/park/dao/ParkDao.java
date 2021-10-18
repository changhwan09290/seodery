package com.gdj37.seodery.park.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ParkDao implements IParkDao{

	@Autowired
	public SqlSession sqlSession;
}
