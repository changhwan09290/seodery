package com.gdj37.seodery.ur.service;

import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;
import com.gdj37.seodery.ur.dao.UrDao;
import com.gdj37.seodery.ur.dto.MemberDTO;

@Service
public abstract class MemberServiceImpl implements MemberService {

	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	/*
	 * public Object update_mypage(MemberDTO member, HttpServletResponse response)
	 * throws Exception { // TODO Auto-generated method stub return null; }
	 */

	// 아이디 중복 검사(AJAX)
	/*
	 * @Override public void check_id(String id, HttpServletResponse response)
	 * throws Exception { PrintWriter out = response.getWriter();
	 * out.println(UR.check_id(id)); out.close(); }
	 * 
	 * // 이메일 중복 검사(AJAX)
	 * 
	 * @Override public void check_email(String email, HttpServletResponse response)
	 * throws Exception { PrintWriter out = response.getWriter();
	 * out.println(UR.check_email(email)); out.close(); }
	 * 
	 * // 회원가입
	 * 
	 * @Override public int join_member(MemberDTO member, HttpServletResponse
	 * response) throws Exception {
	 * response.setContentType("text/html;charset=utf-8"); PrintWriter out =
	 * response.getWriter();
	 * 
	 * if (ur.check_id(member.getId()) == 1) { out.println("<script>");
	 * out.println("alert('동일한 아이디가 있습니다.');"); out.println("history.go(-1);");
	 * out.println("</script>"); out.close(); return 0; } else if
	 * (UR.check_email(member.getMail()) == 1) { out.println("<script>");
	 * out.println("alert('동일한 이메일이 있습니다.');"); out.println("history.go(-1);");
	 * out.println("</script>"); out.close(); return 0; } else {
	 * UR.join_member(member); return 1; } }
	 */
}
