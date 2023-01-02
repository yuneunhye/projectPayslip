package com.company.view.worker;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.biz.paging.PagingVO;
import com.company.biz.worker.WorkerService;
import com.company.biz.worker.WorkerVO;

@Controller
public class WorkerController {
	@Autowired
	private WorkerService workerService;
	//페이징
	@RequestMapping(value="/getWorkerList.do",method = RequestMethod.GET)
	public String getWorkerList(PagingVO vo, Model model) {
		System.out.println("get워크리스트 컨트롤러 진입"+vo.toString());
		
		int nowPage=vo.getNowPage();
		int cntPerPage=vo.getCntPerPage();
				if(cntPerPage==0) {
					cntPerPage=10;
				}
		int total = workerService.countBoard(vo);
		System.out.println(total+"토탈");
		vo = new PagingVO(total, nowPage, cntPerPage);
		System.out.println(vo.toString()+"페이징vo");
		model.addAttribute("paging", vo);
		model.addAttribute("workerList", workerService.selectBoard(vo));
		
		
		
		return "workerList";

	}
	
	//회원가입
	@ResponseBody
    @RequestMapping(value = "/addWorkerAjax.do", method = RequestMethod.POST)
    public boolean addWorkerAjax(@RequestBody WorkerVO vo) {
		
		workerService.insertWorker(vo);
		
		return true;
    }
		
	    // 아이디 찾기 실행
		@RequestMapping(value="find_id.do", method=RequestMethod.POST)
		public String getId(WorkerVO vo, Model model) {
			System.out.println("getId controller");
			WorkerVO worker = workerService.getId(vo);
			System.out.println(worker);
			if(worker == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("id", worker.getWorker_id());
			}
			
			return "workerGetId";
		}
		//비밀번호 찾기
		@RequestMapping(value="find_password.do", method=RequestMethod.POST)
		public String findPasswordAction(WorkerVO vo, Model model) {
			WorkerVO worker = workerService.getPwd(vo);
			
			if(worker == null) { 
				model.addAttribute("check", 1);
			} else { 
				model.addAttribute("check", 0);
				model.addAttribute("pwd", worker.getPwd());
			}
			
			return "workerGetPwd";
		}
		//아이디 중복확인
		@ResponseBody
		@RequestMapping(value="/IdCheckService.do",method= {RequestMethod.GET, RequestMethod.POST})
		public int idCheckService(@RequestParam String worker_id) {
			
			System.out.println(worker_id+"IdCheckService 컨트롤러 진입");
			WorkerVO vo=new WorkerVO();
			vo.setWorker_id(worker_id);
			int result=workerService.getIdCheck(vo);
			System.out.println(result+"아이디 조회 여부");
			return result;
			}
		
}
