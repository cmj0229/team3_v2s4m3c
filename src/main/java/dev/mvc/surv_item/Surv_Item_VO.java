package dev.mvc.surv_item;

public class Surv_Item_VO {
//  surv_item_no NUMERIC(10) NOT NULL PRIMARY KEY,
//  surv_item_seqno  NUMERIC(10) NOT NULL,
//  surv_item_ans  VARCHAR(1000)  NULL,
//  surv_item_passwd VARCHAR(1000) NOT NULL,
//  surv_item_cnt  NUMERIC(10) NULL, 
//  surv_no NUMERIC(10) NOT NULL,
//  mem_no NUMERIC(10) NOT NULL,
  
  /** �����׸��ȣ*/
  private int surv_item_no;
  
  /** ���������ȣ*/
  private int surv_no;
  
  /** �����׸����*/
  private int surv_item_seqno;
  
  /** �亯 */
  private String surv_item_ans;
  
  /** itemcnt���� */
  private int surv_item_cnt;
  
  /**�����׸� �н�����*/
  private String surv_item_passwd;
  
  /** ȸ����ȣ */
  private int mem_no;
  
  public Surv_Item_VO() {
    
  }


  public int getSurv_item_no() {
    return surv_item_no;
  }


  public void setSurv_item_no(int surv_item_no) {
    this.surv_item_no = surv_item_no;
  }


  public int getSurv_no() {
    return surv_no;
  }


  public void setSurv_no(int surv_no) {
    this.surv_no = surv_no;
  }


  public int getSurv_item_seqno() {
    return surv_item_seqno;
  }


  public void setSurv_item_seqno(int surv_item_seqno) {
    this.surv_item_seqno = surv_item_seqno;
  }


  public String getSurv_item_passwd() {
    return surv_item_passwd;
  }


  public void setSurv_item_passwd(String surv_item_passwd) {
    this.surv_item_passwd = surv_item_passwd;
  }


  public int getSurv_item_cnt() {
    return surv_item_cnt;
  }
  
  
  public void setSurv_item_cnt(int surv_item_cnt) {
    this.surv_item_cnt = surv_item_cnt;
  }


  public String getSurv_item_ans() {
    return surv_item_ans;
  }


  public void setSurv_item_ans(String surv_item_ans) {
    this.surv_item_ans = surv_item_ans;
  }


  public int getMem_no() {
    return mem_no;
  }


  public void setMem_no(int mem_no) {
    this.mem_no = mem_no;
  }
}
