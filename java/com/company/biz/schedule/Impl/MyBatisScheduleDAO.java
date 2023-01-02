package com.company.biz.schedule.Impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.biz.paging.PagingVO;
import com.company.biz.schedule.PayInfoVO;
import com.company.biz.schedule.ScheduleVO;

@Repository
public class MyBatisScheduleDAO {
	
	@Autowired
	private SqlSessionTemplate myBatisScheduleDAO;

	public List<ScheduleVO> getScheduleList(ScheduleVO vo) {
		System.out.println("mybatis getScheduleList 실행");
		return myBatisScheduleDAO.selectList("myBatisScheduleDAO.getScheduleList",vo);
	}
	
	public void insertSchedule(ScheduleVO vo) {
		myBatisScheduleDAO.insert("myBatisScheduleDAO.insertSchedule", vo);
	}
	
	public void  updateSchedule(ScheduleVO vo) {
		myBatisScheduleDAO.update("myBatisScheduleDAO.updateSchedule", vo);
	}

	public ScheduleVO getTotalHour(ScheduleVO vo) {
		return myBatisScheduleDAO.selectOne("myBatisScheduleDAO.getTotalHour", vo);
	}

	public void insertPayInfo(PayInfoVO vo) {
		myBatisScheduleDAO.insert("myBatisScheduleDAO.insertPayInfo", vo);
	}

//	public List<PayInfoVO> getPayInfoList(PayInfoVO vo) {
//		return myBatisScheduleDAO.selectList("myBatisScheduleDAO.getPayInfoList", vo);
//	}

	public int getcountPayInfo(PagingVO vo) {
		return myBatisScheduleDAO.selectOne("myBatisScheduleDAO.getcountPayInfo",vo);
	}

	public List<PayInfoVO> getselectPayInfoList(PagingVO pvo) {
		return myBatisScheduleDAO.selectList("myBatisScheduleDAO.getselectPayInfo",pvo);
	}

	public int deletePayInfo(PayInfoVO vo) {
		return myBatisScheduleDAO.delete("myBatisScheduleDAO.deletePayInfo",vo);
	}

	
	
}
