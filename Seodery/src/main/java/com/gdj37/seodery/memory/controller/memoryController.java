package com.gdj37.seodery.memory.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.seodery.common.bean.PagingBean;
import com.gdj37.seodery.common.service.IPagingService;
import com.gdj37.seodery.memory.service.ImemoryService;
import com.gdj37.seodery.util.Utils;



@Controller
public class memoryController {

	@Autowired
	public ImemoryService imemoryService;

	@Autowired
	public IPagingService iPagingService;
	
	
	@RequestMapping(value="/memoryList")
	public ModelAndView memoryList(@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		String page = "1";
		
		if(params.get("page")!= null) {
			page = params.get("page");
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("memory/memoryList");
		return mav;
	}
	
	@RequestMapping(value = "/memoryLists", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String memoryList(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper(); 
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
	
			//페이지 취득
			int page = Integer.parseInt(params.get("page"));
			//페이징 정보 취득
			int cnt = imemoryService.getMSCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 6, 2);
			//데이터 시작, 종료값 할당
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			//리스트 조회
			List<HashMap<String, String>> list =imemoryService.getmemoryList(params);
			//데이터 담기
			modelMap.put("list",list);
			modelMap.put("pb",pb);
			

		//데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
		}

}
	
		
	