package com.gdj37.seodery.ur.controller;

import java.awt.PageAttributes.MediaType;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdj37.seodery.ur.dto.MemberDTO;
import com.gdj37.seodery.ur.service.IUrService;
import com.gdj37.seodery.ur.service.MemberService;
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
	// 마이페이지 이동
		@RequestMapping(value = "/mypage.do")
		public String mypage() throws Exception{
			return "/member/mypage";
		}
		
		/*
		 * // mypage 수정
		 * 
		 * @RequestMapping(value = "/update_mypage.do", method = RequestMethod.POST)
		 * public String update_mypage(@ModelAttribute MemberDTO member, HttpSession
		 * session, RedirectAttributes rttr) throws Exception{
		 * session.setAttribute("member", MemberService.update_mypage(member));
		 * rttr.addFlashAttribute("msg", "회원정보 수정 완료"); return
		 * "redirect:/member/mypage.do"; }
		 * 
		 * // 비밀번호 변경
		 * 
		 * @RequestMapping(value = "/update_pw.do", method = RequestMethod.POST) public
		 * String update_pw(@ModelAttribute MemberDTO member, @RequestParam("old_pw")
		 * String old_pw, HttpSession session, HttpServletResponse response,
		 * RedirectAttributes rttr) throws Exception{ session.setAttribute("member",
		 * MemberService.update_pw(member, old_pw, response));
		 * rttr.addFlashAttribute("msg", "비밀번호 수정 완료"); return
		 * "redirect:/member/mypage.do"; }
		 */
	
}