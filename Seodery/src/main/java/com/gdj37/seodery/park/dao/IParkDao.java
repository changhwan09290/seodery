package com.gdj37.seodery.park.dao;

import java.util.HashMap;
import java.util.List;

public interface IParkDao {

	public int getPDCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPDList(HashMap<String, String> params) throws Throwable;

	public int addP(HashMap<String, String> params) throws Throwable;

	public String getParkNumIsExists(HashMap<String, String> params) throws Throwable;

	public int updateP(HashMap<String, String> params)throws Throwable;

	public int addPK(HashMap<String, String> params)throws Throwable;

	public int updatePCON(HashMap<String, String> params)throws Throwable;

	public int deletePCON(HashMap<String, String> params)throws Throwable;

}
