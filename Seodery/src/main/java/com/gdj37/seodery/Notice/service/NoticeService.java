package com.gdj37.seodery.Notice.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.seodery.Notice.dao.INoticeDao;

@Service
public class NoticeService implements INoticeService{

	@Autowired
	public INoticeDao iNoticeDao;
	
	@Override
	public int getNCnt(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.getNCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getNoticeList(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.getNoticeList(params);
	}

	@Override
	public int NoticeAdd(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.NoticeAdd(params);
	}

	@Override
	public HashMap<String, String> getNotice(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.getNotice(params);
	}

	@Override
	public int UpdateNotice(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.UpdateNotice(params);
	}

	@Override
	public int deleteNotice(HashMap<String, String> params) throws Throwable {
		return iNoticeDao.deleteNotice(params);
	}

	
	
}
