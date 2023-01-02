package com.company.biz.schedule.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.company.biz.paging.PagingVO;
import com.company.biz.schedule.PayInfoVO;
import com.company.biz.schedule.ScheduleService;
import com.company.biz.schedule.ScheduleVO;

@Service("ScheduleService")
public class ScheduleServiceImpl implements ScheduleService {
	
	@Autowired
	private MyBatisScheduleDAO myBatisScheduleDAO;

	@Override
	public List<ScheduleVO> getScheduleList(ScheduleVO vo) {
		return myBatisScheduleDAO.getScheduleList(vo);
	}

	@Override
	public void insertSchedule(ScheduleVO vo) {
		myBatisScheduleDAO.insertSchedule(vo);
	}

	@Override
	public void updateSchedule(ScheduleVO vo) {
		myBatisScheduleDAO.updateSchedule(vo);
	}

	@Override
	public ScheduleVO getTotalHour(ScheduleVO vo) {
		return myBatisScheduleDAO.getTotalHour(vo);
	}

	@Override
	public void insertPayInfo(PayInfoVO vo) {
		myBatisScheduleDAO.insertPayInfo(vo);
	}

//	@Override
//	public List<PayInfoVO> getPayInfoList(PayInfoVO vo) {
//		return myBatisScheduleDAO.getPayInfoList(vo);
//	}

	@Override
	public int countPayInfo(PagingVO vo) {
		return myBatisScheduleDAO.getcountPayInfo(vo);
	}

	@Override
	public List<PayInfoVO> selectPayInfo(PagingVO pvo) {
		return myBatisScheduleDAO.getselectPayInfoList(pvo);
	}

	@Override
	public int deletePayInfo(PayInfoVO vo) {
		return myBatisScheduleDAO.deletePayInfo(vo);
	}


}
