package com.gdj37.seodery.dust.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.seodery.common.service.IPagingService;
import com.gdj37.seodery.dust.service.IDustService;


@Controller
public class DustController {

	@Autowired
	public IDustService iDustService;

	@Autowired
	public IPagingService iPagingService;
	
	
	@RequestMapping(value="/dust")
	public ModelAndView parkList(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		String page = "1";
		
		if(params.get("page")!= null) {
			page = params.get("page");
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("Dust/dust");
		return mav;
	}
	
	
		
	
	/*
	 * @RequestMapping
	 * value : 주소
	 * method : 전송방식
	 * produces : 돌려주는 형식 
	 * */
	/*
	 * @RequestMapping(value="/parkLists", method=RequestMethod.GET, produces =
	 * "text/xml;charset=UTF-8")
	 * 
	 * @ResponseBody //Spring 에게 돌려주는 내용이 View임을 제시(ajax사용할 때 view인척하려고..) public
	 * String parkLists(@RequestParam HashMap<String, String> params) throws
	 * Throwable{
	 * 
	 * ObjectMapper mapper = new ObjectMapper();
	 * 
	 * Map<String, Object> modelMap = new HashMap<String, Object>();
	 * 
	 * 
	 * String result = "success";
	 * 
	 * try { int cnt = iParkService.ParkList(params);
	 * 
	 * if(cnt ==0) { result = "failed"; } } catch (Exception e) {
	 * e.printStackTrace();
	 * 
	 * result = "error"; }
	 * 
	 * modelMap.put("result", result);
	 * 
	 * 
	 * return mapper.writeValueAsString(modelMap); }
	 */
	
}
