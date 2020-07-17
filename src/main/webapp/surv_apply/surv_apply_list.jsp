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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    
<script type="text/javascript">

</script>

</head> 

<body>
<c:import url="/menu/top.jsp" /> <!--  top 부분 소스분리 -->
<DIV class='container' style='width:80%; margin:0px auto; text-align: center; margin-top: 5%; margin-bottom:5%' >

<DIV class='content'>

  <DIV id='main_panel'></DIV>

  <DIV class='title_line'>
   <aside style="float: center; font-weight: bold; font-size:35px; ">참여자 목록</aside>
  </DIV>
  

<TABLE class='table table-hover' >
  <colgroup>
    <col style='width:10%;'/> 
    <col style='width: 10%;'/> 
    <col style='width: 20%;'/>
    <col style='width: 20%;'/>
  </colgroup>

  <thead>  
  <TR>
    <TH style='text-align: center ;'>번호</TH>
    <TH style='text-align: left ;'>회원 id</TH>
    <TH style='text-align: left ;'>회원 이름</TH>
    <TH style='text-align: center ;'>설문조사 제목</TH>    
    <TH style='text-align: center ;'>응답한 답</TH> 
  </TR>
  </thead>
  <c:forEach var="Surv_Item_Apply_VO" items="${surv_apply_list }">
   <c:set var="surv_apply_no" value="${Surv_Item_Apply_VO.surv_apply_no }"/>
   <c:set var="mem_id" value="${Surv_Item_Apply_VO.mem_id }"/>
   <c:set var="mem_name" value="${Surv_Item_Apply_VO.mem_name }"/>
   <c:set var="surv_title" value="${Surv_Item_Apply_VO.surv_title }"/>
   <c:set var="surv_item_ans" value="${Surv_Item_Apply_VO.surv_item_ans }"/>
  <TR>
    <TD style='text-align: center ;'>${surv_apply_no}</TD>  
    <TD style='text-align: center ;'>${mem_id}</TD>  
    <TD style='text-align: center ;'>${mem_name}</TD>  
    <TD style='text-align: center ;'>${surv_title}</TD>  
    <TD style='text-align: center ;'>${surv_item_ans}</TD>  
  </TR>
  </c:forEach> 

</TABLE>
  
</DIV> <!-- content END -->

</DIV> <!-- container END -->
<jsp:include page="/menu/bottom.jsp" flush='false' /> <!--  bottom 부분 소스분리 -->
</body>
        

</html> 