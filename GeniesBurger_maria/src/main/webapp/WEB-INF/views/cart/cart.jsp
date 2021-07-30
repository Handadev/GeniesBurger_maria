<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<style>
.modal {
	min-width: 100%;
	min-height: 100%;
}

.modal-title {
	margin: auto;
}

.modal-body {
	text-align: center;
}

.modal-img {
	margin: 10px;
}

.checkBtn {
	margin-top: 15px;
	width: 90%;
}

.modal-select {
	width: 50%;
	margin: 0;
	padding: 0;
	float: left;
}

.modal-select:active {
	color: #ff0000;
}

.img {
	width: 120px;
	height: 120px;
}

.btn-center-div {
	text-align: center;
	margin: auto;
}

.downQtyBtn, .upQtyBtn {
	width: 30px;
}

.box {
	-webkit-box-shadow: 5px 6px 3px -7px rgba(0, 0, 0, 0.83);
	box-shadow: 5px 6px 3px -7px rgba(0, 0, 0, 0.83);
}
.redFont{
	color:#e31212;
}
</style>

<section class="ftco-section ftco-cart" style="background-color: #F1EAE5;">
	<c:choose>
		<c:when
			test="${cartList[0].title eq null || cartList[0].title eq  '' }">
			<img src="/resources/icons/nolist_logo.png"
				style="width: 350px; display: block; margin: auto; margin-top: 50px;">
		</c:when>
		<c:otherwise>
			<div class="container">
				<div class="row">
					<div class="col-md-12 ftco-animate">
						<table class="table box">
							<thead class="thead-primary">
								<!-- 결론! 장바구니가 비어있어도 cartList : not null -->
								<tr class="text-center">
									<th>상품</th>
									<th>사이드 메뉴</th>
									<th>가격</th>
									<th>수량</th>
									<th>&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${cartList }" var="cartList">
									<tr class="text-center">
										<td class="image-prod"><img class="img"
											src="/upload/${cartList.savedir }/${cartList.puuid}_${cartList.fname}"
											alt="display none" style="width: 240px; height:180px;">
											<h2>${cartList.title }</h2> 
											<h3>₩<fmt:formatNumber value="${cartList.quantity * (cartList.price) }" pattern="#,###" /></h3>
											</td>
										<td class="product-name">
											<c:forEach items="${cartList.aelist }" var="aevo">
												<h5>${aevo.title }</h5>
												<h5>${aevo.sname }</h5>
											</c:forEach>
										</td>
										<c:set var="unitTotalPrice" value="0" />
										<c:forEach items="${cartList.aelist }" var="aevo">
											<c:set var="unitTotalPrice" value="${unitTotalPrice + (aevo.price * aevo.quantity)}" />
											<c:set var="unitTotalPrice2" value="${unitTotalPrice2 + (aevo.price * aevo.quantity)}" />
										</c:forEach>
										<td class="price">
										<c:forEach items="${cartList.aelist }" var="aevo">
										<h5>₩<fmt:formatNumber value="${cartList.quantity * (aevo.price) }" pattern="#,###" /></h5>
										</c:forEach>
										</td>
										<td class="quantity">
											<div class="btn-center-div">
												<button type="button"
													class="btn-sm btn-outline-danger downQtyBtn"
													data-downqty="${cartList.cartno }" data-down="-1"
													data-qtydata="${cartList.quantity }">▽</button>
												&nbsp;&nbsp; <span class="qtyclass">${cartList.quantity }</span>
												&nbsp;&nbsp;
												<button type="button"
													class="btn-sm btn-outline-danger upQtyBtn"
													data-upqty="${cartList.cartno }" data-up="1">△</button>
											</div>
										</td>
										<td class="product-remove">
											<button type="button"
												class="btn-sm btn-danger removeBtn detailBtn"
												style="width: 50px;" data-cartno="${cartList.cartno }">삭제
											</button>
										</td>
									</tr>
									<tr>
								</c:forEach>
							</tbody>
						</table>
						<div
							style="font-size: 2em; margin-top: 30px; text-align: center; width: 100%">
							<c:set var="sum" value="0" />
							<c:set var="sum2" value="0" />
							<c:forEach items="${cartList }" var="cartList">
								<c:set var="sum" value="${sum + (cartList.price * cartList.quantity)}" />
								<c:set var="sum2" value="${sum2 + (unitTotalPrice2 * cartList.quantity)}" />
							</c:forEach>
							총 주문금액 :
							<fmt:formatNumber value="${sum + unitTotalPrice2 }" pattern="#,###" />원 <br>
							<button type="button" class="btn-lg btn-danger"
								style="width: 280px" data-toggle="modal" data-target="#orderBtn">
								결제하기</button>
						</div>
					</div>
				</div>
			</div>
<script>
$(".ftco-cart").css("background-color", "white");
</script>
		</c:otherwise>
	</c:choose>
</section>

<fmt:formatNumber value="${money}" pattern="#,###" />

<!-- Modal -->
   <div class="container">
       <!-- Modal -->
    <div class="modal fade" id="orderBtn">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

          <!-- Modal Header -->
          <div class="modal-header">
            <h4 class="modal-title">선택해주세요</h4>
          </div>

          <!-- Modal body -->
          <div class="modal-body">
            <div class="modal-select" id="background1">
               <div id="check1" style="position: absolute;"></div>
              <img src="/resources/icons/for_here.jpg" style="width:200px; height:200px;" class="modal-img" />
              <p><b>매장식사</b></p>
            </div>
            <div class="modal-select" id="background2">
               <div id="check2" style="position: absolute;"></div>
            <img src="/resources/icons/to_go.jpg" style="width:200px; height:200px;" class="modal-img" />
            <p><b>포장주문</b></p>
            </div>
             <a class="btn btn-dark checkBtn" style="color: white; ">확인</a>
            <!-- <button type="button" class="btn btn-dark checkBtn">확인</button> -->
          </div>
        </div>
      </div>
    </div>
  </div>


<!-- Modal 이미지 겹치기 스크립트 -->
<script>
let check = false;
$(document).on("click", "#background1", function() {
   let html = "<div style='position: relative; top: 50px; left:50px;'><img src='/resources/icons/check.png' style='width:150px'/></div>";
   $("#check1").html(html);
   $("#check2").html("");
   check = true;
});

$(document).on("click", "#background2", function() {
   let html = "<div style='position: relative; top: 50px; left:50px;'><img src='/resources/icons/check.png' style='width:150px'/></div>";
   $("#check2").html(html);
   $("#check1").html("");
   check = true;
});
$(document).on("click",".checkBtn",function() {
	   if(check == true) {
	      $(".checkBtn").attr("href", '/cart/payment?mno='+${ses.mno });
	   } else {
	      alert("하나를 선택해주세요!");
	   }
	});
</script>

<!-- 삭제 스크립트 -->
<script>
   $(document).on("click", ".removeBtn", function() {
      console.log(this);
      let cartno_val = $(this).data("cartno");
      console.log("cartno_val : " + cartno_val);
      remove_cart(cartno_val);
   });

   function remove_cart(cartno) {
      $.ajax({
         url : "/cart/" + cartno,
         type : "delete"
      }).done(function(result) {
         location.reload();
      }).fail(function(err) {
         location.reload();
      });
   }
</script>
<!-- 결제 스크립트 -->
<script>
   $("#orderBtn").on("click", function() {
      console.log(this);
   })
</script>
<!-- Quantity 스크립트 -->
<script>
/* 수량 감소 */
$(document).on("click", ".downQtyBtn", function(e) {
   console.log(this);
   let downqty_val = $(this).data("downqty");
   let downqty_val2 = $(this).data("down");
   let qtyData = $(this).data("qtydata");
   console.log("qtyData : " + qtyData);
   console.log("downqty_val : " + downqty_val);
   console.log("downqty_val2 : " + downqty_val2);
   if(qtyData == 1){
      alert("더 이상 감소가 불가능합니다.");
   }else{
   downqty_cart(downqty_val, downqty_val2);
   }
});
function downqty_cart(downqty, downqty2) {
   $.ajax({
      url : "/cart/" + downqty,
      type : "post",
      data : {
         downqty_key : downqty2
      }
   }).done(function(result) {
      location.reload();
   }).fail(function(err) {
      location.reload();
   });
}

   /* 수량 증가 */
   $(document).on("click", ".upQtyBtn", function(e) {
      console.log(this);
      let upqty_val = $(this).data("upqty");
      let upqty_val2 = $(this).data("up");
      let qtyData = $(".qtyclass").data("qtydata");
      console.log("qtyData : " + qtyData);
      console.log("Upcartno_val : " + upqty_val);
      console.log("Upcartno_val2 : " + upqty_val2);
      upqty_cart(upqty_val, upqty_val2);
   });
   function upqty_cart(upqty, upqty2) {
      $.ajax({
         url : "/cart/" + upqty,
         type : "post",
         data : {
            upqty_key : upqty2
         }
      }).done(function(result) {
         location.reload();
      }).fail(function(err) {
         location.reload();
      });
   }
   
</script>

<jsp:include page="../common/footer.jsp" />