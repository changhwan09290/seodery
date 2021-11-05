package com.gdj37.seodery.ur.controller;

import java.util.HashMap;
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
import com.gdj37.seodery.ur.service.IUrService;
/*import com.gdj37.seodery.ur.service.service;
*/import com.gdj37.seodery.util.Utils;

@Controller
public class UrController {
	
	
	@Autowired
	public IUrService iUrService;
	
	@RequestMapping(value = "/login")
	public ModelAndView login(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable {
		mav.setViewName("Member/login");
		return mav;
	}
	
	
	@RequestMapping(value = {"/mainpage","/"})
	public ModelAndView mainpage(@RequestParam HashMap<String, String> params,
			ModelAndView mav,HttpSession session) throws Throwable {
		mav.setViewName("Member/mainpage");
		return mav;
	}
	
	@RequestMapping(value = "/logout")
	public ModelAndView logout(ModelAndView mav,HttpSession session) throws Throwable {
		session.invalidate();
		mav.setViewName("Member/mainpage");
		return mav;
	}
	
	@RequestMapping(value = "/logins")
	public ModelAndView logins(@RequestParam HashMap<String, String> params,
			ModelAndView mav,
			HttpSession session
			) throws Throwable {
		String pw = Utils.encryptAES128(params.get("psw")); 
		params.put("psw", pw);
		HashMap<String, String> data = iUrService.login(params);
		System.out.println(data);
		if(data != null) {
			session.setAttribute("sMNo", data.get("MBER_NUM"));
			session.setAttribute("sMNm", data.get("NM"));
			mav.setViewName("redirect:mainpage");
		}else {
			mav.setViewName("redirect:login");
		}
		return mav;
	}
	//회원가입 join
	@RequestMapping(value="/member")
	public ModelAndView join (ModelAndView mav) {
		mav.setViewName("Member/member");
		return mav;
	}
	
	@RequestMapping(value="/joins")
	public ModelAndView joins(@RequestParam HashMap<String, String> params,
			ModelAndView mav) throws Throwable{
		
		String pw = Utils.encryptAES128(params.get("password"));
		params.put("pw", pw);
		String birth = params.get("birthyy")+params.get("birthmm")+params.get("birthdd");
		params.put("birth", birth);
		String email = params.get("mail1")+"@"+params.get("mail2");
		params.put("email", email);
		
		int joinChk = iUrService.join(params);
		
		if(joinChk == 0) {
			mav.addObject("msg", "회원가입 실패");
			mav.setViewName("Member/member");
		}else {
			mav.setViewName("redirect:login");
		}
		
		
		return mav;
	}
	
	@RequestMapping(value = "/mypage")
	public ModelAndView mypage(ModelAndView mav, @RequestParam HashMap<String, String> params) throws Exception{
		
		/*
		 * HashMap<String, String> data = iUrService.get_user_info(params);
		 * 
		 * mav.addObject("get_user_info",get_user_info);
		 */
		mav.setViewName("Member/mypage");
		
		return mav;
	}
	
	@RequestMapping(value = "/myPageAjax", method = RequestMethod.POST,
					produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String myPageAjax(HttpSession session) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> modelMap = new HashMap<String, Object>();
		
		HashMap<String, Object> data = Service.getMemberData(session.getAttribute("sMNo"));
		
		modelMap.put("data", data);
		
		return mapper.writeValueAsString(modelMap);
	}
}
	
	
