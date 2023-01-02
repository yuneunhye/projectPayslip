package com.company.biz.schedule;

public class PayInfoVO {
	private int seq;
	private int worker_no;
	private String name;
	private int selectMon;
	private int hourlyPay;
	private int totalMin;
	private float tax;
	private int money;
	private int HH;
	private int MM;
	private String salary;
	
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getSalary() {
		return salary;
	}
	public void setSalary(String salary) {
		this.salary = salary;
	}
	public int getHH() {
		return HH;
	}
	public void setHH(int hH) {
		HH = hH;
	}
	public int getMM() {
		return MM;
	}
	public void setMM(int mM) {
		MM = mM;
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
	public int getSelectMon() {
		return selectMon;
	}
	public void setSelectMon(int selectMon) {
		this.selectMon = selectMon;
	}
	public int getHourlyPay() {
		return hourlyPay;
	}
	public void setHourlyPay(int hourlyPay) {
		this.hourlyPay = hourlyPay;
	}
	public int getTotalMin() {
		return totalMin;
	}
	public void setTotalMin(int totalMin) {
		this.totalMin = totalMin;
	}
	public float getTax() {
		return tax;
	}
	public void setTax(float tax) {
		this.tax = tax;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	@Override
	public String toString() {
		return "PayInfoVO [ worker_no=" + worker_no + ", name=" + name + ", selectMon="
				+ selectMon + ", hourlyPay=" + hourlyPay + ", totalMin=" + totalMin + ", tax=" + tax + ", money=" + money
				+ "]";
	}
	
	
}
