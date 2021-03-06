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
import com.gdj37.seodery.common.bean.PagingBean;
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
     public ModelAndView moveDtl(ModelAndView mav, @RequestParam("cosn") String cosn, @RequestParam("area") String area, @RequestParam("time") String time){
          //var url = "http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/"+pageNum+"/"+pageNum+"/";
          
          System.out.println(cosn);
          mav.addObject("cosn", cosn);
          mav.addObject("area", area);
          mav.addObject("time", time);
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
           
        ObjectMapper mapper = new ObjectMapper();   //jackson ??????
        Map<String, Object> modelMap = new HashMap<String, Object>();   //???????????? ?????? map
        
        int page = Integer.parseInt(params.get("page"));
        
        int cnt = 1000;
        
        PagingBean pb = iPagingService.getPagingBean(page, cnt, 80, 10);
        
        params.put("startCnt", Integer.toString(pb.getStartCount()));
        params.put("endCnt", Integer.toString(pb.getEndCount()));
        
        //final String searchTxt = params.get("searchTxt");
        
        String urlStr = "http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/";
        urlStr += params.get("startCnt") + "/" + params.get("endCnt");
        
        //URL url = new URL("http://openapi.seoul.go.kr:8088/534b517a6f6e617931307348487965/json/SeoulGilWalkCourse/1/13/");  
        StringBuilder sb = new StringBuilder();
        BufferedReader br;           
        
        String line = ""; 

        modelMap.put("pb", pb);
        modelMap.put("page", page);
        
        try {
           
         URL vURL = new URL(urlStr);
          HttpURLConnection con = (HttpURLConnection)vURL.openConnection();
          
          

          //Request Header ??????
          con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");

          //????????????
          con.setRequestMethod("GET");

          //????????? ???????????? Timeout ?????? ??????
          //con.setConnectTimeout(5000);

          //InputStream ?????? ?????? Timeout ?????? ??????
          //con.setReadTimeout(5000); 

          //URLConnection??? ?????? doOutput ???????????? ????????? ????????? ????????????. 
          //URL ????????? ???????????? ????????? ??? ??????. 
          //URL ????????? ??????????????? ??????????????? ?????? DoOutput ???????????? true??? ????????????, 
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
            System.out.println("????????????");
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
        //????????? ????????? ????????????(???????????????)
        //System.out.println("cosn:"+cosn);
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
           
           //Request Header ??????
           con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
           
           //????????????
           con.setRequestMethod("GET");
           
           //????????? ???????????? Timeout ?????? ??????
           //con.setConnectTimeout(5000);
           
           //InputStream ?????? ?????? Timeout ?????? ??????
           //con.setReadTimeout(5000); 
           
           //URLConnection??? ?????? doOutput ???????????? ????????? ????????? ????????????. 
           //URL ????????? ???????????? ????????? ??? ??????. 
           //URL ????????? ??????????????? ??????????????? ?????? DoOutput ???????????? true??? ????????????, 
           con.setDoOutput(true); 
           
           if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
              br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
              //String line;
              while ((line = br.readLine()) != null) {
                 sb.append(line).append("\n");
              }
              br.close();
              
              System.out.println("????????????");
              line = sb.toString();
           } else {
              System.out.println("????????????");
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
     
     @RequestMapping(value="walkadd")
     public ModelAndView walkadd(
          @RequestParam HashMap<String, String> params, HttpServletRequest request,
          ModelAndView mav) throws Throwable {
        
        
        String name = request.getParameter("name");
        
        System.out.println(name);
        
        
        mav.addObject("name", name);
        
        String nmExists = iWalkService.getWalkNmExists(params);
        
        if(nmExists == null || nmExists.equals("N")) {
          // insert(PK)
          int addPK = iWalkService.addWK(params);   
       } else if(nmExists.equals("Y")){ // 'Y'
          int update = iWalkService.updateWK(params);
       }
       int add = iWalkService.addWalk(params);
     
     return mav;
     
}
}