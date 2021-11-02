package com.gdj37.seodery.park.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.seodery.park.dao.IParkDao;

@Service
public class ParkService implements IParkService{

	@Autowired
	public IParkDao iParkDao;

	@Override
	public int getPDCnt(HashMap<String, String> params) throws Throwable {
		return iParkDao.getPDCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getPDList(HashMap<String, String> params) throws Throwable{
		return iParkDao.getPDList(params);
	}
	
	@Override
	public int addP(HashMap<String, String> params) throws Throwable {
		return iParkDao.addP(params);
	}

	@Override
	public String getParkNumIsExists(HashMap<String, String> params) throws Throwable {
		return iParkDao.getParkNumIsExists(params);
	}

	@Override
	public int updateP(HashMap<String, String> params) throws Throwable {
		return iParkDao.updateP(params);
	}

	@Override
	public int addPK(HashMap<String, String> params) throws Throwable {
		return iParkDao.addPK(params);
	}
}
