﻿<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<!-- header-start -->
<header>
  <div class="header-area ">
    <div id="sticky-header" class="main-header-area">
      <div class="container-fluid">
        <div class="header_bottom_border">
          <div class="row align-items-center">
            <div class="col-xl-2 col-lg-2">
              <div class="logo">
                <a href="index.html"> <img src="${root}/img/logo.png" alt="">
                </a>
              </div>
            </div>
            <div class="col-xl-6 col-lg-6">
              <div class="main-menu  d-none d-lg-block">
                <nav>
                  <ul id="navigation">
                    <li><a class="active" href="${root }">home</a></li>
                    <li><a href='${root }/at_grp/list.do'>상품 <i
                        class="ti-angle-down"></i></a>
                      <ul class="submenu">

                      </ul></li>
                    <li><a href='#'>설문조사 <i
                        class="ti-angle-down"></i></a>
                      <ul class="submenu">
                        <li><a href="${root}/surv/surv_list.do">설문조사</a></li>
                        <li><a href="${root}/surv_item/surv_item_list.do">설문항목</a></li>
                      </ul></li>

                    <li><a
                      href="${root}/cart/at_cart_mem_list.do?mem_no=1">장바구니
                        <i class="ti-angle-down"></i>
                    </a>
                      <ul class="submenu">
                        <li><a href="${root}/cart/create.do">등록</a></li>
                        <li><a
                          href="${root}/cart/at_cart_mem_list.do?mem_no=1">목록</a></li>
                        <li><a href="#">수정</a></li>
                        <li><a href="#">삭제</a></li>
                      </ul></li>


                    <li><a href="#">고객센터 <i
                        class="ti-angle-down"></i>
                    </a>
                      <ul class="submenu">

                        <li><a href="#">1:1문의</a></li>
                        <li><a href="#">자주묻는질문</a></li>

                      </ul></li>


                    <li><a href="contact.html">Contact</a></li>
                  </ul>
                </nav>
              </div>
            </div>
            <div class="col-xl-4 col-lg-4 d-none d-lg-block">
              <div
                class="social_wrap d-flex align-items-center justify-content-end">
               
                <div class="social_links d-none d-xl-block">
                 
         <a href="${root}/mem/create.do">
         <span class="glyphicon glyphicon-user">회원가입</a> / </span>
          <span class="glyphicon glyphicon-log-in">로그인</span>
     
                </div>
              </div>
            </div>
           
            <div class="col-12">
              <div class="mobile_menu d-block d-lg-none"></div>
            </div>
          </div>
        </div>

      </div>
    </div>
  </div>
</header>
<!-- header-end -->