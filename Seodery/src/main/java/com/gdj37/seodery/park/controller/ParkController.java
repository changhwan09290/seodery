package com.gdj37.seodery.park.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.gdj37.seodery.ur.service.IUrService;
import com.gdj37.seodery.util.Utils;

@Controller
public class ParkController {

	@Autowired
	public IParkService iParkService;
	
	@Autowired
	public IPagingService iPagingService;
	
	
	@RequestMapping(value = "/parkList")
	public ModelAndView parkList(@RequestParam HashMap<String, String> params,
			HttpServletRequest request,ModelAndView mav)throws Throwable {
		
		String page = "1";
		if (params.get("page") != null) { // 넘어오는 현재 p데이터가 존재 시 page =
			page = params.get("page");
		}

		mav.addObject("page", page);

		mav.setViewName("park/parkList");
		return mav;
	}

	@RequestMapping(value = "/apitest", method = RequestMethod.GET, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String callApiData(@RequestParam HashMap<String, String> params) throws IOException {

		ObjectMapper mapper = new ObjectMapper(); // jackson 객체
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map

		int page = Integer.parseInt(params.get("page"));

		int cnt = 132; // 총 게시글 개수

		// int viewCnt = 15; // 페이지당 게시글 개수

		PagingBean pb = iPagingService.getPagingBean(page, cnt, 15, 5);

		// 데이터 시작, 종료 번호 추가
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

//		StringBuffer result = new StringBuffer();
//		String urlStr = "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/1/132?";

		String urlStr = "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/";
		urlStr += params.get("startCnt") + "/" + params.get("endCnt");

		String vStringLine = "";

		// modelMap.put("urlStr", urlStr);
		modelMap.put("pb", pb);
		modelMap.put("page", page);
		try {

			StringBuilder vStringBuilder = new StringBuilder();

			URL vURL = new URL(urlStr);

			HttpURLConnection vHttpURLConnection = (HttpURLConnection) vURL.openConnection();
			vHttpURLConnection.setRequestMethod("GET");
			vHttpURLConnection.setDoOutput(true);

			if (vHttpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
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
			vHttpURLConnection.disconnect();

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/apitestall", method = RequestMethod.GET, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String callApiAllData(@RequestParam HashMap<String, String> params) throws IOException {

		ObjectMapper mapper = new ObjectMapper(); // jackson 객체
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map

		// 데이터 시작, 종료 번호 추가
		params.put("startCnt", "1");
		params.put("endCnt", "200");

//		StringBuffer result = new StringBuffer();
//		String urlStr = "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/1/132?";

		String urlStr = "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/";
		urlStr += params.get("startCnt") + "/" + params.get("endCnt");

		String vStringLine = "";

		// modelMap.put("urlStr", urlStr);
		try {

			StringBuilder vStringBuilder = new StringBuilder();

			URL vURL = new URL(urlStr);

			HttpURLConnection vHttpURLConnection = (HttpURLConnection) vURL.openConnection();
			vHttpURLConnection.setRequestMethod("GET");
			vHttpURLConnection.setDoOutput(true);

			if (vHttpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
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
			vHttpURLConnection.disconnect();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
	}

	@RequestMapping(value = "/parkDtl")
	public ModelAndView parkDtl(@RequestParam HashMap<String, String> params, HttpServletRequest request,
			ModelAndView mav) throws Throwable {

		int page = 1;

		if (params.get("page") != null) { // 넘어오는 현재 p데이터가 존재 시 page =
			page = Integer.parseInt(params.get("page"));
		}
		//글 개수
		
		//int cnt = iParkService.getPDCnt(params); 
		//PagingBean pb = iPagingService.getPagingBean(page, cnt, 10,5);
		
		
	// 조회 시작 및 종료번호 할당
		 //params.put("startCnt",Integer.toString(pb.getStartCount()));
		// params.put("endCnt",Integer.toString(pb.getEndCount()));
		
		// List<HashMap<String, String>> list = iParkService.getPDList(params);
		 //System.out.println("list >>>>>>>> " + list);
		
		HashMap<String, String> data = new HashMap<String, String>();
		
		 //상세보기 목록 번호 받아오기
			/*
			 * data.put("PARK_NUM","no"); data.put("MBER_NUM","1"); data.put("CON","test");
			 * data.put("COMM_NUM","1"); data.put("SRATING", "3");
			 */
		String no = request.getParameter("no");
		String name = request.getParameter("name");
		String addr = request.getParameter("addr");
		String phon = request.getParameter("phon");
		mav.addObject("page",page); 
		/*
		 * mav.addObject("pb",pb); mav.addObject("list",list);
		 */
		
		 
		//list.add(data);

		
		System.out.println("목록번호는???" + no);
		mav.addObject("no", no);
		mav.addObject("name", name);
		mav.addObject("addr", addr);
		mav.addObject("phon", phon);
		mav.addObject("page", page);

		mav.setViewName("park/parkDtl");
		return mav;
	}

	
	
	@RequestMapping(value="/parkadd")
	public ModelAndView testOadd(
			@RequestParam HashMap<String, String> params,HttpServletRequest request,
			ModelAndView mav) throws Throwable {
		
		System.out.println("****************************************"+params);
		String no = request.getParameter("no");
		
		mav.addObject("no", no);
		
		// Park num exists
		String isExists = iParkService.getParkNumIsExists(params);
		System.out.println("isExists >>>>>"+ isExists);
		if(isExists == null || isExists.equals("N")) { // 'N'
			// insert(PK)
			int addPK = iParkService.addPK(params);	//공원번호,이름,주소,번호 추가하기
		} else if(isExists.equals("Y")){ // 'Y'
			int update = iParkService.updateP(params);
		}
		int add = iParkService.addP(params);
		// comment save
		
		
//		int cnt = iParkService.addP(params);
//		
//		if(cnt > 0) { //추가 성공했을 경우 
//			mav.setViewName("redirect:parkDtl"); 	//상세보기로 이동 
//		}else {
//			mav.addObject("msg","작성에 실패하였습니다.");
//			mav.setViewName("park/failedAction");		//저장에 실패하면 이 페이지로 이동 
//		}
		return mav;
	}
	
	
	/*
	 * @RequestMapping(value ="/testO") public ModelAndView testO(@RequestParam
	 * HashMap<String, String> params, ModelAndView mav) throws Throwable{
	 * 
	 * List<HashMap<String, String>> list = iTestOService.getO1List(params);
	 * System.out.println("list >>>>>>>> " + list);
	 * 
	 * // HashMap<String, String> data = new HashMap<String, String>();
	 * 
	 * 
	 * data.put("O_NO","1"); data.put("M_NO","18"); data.put("M_NM","test");
	 * data.put("CON","가나다라");
	 * 
	 * 
	 * //list.add(data);
	 * 
	 * mav.addObject("page",page); mav.addObject("pb",pb);
	 * mav.addObject("list",list);
	 * 
	 * mav.setViewName("testO/testO");
	 * 
	 * return mav; }
	 */

	@RequestMapping(value = "/apiDtl", method = RequestMethod.GET, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String apiDtl(@RequestParam HashMap<String, String> params, HttpServletRequest request) throws IOException {

		ObjectMapper mapper = new ObjectMapper(); // jackson 객체
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map

//		StringBuffer result = new StringBuffer();
		// String urlStr =
		// "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/1/?";

		int page = Integer.parseInt(params.get("page"));

		int cnt = 132; // 총 게시글 개수

		PagingBean pb = iPagingService.getPagingBean(page, cnt, 15, 5);

		// 데이터 시작, 종료 번호 추가
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));

		params.put(null, null);

		int no = Integer.parseInt(request.getParameter("no"));

		System.out.println("ajax로 목록번호 불러오기>>>" + no);

		String urlStr = "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/";
		urlStr += no + "/" + no;

		String vStringLine = "";

		// modelMap.put("urlStr", urlStr);
		// modelMap.put("pb", pb);
		// modelMap.put("page", page);
		try {

			StringBuilder vStringBuilder = new StringBuilder();

			URL vURL = new URL(urlStr);

			HttpURLConnection vHttpURLConnection = (HttpURLConnection) vURL.openConnection();
			vHttpURLConnection.setRequestMethod("GET");
			vHttpURLConnection.setDoOutput(true);

			if (vHttpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
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
			vHttpURLConnection.disconnect();

		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
	}

	// 공원찾기
	@RequestMapping(value = "/parkMap")
	public ModelAndView parkMap(@RequestParam HashMap<String, String> params, ModelAndView mav) {

		int page = 1;

		if (params.get("page") != null) { // 넘어오는 현재 p데이터가 존재 시 page =
			page = Integer.parseInt(params.get("page"));
		}

		mav.addObject("page", page);

		mav.setViewName("park/parkMap");
		return mav;
	}

	
	
	
	@RequestMapping(value = "/apiparklotall", method = RequestMethod.GET, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String callAllData(@RequestParam HashMap<String, String> params) throws IOException {

		ObjectMapper mapper = new ObjectMapper(); // jackson 객체
		Map<String, Object> modelMap = new HashMap<String, Object>(); // 데이터를 담을 map

		// 데이터 시작, 종료 번호 추가
		params.put("startCnt", "1");
		params.put("endCnt", "982");

//		StringBuffer result = new StringBuffer();
//		String urlStr = "http://openAPI.seoul.go.kr:8088/58446e7a71616b643239487a427157/json/SearchParkInfoService/1/132?";

		String urlStr = "http://openapi.seoul.go.kr:8088/5576534466616b6432324c6b586b48/json/GetParkInfo/";
		urlStr += params.get("startCnt") + "/" + params.get("endCnt");

		String vStringLine = "";

		// modelMap.put("urlStr", urlStr);
		try {

			StringBuilder vStringBuilder = new StringBuilder();

			URL vURL = new URL(urlStr);

			HttpURLConnection vHttpURLConnection = (HttpURLConnection) vURL.openConnection();
			vHttpURLConnection.setRequestMethod("GET");
			vHttpURLConnection.setDoOutput(true);

			if (vHttpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK) {
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
			vHttpURLConnection.disconnect();
		} catch (MalformedURLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	
	
	
	/*
	 * @RequestMapping value : 주소 method : 전송방식 produces : 돌려주는 형식
	 */
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
