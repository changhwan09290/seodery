package com.gdj37.seodery.memory.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.seodery.memory.dao.ImemoryDao;

@Service
public class memoryService implements ImemoryService{

	@Autowired
	public ImemoryDao imemoryDao;

	@Override
	public int getMSCnt(HashMap<String, String> params) throws Throwable {
		return imemoryDao.getMSCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getmemoryList(HashMap<String, String> params) throws Throwable {
		return imemoryDao.getmemoryList(params);
	}


}
