package dev.mvc.surv_apply;

import java.util.List;

public interface Surv_Apply_ProcInter {

  /**
   * surv_no + surv_item_no + surv_apply + mem_no join
   * @param surv_no
   * @return
   */
  public List<Surv_Item_Apply_VO> surv_apply_list();
}
