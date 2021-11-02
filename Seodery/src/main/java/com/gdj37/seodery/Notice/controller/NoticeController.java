package com.gdj37.seodery.Notice.controller;

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
import com.gdj37.seodery.Notice.service.INoticeService;



@Controller
public class NoticeController {

	@Autowired
	public INoticeService iNoticeService;

	@Autowired
	public IPagingService iPagingService;
	
	
	@RequestMapping(value="/NoticeList")
	public ModelAndView NoticeList(@RequestParam HashMap<String, String> params,
			ModelAndView mav) {
		
		String page = "1";
		
		if(params.get("page")!= null) {
			page = params.get("page");
		}
		
		mav.addObject("page",page);
		
		mav.setViewName("Notice/NoticeList");
		return mav;
	}
	
	@RequestMapping(value = "/NoticeLists", method = RequestMethod.POST,
			produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String NoticeList(@RequestParam HashMap<String, String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper(); 
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
	
			//페이지 취득
			int page = Integer.parseInt(params.get("page"));
			//페이징 정보 취득
			int cnt = iNoticeService.getNCnt(params);
			
			PagingBean pb = iPagingService.getPagingBean(page, cnt, 15, 2);
			//데이터 시작, 종료값 할당
			params.put("startCnt", Integer.toString(pb.getStartCount()));
			params.put("endCnt", Integer.toString(pb.getEndCount()));
			//리스트 조회
			List<HashMap<String, String>> list =iNoticeService.getNoticeList(params);
			//데이터 담기
			modelMap.put("list",list);
			modelMap.put("pb",pb);
			

		//데이터를 문자열화
		return mapper.writeValueAsString(modelMap);
		}
	
	 @RequestMapping(value = "/NoticeAdd")
	  public ModelAndView NoticeAdd(HttpSession session, ModelAndView mav) {
		  mav.setViewName("Notice/NoticeAdd");
	  
	  return mav;
	 }
	  @RequestMapping(value = "/NoticeAdds", method = RequestMethod.POST,
				produces ="text/json;charset=UTF-8")
		@ResponseBody 
		public String NoticeAdds(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iNoticeService.NoticeAdd(params);
				
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
	  
	  @RequestMapping(value = "/Notice")
		public ModelAndView Notice(@RequestParam HashMap<String, String> params,
								ModelAndView mav) throws Throwable {
		  if(params.get("no") != null) {
	
				//데이터 조회
			HashMap<String, String> data = iNoticeService.getNotice(params);
				
			
			mav.addObject("data", data);
			
			mav.setViewName("Notice/Notice");
		  }else {
				mav.setViewName("Notice/NoticeList");
		  }
			return mav;
		}
	  
	  
	  @RequestMapping(value = "/NoticeUpdate")
		public ModelAndView NoticeUpdate(@RequestParam HashMap<String, String> params,
				ModelAndView mav) throws Throwable {
		  if(params.get("no") !=null) {
				HashMap<String, String> data = iNoticeService.getNotice(params);
				
			mav.addObject("data", data);
			
			mav.setViewName("Notice/NoticeUpdate");
		  }else {
			  mav.setViewName("Notice/NoticeList");
			}
			return mav;
		}  
	  
	  @RequestMapping(value = "/NoticeUpdates", method = RequestMethod.POST,
				produces ="text/json;charset=UTF-8")
		@ResponseBody 
		public String NoticeUpdates(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iNoticeService.UpdateNotice(params);
				
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
	  
	  @RequestMapping(value = "/NoticeDeletes", method = RequestMethod.POST,
				produces ="text/json;charset=UTF-8")
		@ResponseBody 
		public String NoticeDeletes(@RequestParam HashMap<String, String> params) throws Throwable {
			ObjectMapper mapper = new ObjectMapper();
			
			Map<String, Object> modelMap = new HashMap<String, Object>();
			
			String result = "success";
			
			try {
				int cnt = iNoticeService.deleteNotice(params);
				
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
	
		
	