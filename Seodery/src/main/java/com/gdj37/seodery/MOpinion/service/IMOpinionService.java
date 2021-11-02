package com.gdj37.seodery.MOpinion.service;

import java.util.HashMap;
import java.util.List;

public interface IMOpinionService {

	public int getCSCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getMOpinionList(HashMap<String, String> params) throws Throwable;

	public int MOpinionAdd(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getMOpinion(HashMap<String, String> params) throws Throwable;

	public int UpdateMOpinion(HashMap<String, String> params) throws Throwable;

	public int deleteMOpinion(HashMap<String, String> params) throws Throwable;



}
