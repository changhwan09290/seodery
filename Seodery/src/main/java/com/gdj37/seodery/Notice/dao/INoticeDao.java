package com.gdj37.seodery.Notice.dao;

import java.util.HashMap;
import java.util.List;

public interface INoticeDao {

	public int getNCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getNoticeList(HashMap<String, String> params) throws Throwable;

	public int NoticeAdd(HashMap<String, String> params)throws Throwable;

	public HashMap<String, String> getNotice(HashMap<String, String> params)throws Throwable;

	public int UpdateNotice(HashMap<String, String> params)throws Throwable;

	public int deleteNotice(HashMap<String, String> params)throws Throwable;


	
}
