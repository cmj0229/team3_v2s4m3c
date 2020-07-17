package dev.mvc.surv_item;

import java.util.HashMap;
import java.util.List;

public interface Surv_Item_ProcInter {
  
  /**
   * �����׸���
   * @param surv_Item_VO
   * @return
   */
  public int surv_item_create(Surv_Item_VO surv_Item_VO);
  
  /**
   * �����׸� ��ü���
   * @return
   */
  public List<Surv_Item_VO> surv_item_list(int surv_no);
  
  /**
   * �����׸� ��ȸ
   * @return
   */
  public Surv_Item_VO surv_item_read(int surv_item_no);
  
  
  /**
   * �����׸� ���� ��
   * @param surv_item_no
   * @return
   */
  public Surv_Item_VO surv_item_update(int surv_item_no);
  
  
  /**
   * �����׸� ����ó��
   * @param surv_Item_VO
   * @return ó���� ���ڵ� ����
   */
  public int surv_item_update(Surv_Item_VO surv_Item_VO);
  
  /**
   * �����׸� ����,������ �н����� üũ
   * @param hashMap
   * @return
   */
  public int surv_item_passwd_check(HashMap hashMap);
  
  /**
   * �����׸� ����
   * @param surv_item_no
   * @return
   */
  public int surv_item_delete(int surv_item_no);
  
  /**
   * surv + surv_item join 
   * surv_no �� �ش��ϴ� surv_item �б�
   * @param surv_no
   * @return
   */
  public List<Surv_Surv_Item_VO> surv_read_all(int surv_no);
  
  /**
   * �����׸�
   * @param surv_Item_VO
   * @return
   */
  public int surv_item_response(Surv_Item_VO surv_Item_VO);
  
  /**
   * surv_no�� �ش��ϴ� list
   * @param surv_no
   * @return
   */
  public Surv_Surv_Item_VO submit_list(int surv_no);
  
  /**
   * ����������
   * @param surv_item_no
   * @return
   */
  public int surv_item_cnt(int surv_item_no);
}
