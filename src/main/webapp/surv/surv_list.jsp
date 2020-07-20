<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.Date" %>
 
<meta charset="UTF-8"> 
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>서울여행</title> <!-- 주소창 타이틀 -->
    <!-- <link href="./css/style.css" rel='Stylesheet' type='text/css'> -->
    <!-- Bootstrap core CSS -->
    <link href=" ${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href=" ${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Plugin CSS -->
    <link href=" ${pageContext.request.contextPath}/resources/vendor/magnific-popup/magnific-popup.css" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href=" ${pageContext.request.contextPath}/resources/css/freelancer.min.css" rel="stylesheet">
   <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

   <!-- Bootstrap -->
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<title></title> 

<link href="../css/style.css" rel="Stylesheet" type="text/css">
<style>

  table {
    width: 700px;
    height: 200px;
    margin-left: auto;
    margin-right: auto;
  }
</style>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    

 
 <body>
 <jsp:include page="/menu/top.jsp" />
 <DIV class='title_line'><h2>설문조사 전체목록</h2></div>
 <div class="cm-title-1 gap-3">
    <h4 class="txt-1">진행 중인 설문조사에 참여해주세요!</h4>
 </div>
  <ASIDE style='float: left;'>
    <A href='../index.jsp'>서울여행</A> > 
    설문조사 전체목록
  </ASIDE>
 <div>
 </div>
  <ASIDE style='float: right;'>
    <A href='./surv_create.do'>등록</A> 
  </ASIDE>

 
 <FORM name='frm_create' id='frm_create' method='POST' action='./surv_list.do'>
    <table class='table'>
    <colgroup>
      <col style="width: 5%;">
      <col style="width: 20%;">
      <col style="width: 20%">
      <col style="width: 20%">
      <col style="width: 10%">
      <col style="width: 5%">
      <col style="width: 20%">
    </colgroup>
    
     <thead>
      <tr style="text-align: center;">
        <th>번호</th>
        <th>제목</th>
        <th>시작일</th>
        <th>종료일</th>
        <th>진행여부</th>
        <th>참여수</th>
        <th>기타</th>
      </tr>
     </thead>
     
     <%-- table 내용 --%>
     <tbody>
     
      <c:forEach var="surv_VO" items="${surv_list }">
        <c:set var="surv_no" value="${surv_VO.surv_no }"/>
        <tr>
          <td>${surv_VO.surv_seqno }</td>
          <td><a href="./surv_read.do?surv_no=${surv_VO.surv_no}">${surv_VO.surv_title }</a></td>
          <td>${surv_VO.surv_startdate.substring(0,10) }</td>
          <td>${surv_VO.surv_enddate.substring(0,10) }</td>
          <td>${surv_VO.surv_continue }</td>
          <td>${surv_VO.surv_cnt }</td>
         
          <c:choose>
            <c:when test="${surv_VO.surv_enddate != surv_item_nowdate }">
              <span class='menu_divide' > | </span> 
                <A href="../surv_item/surv_item_list.do?surv_no=${surv_VO.surv_no }">참여</A>     
            </c:when>
          <c:otherwise>
            <span class='menu_divide' > | </span> 
               <A href="../surv_item/surv_result.do?surv_no=${surv_VO.surv_no }">결과</A>     
          </c:otherwise>
         </c:choose>
          <td>
           <A href="../surv_item/surv_item_list.do?surv_no=${surv_VO.surv_no }">참여</A>/
           <A href="../surv_item/surv_item_create.do?surv_no=${surv_VO.surv_no }">항목등록</A> / 
              <A href="./surv_update.do?surv_no=${surv_no }">수정</A> / 
              <A href="./surv_delete.do?surv_no=${surv_no }">삭제</A> /
              <a href="./update_seqno_up.do?surv_no=${surv_no }">
            <img src="./images/up_image.png"></a>
            <a href="./update_seqno_down.do?surv_no=${surv_no }">
            <img src="./images/down_image.png"></a></td>
      </c:forEach>
     </tbody>
     
  </table>
  </FORM>
  </div>
</body>
</html>