<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>서울 여행</title> <!-- 주소창 타이틀 -->

<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<title></title> 



<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
<script type="text/javascript">
$(function(){
  $('#btn_send').on('click', submit_proc); // click 이벤트 등록
  });
function submit_proc(surv_item_no) {
  var frm_submit = $('#frm_submit');
  frm_submit.attr('action', './submit_proc.do');
  var radioVal = $('input[name="radio"]:checked').val();
/*   alert(radioVal); */
  $('#surv_item_no', frm_submit).val(parseInt(radioVal));
  console.log(typeof(surv_item_no));
  console.log(typeof(surv_no));
  frm_submit.submit();
  alert("제출에 성공하였습니다.")
}
</script>

</head> 

<body>

  <FORM name='frm_submit' id='frm_submit' method='post' action='./submit_list.do'>
    <input type='hidden' name='surv_item_no' id='surv_item_no' value=''>
    <input type='hidden' name='surv_no' id='surv_no' value='${param.surv_no}'>
    <%-- <input type='hidden' name='mem_no' id='mem_no' value='${mem_no}'> --%>

    
  </FORM>


  <DIV id='main_panel'></DIV>

  <DIV class='title_line' style="width:50%;">${surv_VO.surv_title}</DIV>


<TABLE class='table table-hover' >
  <colgroup>
    <col style='width:10%;'/> 
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
  </colgroup>

  <thead>  
  <TR>
    <TH style='text-align: center ;'>번호</TH>
    <TH style='text-align: left ;'>문항</TH>
    <TH style='text-align: center ;'>기타</TH>    
  </TR>
  </thead>
  <c:forEach var="surv_Surv_Item_VO" items="${surv_Surv_Item_VO }">
  <TR>
    <TD style='text-align: center ;'>${surv_Surv_Item_VO.surv_item_VO.surv_item_no}</TD>  
    
    <TD style='text-align: center;'><A href="../choice/list.do?surveyitemno=${surv_item_VO.surv_item_no}"></A></TD>
    
    <TD style='text-align: center ;'>
       <input type="radio"  name='radio' id="radio" value='${surv_item_VO.surv_item_no}'>
      
    </TD>
  </TR>
  </c:forEach> 

</TABLE>
  <button type="button" class="btn btn-info" id="btn_send" name="btn_send()" style="display:block;margin-left:auto;margin-right:auto;width:50%;">제출하기</button>

<jsp:include page="/menu/bottom.jsp" flush='false' /> <!--  bottom 부분 소스분리 -->
</body>
        

</html> 
 