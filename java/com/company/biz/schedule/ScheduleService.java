package com.company.biz.schedule;

import java.util.List;

import com.company.biz.paging.PagingVO;

public interface ScheduleService {
	List<ScheduleVO> getScheduleList(ScheduleVO vo);
	
	void insertSchedule(ScheduleVO vo);
	
	void updateSchedule(ScheduleVO vo);

	ScheduleVO getTotalHour(ScheduleVO vo);

	void insertPayInfo(PayInfoVO vo);

	//List<PayInfoVO> getPayInfoList(PayInfoVO vo);

	int countPayInfo(PagingVO vo);

	List<PayInfoVO> selectPayInfo(PagingVO pvo);

	int deletePayInfo(PayInfoVO vo);

}
