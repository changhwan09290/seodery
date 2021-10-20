package com.gdj37.seodery.park.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.seodery.common.bean.PagingBean;
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
		 
		 if(params.get("page")!= null) { // 넘어오는 현재 p데이터가 존재 시 page =
			 page = params.get("page");
			 }
		 
		 mav.addObject("page",page);
		 
		
		mav.setViewName("park/parkList");
		return mav;
	}
	
	
	@RequestMapping(value="/apitest", method=RequestMethod.GET, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String callApiData(@RequestParam HashMap<String, String> params) throws IOException {
	
		ObjectMapper mapper = new ObjectMapper();	//jackson 객체
		Map<String, Object> modelMap = new HashMap<String, Object>();	//데이터를 담을 map
		
		
		int page = Integer.parseInt(params.get("page"));
		
		int cnt = 132;	//총 게시글 개수 
		
		int viewCnt = 15; // 페이지당 게시글 개수
		
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 15, 5);
		//PagingBean pb = iPagingService.getPagingBean(page, cnt, 15, 5);
		
		/*
		 * if(page > viewCnt) {
		 * 
		 * 
		 * }
		 */
		
		//데이터 시작, 종료 번호 추가 
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		
		// 임시코드
		//params.put("S_START_PAGE", "1"); // 삭제
		
		//int selectStartPage = Integer.parseInt(params.get("S_START_PAGE").toString()); // 선택 페이지 번호(파라미터)
		//int selectMaxPage = selectStartPage*5; // 페이징 5개씩 하는거임
		//int viewCnt = 15; // 페이지당 게시글 개수
		//int startPage = 1; // data 시작번호 - 계산필요
		//int endPage = 15; // data 끝번호 - 계산필요
		
//		StringBuffer result = new StringBuffer();
//		String urlStr = "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/1/132?";
		
		String urlStr = "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/";
		urlStr += params.get("startCnt") + "/" + params.get("endCnt");
		
		
	  	String vStringLine = "";
	  	//페이지 취득
	  	//int page = selectStartPage;
	  	
	  	//개수 취득 
	  	//int cnt = 132;
	  	
	  	//페이징 정보 취득
	  	//PagingBean pb = iPagingService.getPagingBean(page, cnt, viewCnt, selectMaxPage);
	  	
	  	//데이터 시작, 종료값 할당 
	  	//params.put("startCnt", String.valueOf(startPage));
	  	//params.put("endCnt", String.valueOf(endPage));
//			params.put("startCnt", Integer.toString(pb.getStartCount()));
//			params.put("endCnt", Integer.toString(pb.getEndCount()));
	  	
	  	
	  	//modelMap.put("urlStr", urlStr);
	  	modelMap.put("pb", pb);
	  	modelMap.put("page", page);
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
//		  		System.out.println(">>>" + vHttpURLConnection.getResponseCode());
//		  		System.out.println(">>>" + vHttpURLConnection.getResponseMessage());
//		  		System.out.println(">>>" + vStringBuilder.toString());
		  		vStringLine = vStringBuilder.toString();
		  		modelMap.put("resData", vStringLine);
		  		
	  		} else {
	  			System.out.println("요청실패");
//	  			System.out.println(">>>" + vHttpURLConnection.getResponseCode());
//		  		System.out.println(">>>" + vHttpURLConnection.getResponseMessage());
//		  		System.out.println(">>>" + vStringBuilder.toString());
		  		vStringLine = vStringBuilder.toString();
	  		}
	  		
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  	
	  	//데이터를 문자열화 
	  	return mapper.writeValueAsString(modelMap);
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
