package com.gdj37.seodery.MOpinion.controller;

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
import com.gdj37.seodery.util.Utils;
import com.gdj37.seodery.MOpinion.service.IMOpinionService;



@Controller
public class MOpinionController {

	@Autowired
	public IMOpinionService iMOpinionService;

	@Autowired
	public IPagingService iPagingService;
	
	
	@RequestMapping(value="/MOpinionList")
	public ModelAndView MOpinionList(@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		String page = "1";
		
		if(params.get("page")!= null) {
			page = params.get("page");
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("MOpinion/MOpinionList");
		return mav;
	}
	
	@RequestMapping(value = "/MOpinionLists", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String MOpinionList(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper(); 
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
	
			//페이지 취득
			int page = Integer.parseInt(params.get("page"));
			//페이징 정보 취득
			int cnt = iMOpinionService.getCSCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 15, 2);
			//데이터 시작, 종료값 할당
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			//리스트 조회
			List<HashMap<String, String>> list =iMOpinionService.getMOpinionList(params);
			//데이터 담기
			modelMap.put("list",list);
			modelMap.put("pb",pb);
			

		//데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
		}
	

	  @RequestMapping(value = "/MOpinionAdd")
	  public ModelAndView MOpinionAdd(HttpSession session, ModelAndView mav) {
		  mav.setViewName("MOpinion/MOpinionAdd");
	  
	  return mav;
	 }
	  
	  
	  @RequestMapping(value = "/MOpinionAdds", method = RequestMethod.POST,
				produces ="text/json;charset=UTF-8")
		@ResponseBody 
		public String MOpinionAdds(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iMOpinionService.MOpinionAdd(params);
				
				if(cnt == 0) {
					result ="failed";
				}

			}catch (Exception e) {
				e.printStackTrace();
				
				result ="error";
			}
			
			modelMap.put("result", result);
			
			return mapper.writeValueAsString(modelMap);	
	}
	  

	  @RequestMapping(value = "/MOpinion")
		public ModelAndView MOpinion(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		  if(params.get("no") != null) {
	
				//데이터 조회
			HashMap<String, String> data = iMOpinionService.getMOpinion(params);
				
			
			mav.addObject("data", data);
			
			mav.setViewName("MOpinion/MOpinion");
		  }else {
				mav.setViewName("MOpinion/MOpinionList");
		  }
			return mav;
		}
	  
	  @RequestMapping(value = "/MOpinionUpdate")
		public ModelAndView MOpinionUpdate(@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
		  if(params.get("no") !=null) {
				HashMap<String, String> data = iMOpinionService.getMOpinion(params);
				
			mav.addObject("data", data);
			
			mav.setViewName("MOpinion/MOpinionUpdate");
		  }else {
			  mav.setViewName("MOpinion/MOpinionList");
			}
			return mav;
		}
	  @RequestMapping(value = "/MOpinionUpdates", method = RequestMethod.POST,
				produces ="text/json;charset=UTF-8")
		@ResponseBody 
		public String MOpinionUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iMOpinionService.UpdateMOpinion(params);
				
				if(cnt == 0) {
					result ="failed";
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				
				result ="error";
			}
			
			modelMap.put("result", result);
			
			return mapper.writeValueAsString(modelMap);	
	}
		
		@RequestMapping(value = "/MOpinionDeletes", method = RequestMethod.POST,
				produces ="text/json;charset=UTF-8")
		@ResponseBody 
		public String MOpinionDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iMOpinionService.deleteMOpinion(params);
				
				if(cnt == 0) {
					result ="failed";
				}
				
			}catch (Exception e) {
				e.printStackTrace();
				
				result ="error";
			}
			
			modelMap.put("result", result);
			
			return mapper.writeValueAsString(modelMap);	
	}

}
	
		
	