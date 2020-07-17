package dev.mvc.surv_apply;

public class Surv_Item_Apply_VO {
//  SELECT i.surv_item_no as i_surv_item_no, i.surv_item_ans as i_surv_item_ans,
//  m.mem_id as m_mem_id, m.mem_name as m_mem_name, m.mem_no as m_mem_no,
//  a.surv_apply_no as surv_apply_no, a.surv_item_no as surv_item_no, a.mem_no as mem_no, a.surv_apply_date as surv_apply_date,
//  s.surv_no as s_surv_no, s.surv_title as s_surv_title
//FROM surv_item i, mem m, surv_apply a, surv s
//WHERE a.surv_item_no = i.surv_item_no and a.mem_no = m.mem_no and a.surv_no=s.surv_no and s.surv_no=1;

// surv table
  private int s_surv_no;
  private String s_surv_title;
  
// surv_item table
  private int i_surv_item_no;
  private String i_surv_item_ans;
  
// mem table
  private String m_mem_id;
  private String m_mem_name;
  private int m_mem_no;
  
// surv_apply table
  private int surv_apply_no;
  private int surv_item_no;
  private int mem_no;
  private String surv_apply_date;
  
  
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
  public int getI_surv_item_no() {
    return i_surv_item_no;
  }
  public void setI_surv_item_no(int i_surv_item_no) {
    this.i_surv_item_no = i_surv_item_no;
  }
  public String getI_surv_item_ans() {
    return i_surv_item_ans;
  }
  public void setI_surv_item_ans(String i_surv_item_ans) {
    this.i_surv_item_ans = i_surv_item_ans;
  }
  public String getM_mem_id() {
    return m_mem_id;
  }
  public void setM_mem_id(String m_mem_id) {
    this.m_mem_id = m_mem_id;
  }
  public String getM_mem_name() {
    return m_mem_name;
  }
  public void setM_mem_name(String m_mem_name) {
    this.m_mem_name = m_mem_name;
  }
  public int getM_mem_no() {
    return m_mem_no;
  }
  public void setM_mem_no(int m_mem_no) {
    this.m_mem_no = m_mem_no;
  }
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
