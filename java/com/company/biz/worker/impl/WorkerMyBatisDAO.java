package com.company.biz.worker.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.company.biz.paging.PagingVO;
import com.company.biz.worker.WorkerVO;

@Repository
public class WorkerMyBatisDAO {
	
	@Autowired
	private SqlSessionTemplate mybatis;
	
	public List<WorkerVO> getWorkerList() {
		return mybatis.selectList("workerDAO.getWorkerList");
	}
	public void insertWorker(WorkerVO vo) {
		mybatis.insert("workerDAO.insertWorker", vo);
	}
	
	public WorkerVO getLoginWorker(WorkerVO vo) {
		System.out.println("mybatis getLoginWorker실행");
		return (WorkerVO)mybatis.selectOne("workerDAO.getLoginWorker", vo);
	}
	public WorkerVO getId(WorkerVO vo) {
		System.out.println("mybatisdao getId실행");
		return mybatis.selectOne("workerDAO.getId", vo);
	}
	public int getIdCheck(WorkerVO vo) {
		System.out.println("mybatisdao IdCheck실행, " + vo.getWorker_id());
		return mybatis.selectOne("workerDAO.getIdCheck", vo);
	}
	public WorkerVO getPwd(WorkerVO vo) {
		System.out.println("mybatisdao getId실행");
		return mybatis.selectOne("workerDAO.getPwd", vo);	
	}
	public int getcountBoard(PagingVO vo) {
		return mybatis.selectOne("workerDAO.getcountBoard", vo);
	}
	public List<WorkerVO> getselectBoard(PagingVO vo) {
		return mybatis.selectList("workerDAO.getselectBoard", vo);
	}
	
}
