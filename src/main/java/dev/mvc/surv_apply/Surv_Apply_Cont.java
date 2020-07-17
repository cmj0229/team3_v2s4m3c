package dev.mvc.surv_apply;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.surv.Surv_ProcInter;
import dev.mvc.surv_item.Surv_Item_ProcInter;

@Controller
public class Surv_Apply_Cont {
	@Autowired
	@Qualifier("dev.mvc.surv_apply.Surv_Apply_Proc")
	
	private Surv_Apply_ProcInter surv_Apply_Proc;
	
	@Autowired
  @Qualifier("dev.mvc.surv.Surv_Proc")
  
  private Surv_ProcInter surv_Proc;
  
  @Autowired
  @Qualifier("dev.mvc.surv_item.Surv_Item_Proc")
  
  private Surv_Item_ProcInter surv_Item_Proc;
  
  public Surv_Apply_Cont() {
    System.out.println("--> Surv_Apply_Cont created");
  }
  
  
  /**
   * surv_no + surv_item_no + surv_apply + mem_no join
   * @param surv_no
   * @return
   */
  @RequestMapping(value="/surv_apply/surv_apply_list.do", method = RequestMethod.GET)
    public ModelAndView surv_apply_list() {
      ModelAndView mav = new ModelAndView();
      
      List<Surv_Item_Apply_VO> surv_apply_list = this.surv_Apply_Proc.surv_apply_list();
      mav.addObject("surv_Item_Apply_list",surv_apply_list);
      
      mav.setViewName("/surv_apply/surv_apply_list");
      return mav;
  }
}
