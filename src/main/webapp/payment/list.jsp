<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="root" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>서울여행</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- <link rel="manifest" href="site.webmanifest"> -->
<link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
<!-- Place favicon.ico in the root directory -->
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- CSS here -->
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link rel="stylesheet" href="../css/owl.carousel.min.css">
<link rel="stylesheet" href="../css/magnific-popup.css">
<link rel="stylesheet" href="../css/font-awesome.min.css">
<link rel="stylesheet" href="../css/themify-icons.css">
<link rel="stylesheet" href="../css/nice-select.css">
<link rel="stylesheet" href="../css/flaticon.css">
<link rel="stylesheet" href="../css/jquery-ui.css">
<link rel="stylesheet" href="../css/gijgo.css">
<link rel="stylesheet" href="../css/animate.css">
<link rel="stylesheet" href="../css/slick.css">
<link rel="stylesheet" href="../css/slicknav.css">

<link rel="stylesheet" href="../css/style.css">
<link rel="stylesheet" href="../css/style_con.css">
<!-- <link rel="stylesheet" href="css/responsive.css"> -->
<script type="text/javascript">
function payment_delete(payment_no){	   

	var confirm_val = confirm("렬루삭제?");

	if(confirm_val){
	   
	  var mem_no = $('#mem_no').val();
	  
	  var params ='mem_no='+mem_no+'&payment_no=' + payment_no ;
	  alert(params); 
	  
	  $.ajax({ 
	    url: './delete.do',
	    type: 'post',  //다른타입은 get
	    cache: false,  //응답결과를 브라우저에 임시저장하냐마냐 (취소 새로운값을 계속받을떈 취소함)
	    async: true, //true: 비동기통신
	    dataType: 'json', //응답형식: json, html, xml ...(응답많은순)
	    data: params, //데이터

	    success: function(data) { // 서버로부터 성공적으로 응답이 온경우
	      // var msg = "";
	      alert ('cnt:' + data.cnt); // 정상적 전달 확인
	      alert ('mem_no:' + data.mem_no); // 정상적 전달 확인
	      
	     if (data.cnt > 0) {
	         alert("삭제?");
	        
	       location.reload();
	       

	      } else {
	        alert("삭제못함");


	      }
	    },
	    // Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
	    error: function(request, status, error) { // callback 함수
	      var msg = 'ERROR<br><br>';
	      msg += '<strong>request.status</strong><br>'+request.status + '<hr>';
	      msg += '<strong>error</strong><br>'+error + '<hr>';
	      console.log(msg);
	    }
	  });
	}else
		return false;

	}
</script>

 

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>
     ♣${memVO.mem_id}님 결제 목록  ༼;´༎ຶ۝༎ຶ༽
  </DIV>
 
  <form name='frm' id='frm'>
        
         <input type='hidden' name='mem_no' id='mem_no' value='${sessionScope.mem_no }'>
         <input type='hidden' name='payment_no' id='payment_no' value='${payment_no }'>
          
                 <c:choose>
        <c:when test="${search_count == 0 }">
          		결제내역이 없습니다.!
           
        </c:when>
        <c:otherwise> 
         
   
         
  <div style='width: 100%; margin-top:50px;' >
  
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
        <col style="width: 20%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>결제번호</th>
          <th style='text-align: center;'>총액</th>
          <th style='text-align: center;'>결제방법</th>
          <th style='text-align: center;'>결제일</th>
          <th style='text-align: center;'>기타</th>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="paymentVO" items="${list }">
        
          <c:set var="payment_no" value="${paymentVO.payment_no }" />
          <c:set var="at_price" value="${paymentVO.at_price }" />
          <c:set var="at_name" value="${paymentVO.at_name }" />
          <c:set var="payment_total" value="${paymentVO.payment_total }" />
          <c:set var="payment_way" value="${paymentVO.payment_way }" />
          <c:set var="payment_date" value="${paymentVO.payment_date }" />
          <c:set var="cart_cnt" value="${paymentVO.cart_cnt }" />
          <c:set var="mem_no" value="${memVO.mem_no }" />
          
          
          <tr> 
           <td style='text-align: center;'> <a href="./read.do?payment_no=${payment_no }">
           ${payment_no } </a> </td>
           
            <td style='text-align: center;'>${payment_total} </td>
            <td style='text-align: center;'>${payment_way }</td>
            <td style='text-align: center;'>${payment_date}</td>
            
                     <td  style='text-align: center;'><button type="button" id='btn_payment_delete_${payment_no }' name='btn_payment_delete_${payment_no }'  class="btn btn-info"
                            onclick="payment_delete(${payment_no})">삭제</button></td>
            

          </tr>
          
               


        </c:forEach>
             
      </tbody>
    </table>
    </div>



        </c:otherwise>
      </c:choose>

 
</form>
  
  <div style='margin-bottom:50px;'>${paging }</div>
  
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
 
 
</html> 
 
 