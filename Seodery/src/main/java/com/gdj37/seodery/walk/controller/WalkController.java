package com.gdj37.seodery.walk.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.gdj37.seodery.common.service.IPagingService;
import com.gdj37.seodery.walk.service.IWalkService;

@Controller
public class WalkController {
	@Autowired
	public IWalkService iWalkService;
	
	
	@Autowired 
	public IPagingService iPagingService;
	 
	
	
	  @RequestMapping(value = "/walkList") 
	  public ModelAndView walkList(
			  @RequestParam HashMap<String,String> params,
			  ModelAndView mav) {
	 
	  String page = "1";
	  
	  if(params.get("page") != null) {
		  page = params.get("page");
	  }
	  
	  mav.addObject("page",page);
	  
	  mav.setViewName("walk/walkList");
	  
	  return mav; 
	  }
	  
	  @RequestMapping(value = "/walkComm") 
	  public ModelAndView walkComm(ModelAndView mav) { 
		  
		  
      mav.setViewName("walk/walkComm");
	  
	  return mav; 
	  }
	  
	  @RequestMapping(value = "/walkDtl") 
	  public ModelAndView walkDtl(ModelAndView mav) { 
		  
		  
      mav.setViewName("walk/walkDtl");
	  
	  return mav; 
	  }
	 
	
	  @RequestMapping(value="/apiwalk", method=RequestMethod.GET, produces = "text/json;charset=UTF-8")
      @ResponseBody
      public String apiwalk(Model model) throws Exception {
           
		  String urlStr = "http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/1/13/";
		  //URL url = new URL("http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/1/13/");

		  //ObjectMapper mapper = new ObjectMapper();
		  StringBuilder sb = new StringBuilder();
		  BufferedReader br;

		  //List<Map<String, Object>> listMap = new ArrayList<Map<String,Object>>();
		  
		  String line = ""; 

		  try {
			  
			URL vURL = new URL(urlStr);
		    HttpURLConnection con = (HttpURLConnection)vURL.openConnection();
		    
		    

		    //Request Header 정의
		    con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");

		    //전송방식
		    con.setRequestMethod("GET");

		    //서버에 연결되는 Timeout 시간 설정
		    //con.setConnectTimeout(5000);

		    //InputStream 읽어 오는 Timeout 시간 설정
		    //con.setReadTimeout(5000); 

		    //URLConnection에 대한 doOutput 필드값을 지정된 값으로 설정한다. 
		    //URL 연결은 입출력에 사용될 수 있다. 
		    //URL 연결을 출력용으로 사용하려는 경우 DoOutput 플래그를 true로 설정하고, 
		    //그렇지 않은 경우는 false로 설정해야 한다. 기본값은 false이다.
		    con.setDoOutput(true); 

		    if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
		      br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		      //String line;
		      while ((line = br.readLine()) != null) {
		      sb.append(line).append("\n");
		      }
		      br.close();

		      //Map<String, String> map = mapper.readValue(json, new TypeReference<List<Map<String, Object>>(){});
		     // model.addAttribute("listMap", listMap);
		      System.out.println("요청성공");
		      line = sb.toString();
		    } else {
		      line = sb.toString();
		    }
		  } catch (Exception e) {
		  	System.err.println(e.toString());
		  }
		  return line;
		}	  

}
