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
		return 0;
	}

	@Override
	public List<HashMap<String, String>> getPDList(HashMap<String, String> params) {
		return iParkDao.getPDList(params);
	}
}
