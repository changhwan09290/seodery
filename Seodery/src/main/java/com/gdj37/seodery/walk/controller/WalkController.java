package com.gdj37.seodery.walk.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.seodery.common.service.IPagingService;
import com.gdj37.seodery.walk.service.IWalkService;

@Controller
public class WalkController {
   @Autowired
   public IWalkService iWalkService;
   
   
   @Autowired 
   public IPagingService iPagingService;
    
   /*
   @PostMapping("/dataMove")
   public ModelAndView dataMove(@RequestParam Map<String,Object> paramMap) {
      
   }*/
   
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
     
     @RequestMapping("moveDtl")
     public ModelAndView moveDtl(ModelAndView mav, @RequestParam("cosn") String cosn){
          //var url = "http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/"+pageNum+"/"+pageNum+"/";
          
          System.out.println(cosn);
          mav.addObject("cosn", cosn);
          mav.setViewName("walk/walkDtl");

         return mav;
     }
     
     @RequestMapping(value = "/walkDtl") 
     public ModelAndView walkDtl(ModelAndView mav) { 
        
        
        mav.setViewName("walk/walkDtl");
        
        return mav; 
     }
    
   
     @RequestMapping(value="/apiwalk", method=RequestMethod.GET, produces = "text/json;charset=UTF-8")
      @ResponseBody
      public String apiwalk(Model model, @RequestParam HashMap<String, String> params,HttpServletRequest request) throws Exception {
           
        ObjectMapper mapper = new ObjectMapper();   //jackson 객체
        Map<String, Object> modelMap = new HashMap<String, Object>();   //데이터를 담을 map
        
        // System.out.println("#params: " + params);
        
        //String search = params.get("searchTxt");
        
        //String search = request.getParameter("searchTxt");
        
        
        
        //System.out.println(request.getParameter("searchTxt"));
        
        final String searchTxt = params.get("searchTxt");
        
        String urlStr = "http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/1/100/";
        if (searchTxt != null && !searchTxt.isEmpty()) {
           //urlStr += (URLEncoder.encode(searchTxt, "utf-8") + "/");
           urlStr += ((searchTxt.replace(" ", "%20")) + "/");
        }
        
        //URL url = new URL("http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/1/13/");

        //ObjectMapper mapper = new ObjectMapper();
        StringBuilder sb = new StringBuilder();
        BufferedReader br;
        
        //List<Map<String, Object>> listMap = new ArrayList<Map<String,Object>>();
        //String searchTxt = request.getParameter("searchTxt");
        //List<HashMap<String, String>> list = request.getParameter(params);
        
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
     
     @RequestMapping(value="/walkapiDtl", method=RequestMethod.GET, produces = "text/json;charset=UTF-8")
     @ResponseBody
     public String walkapiDtl(Model model, @RequestParam("cosn") String cosn) throws Exception {
        //데이터 하나만 가져오기(상세페이지)
        System.out.println("cosn:"+cosn);
        //String urlStr = "http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/"+pageNum+"/"+pageNum+"/";
        //String urlStr = "http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/"+pageNum+"/100/고덕산/고덕중학교/";
        String urlStr = "http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/1/100/"+cosn.replace(" ", "%20")+"/";
        System.out.println("urlStr:"+urlStr);
        
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
              System.out.println("요청실패");
              line = sb.toString();
           }
        } catch (Exception e) {
           System.out.println("catch");
           e.printStackTrace();
           System.out.println(e.getMessage());
           System.err.println(e.toString());
        }
        System.out.println(line);
        return line;
     }     

}