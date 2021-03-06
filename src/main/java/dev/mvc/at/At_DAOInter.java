package dev.mvc.at;

import java.util.HashMap;
import java.util.List;

public interface At_DAOInter {
  
 /** 페이징+검색 리스트
 * 
 * @param hashmap
 * @return
 */
  public List<At_Img> at_img_list(HashMap hashmap);
  
 
  
  
  /** 검색 레코드 수
   *   <select id="search_count" resultType="int" parameterType="HashMap">
   * @param hashmap
   * @return
   */
  public int search_count(HashMap hashmap);
  
  
  /**
   * 전체 레코드 수 
   * <select id="total_count" resultType="int">
   * @return
   */
  public int total_count();
  
  
  /**
   * 조회
   * <select id="read" resultType="At_VO" parameterType="int">
   * @param at_no
   * @return
   */
  public At_VO read(int at_no);
  
  /**
   * 상품등록(At, Dates)
   * @param at_VO
   * @return
   */
  public int create(At_Dates_Img at_Dates_Img);
  
  /**
   * 상품삭제
   * @param at_grp_no
   * @return
   */
  public int delete(int at_no);
  
  /**
   * 상품수정
   * @param at_VO
   * @return
   */
  public int update(At_Dates_Img at_Dates_Img);

}
