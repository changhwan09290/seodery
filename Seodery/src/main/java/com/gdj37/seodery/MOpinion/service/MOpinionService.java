package com.gdj37.seodery.MOpinion.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.seodery.MOpinion.dao.IMOpinionDao;

@Service
public class MOpinionService implements IMOpinionService{

	@Autowired
	public IMOpinionDao iMOpinionDao;

	@Override
	public int getCSCnt(HashMap<String, String> params) throws Throwable {
		return iMOpinionDao.getCSCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getMOpinionList(HashMap<String, String> params) throws Throwable {
		return iMOpinionDao.getMOpinionList(params);
	}

	@Override
	public int MOpinionAdd(HashMap<String, String> params) throws Throwable {
		return iMOpinionDao.MOpinionAdd(params);
	}

	@Override
	public HashMap<String, String> getMOpinion(HashMap<String, String> params) throws Throwable {
		return iMOpinionDao.getMOpinion(params);
	}

	@Override
	public int UpdateMOpinion(HashMap<String, String> params) throws Throwable {
		return iMOpinionDao.UpdateMOpinion(params);
	}

	@Override
	public int deleteMOpinion(HashMap<String, String> params) throws Throwable {
		return iMOpinionDao.deleteMOpinion(params);
	}
}
