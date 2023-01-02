package com.company.view.worker;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.biz.worker.WorkerService;
import com.company.biz.worker.WorkerVO;

@Controller
public class LoginController {
	
	@Autowired
	private WorkerService workerService;
	
	@RequestMapping(value="/login.do",method = RequestMethod.POST)
	public String login(WorkerVO vo, HttpSession session, Model model) {
		System.out.println("로그인 인증 요청." + vo.getWorker_id() + "," + vo.getPwd());
		
		
		if(vo.getWorker_id()==null ||  vo.getWorker_id().equals("")) {
			model.addAttribute("msg", "아이디를 입력하세요");
			return "index";
		}
		if(vo.getPwd()==null ||  vo.getPwd().equals("")) {
			model.addAttribute("id", vo.getWorker_id());
			model.addAttribute("msg1", "비밀번호를 입력하세요");
			return "index";
		}
		//  화면 네비게이션
		if (workerService.getLoginWorker(vo) != null) {
			session.setAttribute("vo", workerService.getLoginWorker(vo));
			return "redirect:getScheduleList.do";
		} else {
			model.addAttribute("msg1", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
			return "index";
		}
	
		
		
		
	@RequestMapping("/logout.do")
	public String logout(HttpSession session) {
		session.invalidate();
		return "index";
	}

}
