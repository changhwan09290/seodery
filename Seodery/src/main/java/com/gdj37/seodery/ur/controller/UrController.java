package com.gdj37.seodery.ur.controller;

import java.awt.PageAttributes.MediaType;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.seodery.ur.service.IUrService;
import com.gdj37.seodery.util.Utils;

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
	
	@RequestMapping(value="/join")
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
	
}