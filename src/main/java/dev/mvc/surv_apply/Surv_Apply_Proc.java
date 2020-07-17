package dev.mvc.surv_apply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.surv_apply.Surv_Apply_Proc")
public class Surv_Apply_Proc implements Surv_Apply_ProcInter {
@Autowired
 private Surv_Apply_DAOInter surv_Apply_DAO;

@Override
public List<Surv_Item_Apply_VO> surv_apply_list() {
  List<Surv_Item_Apply_VO> surv_apply_list = this.surv_Apply_DAO.surv_apply_list();
  return surv_apply_list;
}
}
