<%@ page contentType="text/html; charset=UTF-8" %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value="${pageContext.request.contextPath}" /> 

<DIV class='container-fluid'  style="width:95%; margin-bottom:100px;">

      <!-- 상단메뉴 -->
<nav class="navbar-default navbar-fixed-top"  >
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="${root }">서율서율</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li><a href="${root }"><span class="glyphicon glyphicon-home"></span></a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">상품 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">여행지</a></li>
            <li><a href="#">숙박</a></li>
            <li><a href="#">맛집</a></li>
            <li><a href="#">훔ㅁㅁ</a></li>
          </ul>
        </li>
        <li><a href="#">설문조사</a></li>
        
         <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="${root}/cart/at_cart_mem_list.do?mem_no=1">장바구니 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="${root}/cart/create.do">등록</a></li>
            <li><a href="${root}/cart/at_cart_mem_list.do?mem_no=1">목록</a></li>
            <li><a href="#">수정</a></li>
            <li><a href="#">삭제</a></li>
          </ul>
        </li>
        
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">고객센터 <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">1:1문의</a></li>
            <li><a href="#">자주묻는질문</a></li>
          </ul>
        </li>
       
      </ul>
      <ul class="nav navbar-nav navbar-right">
         <a href="${root}/mem/create.do"  style="text-decoration:none;">
         <span class="glyphicon glyphicon-user" style="font-size:14px; margin-top:16px; ">
          회원가입</a> / 
          </span>
          <span class="glyphicon glyphicon-log-in"  style="font-size:14px; margin-top:16px; margin-right:10px;"> 로그인</span>
      </ul>
    </div>
  </div>
</nav>
