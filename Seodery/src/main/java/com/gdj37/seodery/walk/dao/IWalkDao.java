package com.gdj37.seodery.walk.dao;

import java.util.HashMap;

public interface IWalkDao {

	public String getWalkNmExists(HashMap<String, String> params) throws Throwable;

	public int addWK(HashMap<String, String> params) throws Throwable;

	public int updateWK(HashMap<String, String> params) throws Throwable;

	public int addWalk(HashMap<String, String> params) throws Throwable;

}
