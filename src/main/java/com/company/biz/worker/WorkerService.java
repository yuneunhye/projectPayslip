package com.company.biz.worker;

import java.util.List;

import com.company.biz.paging.PagingVO;

public interface WorkerService {

	WorkerVO getLoginWorker(WorkerVO vo);
	
	List<WorkerVO> getWorkerList();

	void insertWorker(WorkerVO vo);
	
	WorkerVO getId(WorkerVO vo);

	WorkerVO getPwd(WorkerVO vo);
	//페이징
	int countBoard(PagingVO vo);

	// 페이징 처리 게시글 조회
	List<WorkerVO> selectBoard(PagingVO vo);
	//아이디 중복 체크
	int getIdCheck(WorkerVO vo);

}