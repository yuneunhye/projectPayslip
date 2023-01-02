package com.company.biz.schedule;

public class ScheduleVO {
	private int seq;
	private int worker_no;
	private String name;
	private String work_start_date;
	private String work_end_date;
	private int selectMon;
	private float totalHour;
	private int totalMin;
	
	
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public int getWorker_no() {
		return worker_no;
	}
	public void setWorker_no(int worker_no) {
		this.worker_no = worker_no;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getWork_start_date() {
		return work_start_date;
	}
	public void setWork_start_date(String work_start_date) {
		this.work_start_date = work_start_date;
	}
	public String getWork_end_date() {
		return work_end_date;
	}
	public void setWork_end_date(String work_end_date) {
		this.work_end_date = work_end_date;
	}
	public int getSelectMon() {
		return selectMon;
	}
	public void setSelectMon(int selectMon) {
		this.selectMon = selectMon;
	}
	
	@Override
	public String toString() {
		return "ScheduleVO [seq=" + seq + ", worker_no=" + worker_no + ", name=" + name + ", work_start_date="
				+ work_start_date + ", work_end_date=" + work_end_date + ", selectMon=" + selectMon + "]";
	}
	public float getTotalHour() {
		return totalHour;
	}
	public void setTotalHour(float totalHour) {
		this.totalHour = totalHour;
	}
	public int getTotalMin() {
		return totalMin;
	}
	public void setTotalMin(int totalMin) {
		this.totalMin = totalMin;
	}
}
