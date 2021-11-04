package com.gdj37.seodery.walk.service;

import java.util.HashMap;

public interface IWalkService {

	public String getWalkNmExists(HashMap<String, String> params) throws Throwable;

	public int addWK(HashMap<String, String> params) throws Throwable;

	public int updateWK(HashMap<String, String> params) throws Throwable;

	public int addWalk(HashMap<String, String> params) throws Throwable;


}
