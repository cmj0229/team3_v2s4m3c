package dev.mvc.surv_item;

import java.util.HashMap;
import java.util.List;

public interface Surv_Item_DAOInter {
  
  /**
   * 설문항목등록
   * @param surv_Item_VO
   * @return
   */
  public int surv_item_create(Surv_Item_VO surv_Item_VO);
  
  
  /**
   * 설문항목 전체목록
   * @return
   */
  public List<Surv_Item_VO> surv_item_list(int surv_no);
  
  /**
   * 설문항목 조회
   * @return
   */
  public Surv_Item_VO surv_item_read(int surv_item_no);
  
  
  /**
   * 설문항목 수정처리
   * @param surv_Item_VO
   * @return 처리된 레코드 갯수
   */
  public int surv_item_update(Surv_Item_VO surv_Item_VO);
  
  /**
   * 설문항목 수정,삭제시 패스워드 체크
   * @param hashMap
   * @return
   */
  public int surv_item_passwd_check(HashMap hashMap);
  
  /**
   * 설문항목 삭제
   * @param surv_item_no
   * @return
   */
  public int surv_item_delete(int surv_item_no);
  
  /**
   * surv + surv_item join 
   * surv_no 에 해당하는 surv_item 읽기
   * @param surv_no
   * @return
   */
  public List<Surv_Surv_Item_VO> surv_read_all(int surv_no);
  
  /**
   * 선택항목
   * @param surv_Item_VO
   * @return
   */
  public int surv_item_response(Surv_Item_VO surv_Item_VO);
  
  /**
   * surv_no에 해당하는 list
   * @param surv_no
   * @return
   */
  public Surv_Surv_Item_VO submit_list(int surv_no);
  
  /**
   * 참여수증가
   * @param surv_item_no
   * @return
   */
  public int surv_item_cnt(int surv_item_no);
}
