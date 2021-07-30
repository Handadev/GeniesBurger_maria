<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="https://kit.fontawesome.com/807b312a13.js" crossorigin="anonymous"></script>
<style>
body{
	background-color:#F1EAE5;
}
.fa{
    font-size: 150px;
}
.div_a{
    width: 20%;
    float: left;
    margin-top:50px;
} 
.iconAtag{
 	color:black;
}
.couponI{
	cursor:pointer;
}
.couponI:hover{
	color:red;
}
#modal-body{
	font-size:2.3em;
}
.title_member{
	font-size:3.5em;
}
.title_member2{
	font-size:2.5em;
}
.icon_p{
	font-size:2.0em;
}
h1{
	font-size:3.5em;
}
</style>
<div class="container p-3 my-5" style="text-align: center; height:600px; background-color:#ffffff;">
<p class="title_member"><b>MY PAGE</b></p>
<p class="title_member2"><strong style="color:#e31212">${ses.name }</strong> 님 환영합니다.<p>
<hr>
      <div class="div_a"><a class="iconAtag" href="/member/modify?mno=${ses.mno }"><i class="fa fa-info"></i><p class="icon_p">정보변경</p></a></div>
      <div class="div_a"><a class="iconAtag" href="/review/myReview?email=${ses.email }"><i class="fa fa-edit"></i><p class="icon_p">나의리뷰</p></a></div>
      <div class="div_a"><a class="iconAtag" href="/cart/purchaseListMember?mno=${ses.mno }"><i class="fa fa-list"></i><p class="icon_p">주문내역</p></a></div>
      <div class="div_a"><a class="iconAtag" href="/cart/cart?mno=${ses.mno }"><i class="fa fa-shopping-cart"></i><p class="icon_p">장바구니</p></a></div>
      <div class="div_a"><a class="iconAtag" href="#"><i class="fa fa-file" data-toggle="modal" data-target="#couponDiv"></i><p class="icon_p">쿠폰:${myCpList.size() }장</p></a></div>
</div>

<!-- Modal -->
   <div class="container" style="text-align:center;">
       <!-- Modal -->
    <div class="modal fade" id="couponDiv">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
        
          <!-- Modal Header -->
          <div class="modal-header" style="margin:auto; border:none;">
            	<p style="font-size:3em;">나의 쿠폰 목록</p>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <div class="modal-select">
              <select name="myCp" id="myCp" class="form-control">
				<option value="">나의 쿠폰 목록</option>
					<c:forEach items="${myCpList }" var="list">
					<option value="${list.cpname }">${list.cpname } (${list.enddate }까지)</option>
					</c:forEach>
  				</select>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
<jsp:include page="../common/footer.jsp" />

    