package com.company.view.schedule;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.company.biz.paging.PagingVO;
import com.company.biz.schedule.PayInfoVO;
import com.company.biz.schedule.ScheduleService;
import com.company.biz.schedule.ScheduleVO;
import com.company.biz.worker.WorkerVO;

@Controller
public class SchedulerController {
	
	
	@Autowired
	private ScheduleService scheduleService;
	//각 알바생 선택된 월별 총 시간 매핑
	@ResponseBody
	@RequestMapping(value="/totalHourScheduleAjax.do", method = RequestMethod.POST) 
	public ScheduleVO  totalHourScheduleAjax(@RequestBody ScheduleVO vo, Model model) {
		System.out.println(vo.getWorker_no()+"워커_no////시간계산 컨트롤러 진입////"+vo.getSelectMon()+"월");
		
		ScheduleVO sVO = scheduleService.getTotalHour(vo);
		if (sVO == null) {
			sVO = new ScheduleVO();
		}
		return sVO;
		
	}
	//페이 정보 저장매핑
	@ResponseBody
	@RequestMapping(value="/payInfoAjax.do", method=RequestMethod.POST)
	public boolean addPayInfoAjax(@RequestBody PayInfoVO vo) {
		System.out.println("월급명세서 저장 컨트롤러 진입"+vo.toString());
		scheduleService.insertPayInfo(vo);
		
		return true;
	}
	//페이 정보 * 리스트 불러오기 매핑
	@RequestMapping(value="/getPayInfoList.do")
	public String getPayInfoList(PagingVO vo ,HttpSession session, Model model) {
		System.out.println("페이인포리스트 불러오는 컨트롤러 진입>>>입력된키워드>>>>"+vo.getKeyword());
		//model.addAttribute("payInfoList", scheduleService.getPayInfoList(vo));
		
		WorkerVO sessionvo=(WorkerVO)session.getAttribute("vo");
		int worker_no=sessionvo.getWorker_no();
		
		System.out.println( "no:>>>로그인세션넘버>>>>" + worker_no);
		int nowPage=vo.getNowPage();
		if (nowPage == 0)
			nowPage = 1;
		int cntPerPage=vo.getCntPerPage();
				if(cntPerPage==0) {
					cntPerPage=10;
				}
		vo.setWorker_no(worker_no);
		System.out.println("vo:>>>>" + vo.getWorker_no());
		int total = scheduleService.countPayInfo(vo);
		 
		System.out.println(total+"<<<<<<<토탈");
		PagingVO pvo = new PagingVO(total, nowPage, cntPerPage);
		pvo.setKeyword(vo.getKeyword());
		pvo.setWorker_no(worker_no);
		System.out.println(pvo.toString()+"페이징vo");
		
		model.addAttribute("paging", vo);
		model.addAttribute("paging", pvo);
		model.addAttribute("payInfoList", scheduleService.selectPayInfo(pvo));
		return "schedulePayInfoList";
	}
	@RequestMapping(value="/deletePayInfo.do", method=RequestMethod.GET)
	public String deletePayInfo(PayInfoVO vo) {
		System.out.println("PayInfo삭제 컨트롤러");
		int deletePayInfo=scheduleService.deletePayInfo(vo);
		
		if(deletePayInfo==1)
			System.out.println("삭제됨");
		
		return "redirect:/getPayInfoList.do?nowPage=1";
	}
	
	//등록된 스케즐 * List 매핑
	@RequestMapping("getScheduleList.do")
	public String getScheduleList(ScheduleVO vo, Model model, HttpSession session) {
		System.out.println("getScheduleList");
		model.addAttribute("scheduleList", scheduleService.getScheduleList(vo));
		
		return "main";
	}
	//카카오로 로그인될시
	@RequestMapping("/login/getScheduleList.do")
	public String getScheduleList1(ScheduleVO vo, Model model, HttpSession session) {
		System.out.println("getScheduleList");
		model.addAttribute("scheduleList", scheduleService.getScheduleList(vo));
		
		return "main";
	}
	
	//스케줄등록매핑
	@ResponseBody
    @RequestMapping(value = "/addScheduleAjax.do", method = RequestMethod.POST)
    public boolean addScheduleAjax(@RequestBody ScheduleVO vo) {
		System.out.println("스케줄 등록 컨트롤러");
		scheduleService.insertSchedule(vo);
		
		return true;
    }
	
	//스케줄수정매핑
	@ResponseBody
    @RequestMapping(value = "/scheduleUpdateAjax.do", method = RequestMethod.POST)
	public boolean updateScheduleAjax(@RequestBody ScheduleVO vo) {
		System.out.println("스케줄 수정 컨트롤러");
		scheduleService.updateSchedule(vo);
		
		return true;
		
	}
}
