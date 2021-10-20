package com.gdj37.seodery.Bicycle.Controller;



import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public IBicycleService ibicycleService;
	
	@Autowired
	public IPagingService iPagingService;
	
	@RequestMapping(value = "/use_info")
	public ModelAndView use_info(
			@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		String page = "1";
		
		if(params.get("page")!= null) {
			page = params.get("page");
		}
		
		mav.addObject("page",page);
		mav.setViewName("bicycle/use_info");
		return mav;
	}
	
	@RequestMapping(value = "/AfterServiceList")
	public ModelAndView AfterServiceList(
			@RequestParam HashMap<String, String> params, ModelAndView mav) {
		
		int page = 1;
		
		if(params.get("page") != null) {
			page = Integer.parseInt(params.get("page"));
		}
		
		mav.addObject("page", page);
		mav.setViewName("bicycle/AfterServiceList");
		
		return mav;
	}

	@RequestMapping(value = "/AfterServiceListAjax", method = RequestMethod.POST,
			produces = "text/json; charset=UTF-8")
	@ResponseBody
	public String AfterServiceListAjax(
			@RequestParam HashMap<String, String> params) throws Throwable {
	
		ObjectMapper mapper = new ObjectMapper();
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		int page = Integer.parseInt(params.get("page"));
		int cnt = ibicycleService.getASCnt(params);
		PagingBean pb = iPagingService.getPagingBean(page, cnt, 15, 5);
		
		params.put("startCnt", Integer.toString(pb.getStartCount()));
		params.put("endCnt", Integer.toString(pb.getEndCount()));
		
		List<HashMap<String, String>> list = ibicycleService.getASList(params);
		
		modelMap.put("list", list);
		modelMap.put("pb", pb);
		
		return mapper.writeValueAsString(modelMap); 
	}
}
