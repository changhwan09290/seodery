package com.gdj37.seodery.park.controller;

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
import com.gdj37.seodery.park.service.IParkService;

@Controller
public class ParkController {

	@Autowired
	public IParkService iParkService;

	@Autowired
	public IPagingService iPagingService;
	
	
	@RequestMapping(value="/parkList")
	public ModelAndView parkList(
			@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		String page = "1";
		
		if(params.get("page")!= null) {
			page = params.get("page");
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("park/parkList");
		return mav;
	}
	
	@RequestMapping(value="/apitest", method=RequestMethod.GET, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String callApiData() throws IOException {
	
//		StringBuffer result = new StringBuffer();
		String urlStr = "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/1/5/";
		
	  	String vStringLine = "";
	  	try {
	  		StringBuilder vStringBuilder = new StringBuilder();

	  		URL vURL = new URL(urlStr);
	  		
	  		HttpURLConnection vHttpURLConnection = (HttpURLConnection) vURL.openConnection();
	  		vHttpURLConnection.setRequestMethod("GET");
	  		vHttpURLConnection.setDoOutput(true);
	  		
	  		if(vHttpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
	  			BufferedReader vBufferedReader = new BufferedReader(
	  					new InputStreamReader(vHttpURLConnection.getInputStream(), "utf-8"));
	  		
		  		while ((vStringLine = vBufferedReader.readLine()) != null) {
					vStringBuilder.append(vStringLine).append("\n");
				}
		  		
		  		vBufferedReader.close();
		  		
		  		System.out.println("요청성공");
		  		System.out.println(">>>" + vHttpURLConnection.getResponseCode());
		  		System.out.println(">>>" + vHttpURLConnection.getResponseMessage());
		  		System.out.println(">>>" + vStringBuilder.toString());
		  		vStringLine = vStringBuilder.toString();
		  		
		  		
	  		} else {
	  			System.out.println("요청실패");
	  			System.out.println(">>>" + vHttpURLConnection.getResponseCode());
		  		System.out.println(">>>" + vHttpURLConnection.getResponseMessage());
		  		System.out.println(">>>" + vStringBuilder.toString());
		  		vStringLine = vStringBuilder.toString();
	  		}
	  		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  	
	  	return vStringLine;
		  	
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
