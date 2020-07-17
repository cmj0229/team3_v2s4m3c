package dev.mvc.surv_apply;

public class Surv_Apply_VO {
//	surv_apply_no                NUMBER(10) NOT NULL PRIMARY KEY,
//    surv_item_no                  NUMBER(10) NULL ,
//    mem_no                           NUMBER(6) NULL ,
//    surv_apply_date                         DATE NOT NULL,
	
	private int surv_apply_no;
	private int surv_item_no;
	private int mem_no;
	private String surv_apply_date;
	
	
	public int getSurv_apply_no() {
		return surv_apply_no;
	}
	public void setSurv_apply_no(int surv_apply_no) {
		this.surv_apply_no = surv_apply_no;
	}
	public int getSurv_item_no() {
		return surv_item_no;
	}
	public void setSurv_item_no(int surv_item_no) {
		this.surv_item_no = surv_item_no;
	}
	public int getMem_no() {
		return mem_no;
	}
	public void setMem_no(int mem_no) {
		this.mem_no = mem_no;
	}
	public String getSurv_apply_date() {
		return surv_apply_date;
	}
	public void setSurv_apply_date(String surv_apply_date) {
		this.surv_apply_date = surv_apply_date;
	}
	
	
}
