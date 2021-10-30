package com.gdj37.seodery.ur.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.seodery.ur.dao.IUrDao;

@Service
public class UrService implements IUrService {

	@Autowired IUrDao iUrDao;

	@Override
	public HashMap<String, String> getm1(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return iUrDao.getm1(params);
	}

	@Override
	public HashMap<String, String> login(HashMap<String, String> params) throws Throwable {
		return iUrDao.login(params);
	}

	@Override
	public int join(HashMap<String, String> params) throws Throwable {
		return iUrDao.join(params);
	}
}
