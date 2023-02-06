package com.company.view.worker;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.biz.worker.KakaoService;
import com.company.biz.worker.WorkerService;
import com.company.biz.worker.WorkerVO;

@Controller
public class KakaoController {
		
	@Autowired
		KakaoService kakao;
	@Autowired	
	WorkerService workerservice;
	
		@ResponseBody
		@RequestMapping(value="/getKakaoAuthUrl.do")
		public String getKakaoAuthUrl(HttpServletRequest req) {
			
			String reqUrl="https://kauth.kakao.com/oauth/authorize"
					+ "?client_id=063c1cbc4cbf382004e7304670896476"
					+ "&redirect_uri=http://localhost:8090/auth_kakao.do"
					+ "&response_type=code";
			
			return reqUrl;
			}
		
		@RequestMapping(value="/auth_kakao.do", method=RequestMethod.GET)
		public String kakaoOauth(@RequestParam(value = "code", required = false) String code, Model model, WorkerVO vo, HttpSession session) throws Exception {
			System.out.println("#########" + code);
			
			String access_Token = kakao.getAccessToken(code);
	        System.out.println("###access_Token#### : " + access_Token);
			
			HashMap<String, Object> userInfo = kakao.getUserInfo(access_Token);
	        System.out.println("###access_Token#### : " + access_Token);
	        System.out.println("###userInfo email#### : " + userInfo.get("email"));
	        System.out.println("###nickname#### : " + userInfo.get("nickname"));
	        System.out.println("###kakao_id#### : " + userInfo.get("kakao_id"));
	        
	        long kakaoId=(long) userInfo.get("kakao_id");
	        
	        WorkerVO workervo=(WorkerVO)workerservice.getKakaoId(kakaoId);
	        //String worker_id=workervo.getWorker_id();
	        if(workervo==null) {
	        	model.addAttribute("kakaoId", kakaoId);
	        	return "wokerSignUp";
	        }else {
				session.setAttribute("vo", workervo);
				return "redirect:getScheduleList.do";
	        }
		}
}
