package dev.mvc.surv_item;

import dev.mvc.surv.Surv_VO;

/*
  SELECT s.surv_no as s_surv_no, s.surv_title as s_surv_title,
              i.surv_no as i_surv_no, i.SURV_item_SEQNO as surv_item_seqno, i.surv_item_ans as surv_item_ans,
              i.surv_item_cnt as surv_item_cnt, i.surv_item_passwd as surv_item_passwd
    FROM surv s, surv_item i
    WHERE s.surv_no = i.surv_no AND i.surv_no=#{surv_no}
  */
public class Surv_Surv_Item_VO {

  /** 부모테이블 */
  private int s_surv_no;
  private String s_surv_title;
  
  /** 자식테이블 */
  private int surv_no;
  private int surv_item_seqno;
  private String surv_item_ans;
  private int surv_item_cnt;
  private String surv_item_passwd;
  
  public int getS_surv_no() {
    return s_surv_no;
  }
  public void setS_surv_no(int s_surv_no) {
    this.s_surv_no = s_surv_no;
  }
  public String getS_surv_title() {
    return s_surv_title;
  }
  public void setS_surv_title(String s_surv_title) {
    this.s_surv_title = s_surv_title;
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
  public String getSurv_item_ans() {
    return surv_item_ans;
  }
  public void setSurv_item_ans(String surv_item_ans) {
    this.surv_item_ans = surv_item_ans;
  }
  public int getSurv_item_cnt() {
    return surv_item_cnt;
  }
  public void setSurv_item_cnt(int surv_item_cnt) {
    this.surv_item_cnt = surv_item_cnt;
  }
  public String getSurv_item_passwd() {
    return surv_item_passwd;
  }
  public void setSurv_item_passwd(String surv_item_passwd) {
    this.surv_item_passwd = surv_item_passwd;
  }
}
