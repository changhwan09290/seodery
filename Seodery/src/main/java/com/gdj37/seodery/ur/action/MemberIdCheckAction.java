package com.gdj37.seodery.ur.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.gdj37.seodery.ur.dao.MemberDao;


import com.gdj37.seodery.ur.action.*;

 
public class MemberIdCheckAction<ActionForward> 
{
    public ActionForward execute(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
 
        String id = request.getParameter("id");
        MemberDao dao = MemberDao.getInstance();
        
        boolean result = dao.duplicateIdCheck(id);
        
        response.setContentType("text/html;charset=euc-kr");
        PrintWriter out = response.getWriter();
 
        if(result)    out.println("0"); // 아이디 중복
        else        out.println("1");
        
        out.close();
        
        return null;
    }
}


