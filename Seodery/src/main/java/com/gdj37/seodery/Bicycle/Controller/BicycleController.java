package com.gdj37.seodery.Bicycle.Controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.seodery.Bicycle.Service.IBicycleService;
import com.gdj37.seodery.common.bean.PagingBean;
import com.gdj37.seodery.common.service.IPagingService;


@Controller
public class BicycleController {

	@Autowired
	public IBicycleService iBicycleService;

	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value="/use_info")
	public ModelAndView use_info(
			@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		String page = "1";
		
		if(params.get("page")!= null) {
			page = params.get("page");
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("bicycle/use_info");
		return mav;
	}
	
	@RequestMapping(value="/RentalShop")
	public ModelAndView RentalShop(
			@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		String page = "1";
		
		if(params.get("page")!= null) {
			page = params.get("page");
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("bicycle/RentalShop");
		return mav;
	}
	
	@RequestMapping(value="/rentalapi", method=RequestMethod.GET, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String rentalapi(@RequestParam HashMap<String, String> params) throws Throwable {
		
		/* ObjectMapper mapper = new ObjectMapper(); */
		
		String apiUrl1 = "http://openapi.seoul.go.kr:8088/7868576968736d6139325949704470/json/bikeList/1/1000";
		//String apiUrl2 = "http://openapi.seoul.go.kr:8088/7868576968736d6139325949704470/json/bikeList/1001/2000";
		/* String START_INDEX = ; */
		String addr = apiUrl1;
		String line = "";
		StringBuilder sb = new StringBuilder();
		BufferedReader bf;
		
		URL url = new URL(addr);
		HttpURLConnection conn = (HttpURLConnection)url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");	
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			bf = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			bf = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}
		while ((line = bf.readLine()) != null) {
			sb.append(line);
		}
		bf.close();
		conn.disconnect();
		   
		return sb.toString();
		}
			
	@RequestMapping(value="/AfterServiceList")
	public ModelAndView AfterServiceList(
			@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		String page = "1";
		
		if(params.get("page")!= null) {
			page = params.get("page");
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("bicycle/AfterServiceList");
		return mav;
	}
	
	@RequestMapping(value = "/AfterServiceListAjax", method = RequestMethod.POST,
						produces = "text/json; charset=UTF-8")
	@ResponseBody //@ResponseBody : 데이터 주고 받음
	public String AfterServiceListAjax(
					@RequestParam HashMap<String, String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		try {

			int page = Integer.parseInt(params.get("page"));
			int cnt = iBicycleService.getASCnt(params);
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 15, 5);
			
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			
			List<HashMap<String, String>> list = iBicycleService.getASList(params);
			
			modelMap.put("list", list);
			modelMap.put("pb", pb);
		
		} catch(Exception e) {
			e.printStackTrace();
		}
	
		return mapper.writeValueAsString(modelMap); 
	}
	
	@RequestMapping(value="/ASAdd")
	public ModelAndView ASAdd(
			@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		
		/*
		 * String page = "1";
		 * 
		 * if(params.get("page")!= null) { page = params.get("page"); }
		 * 
		 * mav.addObject("page",page);
		 */
		
		mav.setViewName("bicycle/ASAdd");
		return mav;
	}
	
	@RequestMapping(value = "/ASAddAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ASAddAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		String result = "success";

		try {
			int cnt = iBicycleService.getASAdd(params);

			if(cnt == 0) {
				result = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();

			result = "error";
		}
		modelMap.put("result", result);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/ASDtl")
	public ModelAndView ASDtl(
			@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{
		HashMap<String, String> data = iBicycleService.getASDtl(params);
		
		mav.addObject("data", data);
		mav.setViewName("bicycle/ASDtl");
		
		return mav;
	}
	
	@RequestMapping(value = "/ASUpdate")
	public ModelAndView ASUpdate(
			@RequestParam HashMap<String, String> params, ModelAndView mav) throws Throwable{

		if(params.get("qnum") != null) {
			HashMap<String, String> data = iBicycleService.getASDtl(params);

			mav.addObject("data", data);
			mav.setViewName("bicycle/ASUpdate");
		} else {
			mav.setViewName("redirect:AfterServiceList");
		}
		return mav;
	}
	
	@RequestMapping(value = "/ASUpdateAjax", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ASUpdateAjax(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		String result = "success";

		try {
			int cnt = iBicycleService.getASUpdate(params);

			if(cnt == 0) {
				result = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();

			result = "error";
		}
		modelMap.put("result", result);

		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value = "/ASDelete", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ASDelete(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();

		String result = "success";

		try {
			int cnt = iBicycleService.getASDelete(params);

			if(cnt == 0) {
				result = "failed";
			}
		} catch (Exception e) {
			e.printStackTrace();

			result = "error";
		}
		modelMap.put("result", result);

		return mapper.writeValueAsString(modelMap);
	}
	
	
	
	@RequestMapping(value = "/Logout")
	public ModelAndView Logout (HttpSession session, ModelAndView mav) {
		session.invalidate(); //session 정보 초기화
		
		mav.setViewName("redirect:Login");
		
		return mav;
	}
}
