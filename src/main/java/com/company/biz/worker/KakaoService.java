package com.company.biz.worker;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Service;

@Service
public class KakaoService {
	
	public String getAccessToken(String code) {
		
		String access_Token="";
		String refresh_Token="";
		URL url;
		HttpURLConnection conn = null;
		
		try {
			url=new URL("https://kauth.kakao.com/oauth/token");
			
		//  URL연결은 입출력에 사용 될 수 있고, POST 혹은 PUT 요청을 하려면 setDoOutput을 true로 설정.
			conn=(HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			 //	POST 요청에 필요로 요구하는 파라미터를 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=063c1cbc4cbf382004e7304670896476"); 
			sb.append("&redirect_uri=http://localhost:8090/login/auth_kakao.do"); 
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
			
			  //보내고 결과 코드 받기 : 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);
			
            BufferedReader br=new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line="";
            String result="";
            while((line = br.readLine()) !=null) {
            	result+=line;
            }
            System.out.println("response body :"+result);
    
            
            JSONParser parser=new JSONParser();
            JSONObject object=(JSONObject) parser.parse(result);
            access_Token=(String) object.get("access_token");
            refresh_Token=(String) object.get("refresh_token");
            System.out.println("######access_Token :"+access_Token);
            System.out.println("######refresh_Token :"+refresh_Token);
            
            br.close();
            bw.close();
            
            
            
            
		} catch (IOException | ParseException e) {
			e.printStackTrace();
		}
		
		return access_Token;
		
	}
	
	public HashMap<String, Object> getUserInfo(String access_Token){
		
		 //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        
            URL url;
			try {
				url = new URL(reqURL);
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");
	            //    요청에 필요한 Header에 포함될 내용
	            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

	            int responseCode = conn.getResponseCode();
	            System.out.println("responseCode : " + responseCode);

	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            System.out.println("response body : " + result);

	            JSONParser parser=new JSONParser();
	            JSONObject object=(JSONObject) parser.parse(result);
	            access_Token=(String) object.get("access_token");
	            
	            JSONObject properties=(JSONObject) object.get("properties");
	            JSONObject kakao_account=(JSONObject) object.get("kakao_account");
	            long kakao_id=(long) object.get("id");
	            System.out.println("###### kakao_id:"+kakao_id);
	            String nickname = (String) properties.get("nickname");
	            String email = (String) kakao_account.get("email");
	            
	            userInfo.put("kakao_id", kakao_id);
	            userInfo.put("accessToken", access_Token);
	            userInfo.put("nickname", nickname);
	            userInfo.put("email", email);

	            
			} catch (IOException | ParseException e) {
				e.printStackTrace();
			}
            
		
		
		return userInfo;
		
	
	}
}
