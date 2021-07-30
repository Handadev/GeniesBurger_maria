<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="common/header.jsp" />
<style>
.form-control {
	width: 80%;
}

.product_div {
	cursor: pointer;
}

.modal {
	text-align: center;
}

@media screen and (min-width: 768px) {
	.modal:before {
		display: inline-block;
		vertical-align: middle;
		content: " ";
		height: 100%;
	}
}

#menu-strong {
	font-size: 2em;
	color: black;
}

.product-category {
	margin-top: 20px;
}

.modal-dialog {
	display: inline-block;
	text-align: left;
	vertical-align: middle;
	width: 100%;
}

.product-text {
	padding-top: 30px;
}

#title, #price {
	font-size: 25px;
}

#title, #content {
	color: black;
}

#content {
	font-size: 20px;
}

#price {
	color: red;
}

.menuselect {
	cursor: pointer;
}

.con_modal_footer {
	height: 60px;
}

.row {
	height: 100%;
}

.footer_btn {
	padding-top: 10px;
	cursor: pointer;
}

#button_text {
	color: white;
	font-size: 25px;
	text-align: center;
}

#indexSearch {
	margin-top: 5px;
	margin-right: 25px;
}

/* 3번 체크 박스 */
.checkbox.row {
	position: relative;
	margin-bottom: 65px;
	cursor: pointer;
}

.checkbox.row:first-child {
	margin-top: 15px;
}

.checkbox.row:last-child {
	margin-bottom: 30px;
}

.checkText {
	font-size: 25px;
}

.check_price {
	position: absolute;
	font-size: 25px;
    top: -11px;
    right: 9%;
}

.checkbox input.checkbox {
	font-size: 1em;
	width: 1.5em; /* 너비 설정 */
	height: 1.5em; /* 높이 설정 */
	vertical-align: middle;
}

.checkbox input.checkbox+label { /* 라벨 텍스트 크기와 수직 정렬 맞춤 */
	font-size: 1.7em;
	vertical-align: middle;
	cursor: pointer;
}

.check_label {
	position: absolute;
	top: -12px;
	left: 45%;
}

.extra_img { /* 추가 재료 이미지 */
	position: absolute;
	top: -25px;
    left: 13%;
}

/* 4번 체크 박스  */
.side {
	font-size: 19px;
}

.side.top {
	margin-top: 10px;
	margin-bottom: -10px;
}

.side.bottom {
	margin-bottom: 10px;
}
.price{
color:#e31212;
}
.product_div:hover{
color:#f74f4f;
}
/* .product_div{
cursor: pointer;
-webkit-box-shadow: 5px 6px 3px -7px rgba(0,0,0,0.83); 
box-shadow: 5px 6px 3px -7px rgba(0,0,0,0.83);
} */
</style>

<!-- 메뉴 상단이미지 삭제 -->
<section class="ftco-section">
	<div class="container">
		<!-- 상품 분류 선택 -->
		<div class="row justify-content-center">
			<div class="col-md-10 mb-5 text-center float-left">
				<strong id="menu-strong">메뉴</strong>
				<ul class="product-category">
					<li><a href="/" class="total">전체</a></li>
					<li><a href="/?range=category&keyword=1" class="burger">버거</a></li>
					<li><a href="/?range=category&keyword=2" class="set">버거세트</a></li>
					<li><a href="/?range=category&keyword=4" class="allday">올데이킹</a></li>
					<li><a href="/?range=category&keyword=7" class="sides">사이드</a></li>
					<li><a href="/?range=category&keyword=8" class="beverage">음료</a></li>
				</ul>
				<form action="/">
					<input type="hidden" name="range" value="pro"> <input
						class="form-control float-left" type="text"
						placeholder="찾으시는 제품명을 입력하세요" name="keyword">
					<button type="submit" class="btn-lg btn-danger"
						style="margin-right: 100px;">검색</button>
				</form>
			</div>
		</div>

		<!-- 상품 분류 선택 끝-->
		<!-- 상품 전체 -->
		<div class="row">
			<!-- 상품 프레임 -->
			<c:choose>
				<c:when test="${product_list.size() ne 0 }">
					<c:forEach items="${product_list }" var="pvo">
						<div class="col-md-6 col-lg-3 ftco-animate product_div">
							<div class="product" data-toggle="modal"
								data-target="#sigle_set_modal" id="product"
								data-pno="${pvo.pno }" data-category="${pvo.category }">
								<c:forEach items="${pvo.flist }" var="fvo">
									<c:choose>
										<c:when test="${pvo.cansale eq 0 }">
											<img class="img-fluid"
												src="/upload/${fvo.savedir }/${fvo.puuid }_th_${fvo.fname }"
												alt="Colorlib Template" />
										</c:when>
										<c:otherwise>
											<div><img class="img-fluid" src="/resources/icons/soldout.png" width="250" height="150" alt="" style="position: absolute;"/></div>
											<img class="img-fluid"
												src="/upload/${fvo.savedir }/${fvo.puuid }_th_${fvo.fname }"
												alt="" />
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<!-- 할인 혹은 new 혹은 best 들어가는 공간  <span class="status">할인/new/best</span> -->
								<div class="overlay"></div>
								<div class="text py-3 pb-4 px-3 text-center">
									<h3>${pvo.title }</h3>
									<div class="d-flex">
										<div class="pricing">
											<p class="price">
												<span class="mr-2 price"><fmt:formatNumber value="${pvo.price }" pattern="#,###"/></span>
											</p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
				</c:otherwise>
			</c:choose>

			<!-- 상품 프레임 끝 -->
		</div>
		<!-- 상품 전체 끝 -->
		<!-- 상품 페이저 -->
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<c:if test="${product_paging.prev }">
							<li><a
								href="/?pageIndex=${product_paging.firstPageIndex-1 }&countPerPage=${product_paging.pcpgvo.countPerPage}&range=${product_paging.pcpgvo.range}&keyword=${product_paging.pcpgvo.keyword}">
									&lt;</a></li>
						</c:if>
						<c:forEach begin="${product_paging.firstPageIndex }"
							end="${product_paging.lastPageIndex }" var="i">
							<li
								class="${product_paging.pcpgvo.pageIndex == i ? 'active' : '' } ${product_paging.pcpgvo.pageIndex}">
								<a
								href="/?pageIndex=${i }&countPerPage=${product_paging.pcpgvo.countPerPage}&range=${product_paging.pcpgvo.range}&keyword=${product_paging.pcpgvo.keyword}">
									${i }</a>
							</li>
						</c:forEach>
						<c:if test="${product_paging.next }">
							<li><a
								href="/?pageIndex=${product_paging.lastPageIndex+1 }&countPerPage=${product_paging.pcpgvo.countPerPage}&range=${product_paging.pcpgvo.range}&keyword=${product_paging.pcpgvo.keyword}">
									&gt;</a></li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
	<div class="container" id="warning">
		<b>유의사항</b><span style="float: right;"><img src="/resources/icons/info.png" style="width: 20px;">&nbsp;<b>원산지, 영양분석, 알레르기 유발성분  ></b></span>
		<hr>
		<div>
			<ul>
				<li>매장별 주문금액이 상이하니, 반드시 최소금액을 확인하기 바랍니다.</li>
				<li>배달 소요시간은 기상조건이나 매장 사정상 지연 또는 제한될 수 있습니다.</li>
				<li>고객님과 수 차례 연락을 시도한 후 연락이 되지 않는 경우 배달음식이 변질되거나 부패될 우려로 <br>식품위생법상
					위반될 여지가 있어 별도로 보관 하지 않으며, <b>재배달 또는 환불처리가 어려울 수 있습니다.</b>
				</li>
				<li>딜리버리 서비스 메뉴의 가격은 매장 가격과 상이하며, 딜리버리 시 타쿠폰을 사용하실 수 없습니다.
					(일부품목 배달 제외)</li>
				<li>배달 제품은 매장 행사(할인가격)에서 제외됩니다.</li>
				<li>제품 가격 및 메뉴 구성은 본사 사정상 변경될 수 있습니다.</li>
				<li>대량 주문의 경우 콜센터(1599-0505)주문으로만 가능합니다.</li>
				<li>주문 완료 후 변경 및 취소는 콜센터(1599-0505)에서만 가능합니다.</li>
			</ul>
		</div>
	</div>
</section>

<!-- 1번 모달 상품 누르면 단품 / 세트 / L 세트 선택 화면이 나옴 -->
<div class="modal modal-center fade" id="sigle_set_modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">메뉴 선택</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container" id="menuZone"></div>
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal">닫기</button>
			</div>

		</div>
	</div>
</div>
<!-- 1번 모달 끝 -->

<!-- 2번 모달 단품 / 세트를 누르면 세트 / 라지세트로 선택하겠냐는 모달창 -->
<div class="modal modal-center fade" id="size_up_modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">세트 추천</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container text-center" id="suggestZone"></div>
			</div>

			<!-- Modal footer -->
			<div class="container con_modal_footer" id="suggestZoneFooter"></div>
		</div>
	</div>
</div>
<!-- 2번 모달 끝 -->

<!-- 3번 모달 추가 재료 선택 -->
<div class="modal modal-center fade" id="add_ingredient_modal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">재료를 추가해 더 맛있게 즐겨보세요!</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container" id="ingredientZone"></div>
			</div>

			<!-- Modal footer -->
			<div class="container con_modal_footer" id="ingredientZoneFooter">
			</div>

		</div>
	</div>
</div>
<!-- 3번 모달 끝 -->

<!-- 4번 모달 사이드 선택 -->
<div class="modal modal-center fade" id="side_modal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header" id="sideHeader">
				
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container" id="sideZone"></div>
			</div>

			<!-- Modal footer -->
			<div class="container con_modal_footer" id="sideZoneFooter"></div>

		</div>
	</div>
</div>
<!-- 4번 모달 끝 -->

<!-- 5번 모달 음료 선택 -->
<div class="modal modal-center fade" id="beverage_modal" data-backdrop="static">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header" id="beverageHeader">
				
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<div class="container" id="beverageZone"></div>
			</div>

			<!-- Modal footer -->
			<div class="container con_modal_footer" id="beverageZoneFooter">
			</div>

		</div>
	</div>
</div>
<!-- 5번 모달 -->

<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
	/* 카테고리 누르면 active 버튼 색 변함 */
	let keyword_val = '<c:out value="${product_paging.pcpgvo.keyword}"/>';
	switch (keyword_val) {
		case "":
			$(".total").addClass("active");
			break;
		case "1":
			$(".burger").addClass("active");
			break;
		case "2":
			$(".set").addClass("active");
			break;
		case "4":
			$(".allday").addClass("active");
			break;
		case "7":
			$(".sides").addClass("active");
			break;
		case "8":
			$(".beverage").addClass("active");
			break;
	}
	
	/* 주문 취소시 add_extra 테이블 정보를 받아와서 있으면 취소하겠냐 모달 띄우고 아니면 그냥 모달 꺼짐 */
	function cancel_order (mno, pno) {
		$.getJSON("/isAddExtra/"+mno+"/"+pno+".json", function(result) {
			console.log(result);
			get_obj(result, mno, pno);
		}).fail(function(err){
			console.log(err);
		});
	}
	function get_obj(obj, mno, pno) {
		if(Object.keys(obj).length != 0) {
			if (confirm ("주문을 취소하시겠습니까?")) {
				/* 예 */
				$.ajax({
					url : "/delAddExtra",
					type : "post",
					data : {
						mno : mno,
						pno : pno
					}
				}).done(function(){
					alert("주문이 취소되셨습니다");
					$("#side_modal").modal("hide");
					$("#beverage_modal").modal("hide");
				}).fail(function(err){
					console.log(err);
				})
			} else {
				/* 아니오 */
			}
		} else {
			$("#side_modal").modal("hide");
			$("#beverage_modal").modal("hide");
		}
	}
	
	/* checkbox row 누르면 체크박스에 체크 되게하기 */
	$(document).on("click", ".checkbox.row",function() {
		if (!$(this).find("input[type=checkbox]").prop("checked")) {
			$(this).find("input[type=checkbox]").prop("checked", true);
		} else {
			$(this).find("input[type=checkbox]").prop("checked", false);
		}
	});	
	
	
	/* 처음 선택한 pno */
	let pno_val;
	/* 1 상품 div 누르면 모달 뜨면서 단품 - 세트 - 라지세트 등장 */
	$(document).on("click", ".product", function() {
		pno_val = $(this).data("pno");
		let category_val = $(this).data("category");
		get_menu(pno_val, category_val);
	});
	
	function get_menu(pno, category) {
		console.log("1번모달 선택된 pno : "+pno);
		$.getJSON("/select/"+pno+"/"+category+".json", function(result) {
			menu_list(result);
		}).fail(function(err){
			console.log(err);
		});
	}
	function menu_list(list) {
		let menuZone = $("#menuZone");
		menuZone.html("");
		let html = '';
		
		for (let pfdto of list) {
			html += '<div class="row menuselect" data-sel_pno="'+pfdto.pno+'" data-sel_category="'+pfdto.category+'">';
			html += '<div class="col-sm product-text">';
			html += '<span id="title">'+pfdto.title+'</span><br>';
			html += '<span id="content">'+pfdto.content+'</span><br>';
			html += '<span id="price">'+pfdto.price+'</span><br>';
			/* <fmt:formatNumber value="${pfdto.price }" pattern="#,###"/> */
			html += '</div>';
			html += '<div class="col-sm">';
			html += '<img class="img-fluid" src="/upload/'+pfdto.savedir+'/'+pfdto.puuid+'_th_'+pfdto.fname+'"';
			html += 'width="250px" />';
			html += '</div></div>';
		}
		 menuZone.append(html); 
	}
	/* 1 모달 끝 */
	
	
	/* 사이즈 업 모달에서 고른 pno */
	let sel_pno_val;
	/* 2 모달 단품 / 세트를 누르면 세트 / 라지세트로 선택하겠냐는 모달*/
	$(document).on("click", ".menuselect", function() {
		sel_pno_val = $(this).data("sel_pno");
		let category_val = $(this).data("sel_category");
		let mno = '<c:out value="${ses.mno}"/>';
		$("#sigle_set_modal").modal("hide");
		if (category_val == 1 || category_val == 2 || category_val == 4 || category_val == 5) {
			/* 단품, 세트 사이즈업 */
			console.log("category_val1 = "+category_val);
			want_larger_one(sel_pno_val, category_val);
		} else if (category_val == 3 || category_val == 6){
			/* 라지세트 재료추가 */
			console.log("category_val2 = "+category_val);
			add_extra(sel_pno_val);
		} else {
			/*사이드, 음료 누르면 카트에 추가 - 바로 마지막 단계 */
			add_cart(sel_pno_val, mno);
		}
	});
	
	/* 단품, 세트 골랐을 때 사이즈업 */
	function want_larger_one(pno, category) {
		console.log("2번모달 선택된 pno : "+pno);
		$.getJSON("/wantLarger/"+pno+"/"+category+".json", function(result) {
			display_suggest(result, category);
		}).fail(function(err){
			console.log(err);
		});
	}
	function display_suggest(obj, category) {
		$("#size_up_modal").modal("show");
		let suggestZone = $("#suggestZone");
		let suggestZoneFooter = $("#suggestZoneFooter");
		suggestZone.html("");
		suggestZoneFooter.html("");
		console.log("사이즈업 카테고리 = "+obj.category);
		let html = '';
		console.log("obj 잘 뽑힘? = "+obj.category);
		 if (obj.category == 3 || obj.category == 6) {
			html += '<span id="price">700원</span>';
			html += '<span id="title">만 추가하시면<br>';
			html += '사이드와 음료를 라지 사이즈로<br>';
			html += '즐기실 수 있어요!<br>';
			html += '업그레이드 하시겠습니까?</span><br>';
			html += '<img class="img-fluid" src="/upload/'+obj.savedir+'/'+obj.puuid+'_th_'+obj.fname+'"';
			html += 'width="350px" /><br>';
			html += '<span id="title">'+obj.title+'<br>'+obj.content+'</span>';
		} else {
			html += '<span id="price">2500원</span>';
			html += '<span id="title">만 추가하시면<br>';
			html += '사이드와 음료를 추가해 세트로<br>';
			html += '즐기실 수 있어요!<br>';
			html += '업그레이드 하시겠습니까?</span><br>';
			html += '<img class="img-fluid" src="/upload/'+obj.savedir+'/'+obj.puuid+'_th_'+obj.fname+'"';
			html += 'width="350px" /><br>';
			html += '<span id="title">'+obj.title+'<br>'+obj.content+'</span>';
		}
		 
		 let fhtml = '';
		 fhtml += '<div class="row">';
		 fhtml += '<div class="col-sm bg-dark text-center footer_btn" onclick="add_extra('+sel_pno_val+','+category+')">';
		 fhtml += '<span id="button_text">아니오</span></div>';
		 fhtml += '<div class="col-sm bg-danger text-center footer_btn" onclick="add_extra('+obj.pno+','+obj.category+')">';
		 fhtml += '<span id="button_text">업그레이드 하기</span></div>';
		 fhtml += '</div>';
		 
		 suggestZone.append(html);
		 suggestZoneFooter.append(fhtml);
	}
	/* 2 모달 끝 */
	
	
	/* 3 모달 - 추가 재료 add_extra() */
	function add_extra(pno, category) {
		console.log("3번모달 선택된 pno : "+pno);
		$("#size_up_modal").modal("hide");
		
		$.getJSON("/getBurgerStock.json", function(result) {
			console.log(result);
			show_ingredient(result, pno, category);
		}).fail(function(err){
			console.log(err);
		});
	}
	function show_ingredient(pObj, pno, category){
		$("#add_ingredient_modal").modal("show");
		let ingredientZone = $("#ingredientZone");
		let ingredientZoneFooter = $("#ingredientZoneFooter");
		let mno = '<c:out value="${ses.mno}"/>';
		ingredientZone.html("");
		ingredientZoneFooter.html("");
		html = '';
		
		for (let pvo of pObj) {
			html += '<div class="checkbox row">';
			html += '<input type="checkbox" name="sname" id="'+pvo.title+'" value="" data-title="'+pvo.title+'" data-price="'+pvo.price+'" class="checkbox">';
			html += '<label class="check_label" for="'+pvo.title+'">'+pvo.title+'</label>';
			html += '<span class="check_price">+'+pvo.price+'원</span>';
			for (let list of pvo.flist) {
				html += '<img class="img-fluid extra_img" src="/upload/'+list.savedir+'/'+list.puuid+'_th_'+list.fname+'" style="height:70px; width:120px;"/>';
			}
			html += '</div>';
		}
		
		let fhtml = '';
		fhtml += '<div class="row">';
		fhtml += '<div class="col-sm bg-dark text-center footer_btn" onclick="show_sides('+pno+','+category+','+mno+')">';
		fhtml += '<span id="button_text">추가안함</span></div>';
		fhtml += '<div class="col-sm bg-danger text-center footer_btn" onclick="confirm_extra('+pno+','+category+')">';
		fhtml += '<span id="button_text">추가하기</span></div>';
		fhtml += '</div>';
		
		ingredientZone.append(html);
		ingredientZoneFooter.append(fhtml);
	}
	
	/* 재료 추가하면 작동 */
	function confirm_extra(pno, category) {
		let priceArr = [];
		let titleArr = [];
		let mno = '<c:out value="${ses.mno}"/>';
		$("input:checkbox[name=sname]:checked").each(function() {
			let price = $(this).data("price");
			let title = $(this).data("title");
			priceArr.push(price);
			titleArr.push(title);
		})
		if (priceArr.length != 0 ) {
			$.ajax({
				url : "/addExtra",
				type : "post",
				data : {
					titleList : titleArr,
					priceList : priceArr,
					mno : mno,
					pno : pno,
				}
			}).done(function(result) {
				console.log("성공함");
				show_sides(pno, category, mno);
			}).fail(function(err) {
				console.log("실패함");
			});
		} else {
			alert("추가하시려는 재료를 넣으셔야합니다");
		}
	}
	/* 3 모달 끝 */
	
	/* 4 모달 사이드메뉴 고르기 */
	function show_sides(pno, category, mno) {
		$("#add_ingredient_modal").modal("hide");
		$.getJSON("/getSideList.json", function(result) {
			console.log(result);
			print_sides(result, pno, category, mno);
		}).fail(function(err) {
			console.log(err);
		});
	}
	function print_sides(pvoObj, pno, category, mno) {
		$("#side_modal").modal("show");
		let sideHeader = $("#sideHeader");
		let sideZone = $("#sideZone");
		let sideZoneFooter = $("#sideZoneFooter");
		sideHeader.html("");
		sideZone.html("");
		sideZoneFooter.html("");
		
		let h_html = '';
		h_html += '<h4 class="modal-title">사이드 변경</h4>';
		h_html += '<button type="button" class="close" onclick="cancel_order('+mno+','+pno+')">&times;</button>';
		
		html = '';
		html += '<div class="row">';
		if (category == 1 || category == 4) { /* 단품 */
			for (let pvo of pvoObj) {
				html += '<div class="col-md-4" onclick="side_check(this)">';
				html += '<div class="add_check"></div>';
				for (let list of pvo.flist) {
					html += '<img class="img-fluid" src="/upload/'+list.savedir+'/'+list.puuid+'_th_'+list.fname+'"/>';
				}
				html += '<div class="text-center">';
				html += '<p class="side top">'+pvo.title+'</p>';
				html += '<p class="side">+<span>'+pvo.price+'</span>원</p>';
				html += '</div></div>';
			}
		} else if (category == 2 || category == 5) { /* 세트 */
			for (let pvo of pvoObj) {
				html += '<div class="col-md-4" onclick="side_check(this)">';
				html += '<div class="add_check"></div>';
				for (let list of pvo.flist) {
					html += '<img class="img-fluid" src="/upload/'+list.savedir+'/'+list.puuid+'_th_'+list.fname+'"/>';
				}
				html += '<div class="text-center">';
				html += '<p class="side top">'+pvo.title+'</p>';
				html += '<p class="side">+<span>'+ (parseInt(pvo.price) - 2400)  +'</span>원</p>';
				html += '</div></div>';
			}
		} else { /* 라지 세트 */
			for (let pvo of pvoObj) {
				if (parseInt(pvo.price) >= 2900) {
					html += '<div class="col-md-4" onclick="side_check(this)">';
					html += '<div class="add_check"></div>';
					for (let list of pvo.flist) {
						html += '<img class="img-fluid" src="/upload/'+list.savedir+'/'+list.puuid+'_th_'+list.fname+'"/>';
					}
					html += '<div class="text-center">';
					html += '<p class="side top">'+pvo.title+'</p>';
					html += '<p class="side">+<span>'+ (parseInt(pvo.price) - 2900)  +'</span>원</p>';
					html += '</div></div>';
				}
			}
		}
		html += '</div>';

		let fhtml = '';
		if (category == 1 || category == 4) {
			fhtml += '<div class="row">';
			fhtml += '<div class="col-sm bg-dark text-center footer_btn" onclick="show_beverage('+pno+','+category+','+mno+')">';
			fhtml += '<span id="button_text">추가안함</span></div>';
			fhtml += '<div class="col-sm bg-danger text-center footer_btn" onclick="add_side('+pno+','+category+','+mno+')">';
			fhtml += '<span id="button_text">추가하기</span></div>';
			fhtml += '</div>';
		} else {
			fhtml += '<div class="row">';
			fhtml += '<div class="col-sm bg-danger text-center footer_btn" onclick="add_side('+pno+','+category+','+mno+')">';
			fhtml += '<span id="button_text">선택</span></div>';
			fhtml += '</div>';
		}
		sideHeader.append(h_html);
		sideZone.append(html);
		sideZoneFooter.append(fhtml);
		side_default_check();
	}
		/* 사이드 메뉴에 디폴트로 체크 이미지 표시하기 */
		function side_default_check() {
			let check = '<img class="check_img" src="/resources/icons/check.png" width="110px" style="position: absolute;">';
			$("#sideZone").children("div").find(".add_check").eq(0).append(check);
			
		}
		/* 클릭한 제품에 체크 이미지 표시하기 */
		function side_check(e) {
			let check = '<img class="check_img" src="/resources/icons/check.png" width="110px" style="position: absolute;">';
			$("#sideZone").children("div").find(".add_check").html("");
			$(e).children(".add_check").append(check);
		}
		
		/* 사이드 추가 기능 */
		function add_side(pno, category, mno) {
			let side_title = $(".check_img").closest("div").siblings("div").eq(0).find("p").eq(0).text();
			let side_price = $(".check_img").closest("div").siblings("div").eq(0).find("p").eq(1).find("span").text();
			
			console.log(side_title);
			console.log(side_price);
			
			$.ajax({
				url : "/addSide",
				type : "post",
				data : {
					title : side_title,
					price : side_price,
					mno : mno,
					pno : pno
				}
			}).done(function(result){
				console.log("성공");
				show_beverage(pno, category, mno);
			}).fail(function(){
				console.log("실패");
			});
		}
		/* 4 모달 끝 */
		
		/* 5 모달 음료 고르기 */
		function show_beverage(pno, category, mno) {
			let sideZone = $("#sideZone");
			let sideZoneFooter = $("#sideZoneFooter");
		  	sideZone.html("");
			sideZoneFooter.html("");
			
			$("#side_modal").modal("hide");
			$.getJSON("/getBeverageList.json", function(result) {
				console.log(result);
				print_beverage(result, pno, category, mno);
			}).fail(function(err) {
				console.log(err);
			});
		}
		function print_beverage(pvoObj, pno, category, mno) {
			$("#beverage_modal").modal("show");
			let beverageHeader = $("#beverageHeader");
			let beverageZone = $("#beverageZone");
			let beverageZoneFooter = $("#beverageZoneFooter");
			beverageHeader.html("");
			beverageZone.html("");
			beverageZoneFooter.html("");
			
			h_html = '';
			h_html += '<h4 class="modal-title">음료 변경</h4>';
			h_html += '<button type="button" class="close" onclick="cancel_order('+mno+','+pno+')">&times;</button>';
			
			html = '';
			html += '<div class="row">';
			
			if (category == 1 || category == 4) { /* 단품 */
				for (let pvo of pvoObj) {
					html += '<div class="col-md-4" onclick="beverage_check(this)">';
					html += '<div class="add_check"></div>';
					for (let list of pvo.flist) {
						html += '<img class="img-fluid" src="/upload/'+list.savedir+'/'+list.puuid+'_th_'+list.fname+'"/>';
					}
					html += '<div class="text-center">';
					html += '<p class="side top">'+pvo.title+'</p>';
					html += '<p class="side">+<span>'+pvo.price+'</span>원</p>';
					html += '</div></div>';
				}
			} else if (category == 2 || category == 5) { /* 세트 */
				for (let pvo of pvoObj) {
					html += '<div class="col-md-4" onclick="beverage_check(this)">';
					html += '<div class="add_check"></div>';
					for (let list of pvo.flist) {
						html += '<img class="img-fluid" src="/upload/'+list.savedir+'/'+list.puuid+'_th_'+list.fname+'"/>';
					}
					html += '<div class="text-center">';
					html += '<p class="side top">'+pvo.title+'</p>';
					html += '<p class="side">+<span>'+ (parseInt(pvo.price) - 2500)  +'</span>원</p>';
					html += '</div></div>';
				}
			} else { /* 라지 세트 */
				for (let pvo of pvoObj) {
					if (parseInt(pvo.price) >= 2700) {
						html += '<div class="col-md-4" onclick="beverage_check(this)">';
						html += '<div class="add_check"></div>';
						for (let list of pvo.flist) {
							html += '<img class="img-fluid" src="/upload/'+list.savedir+'/'+list.puuid+'_th_'+list.fname+'"/>';
						}
						html += '<div class="text-center">';
						html += '<p class="side top">'+pvo.title+'</p>';
						html += '<p class="side">+<span>'+ (parseInt(pvo.price) - 2700)  +'</span>원</p>';
						html += '</div></div>';
					}
				}
			}
			html += '</div>';
			
			let fhtml = '';
			if (category == 1 || category == 4) {
				fhtml += '<div class="row">';
				fhtml += '<div class="col-sm bg-dark text-center footer_btn" onclick="add_cart('+pno+','+mno+')">';
				fhtml += '<span id="button_text">추가안함</span></div>';
				fhtml += '<div class="col-sm bg-danger text-center footer_btn" onclick="add_beverage('+pno+','+mno+')">';
				fhtml += '<span id="button_text">추가하기</span></div>';
				fhtml += '</div>';
			} else {
				fhtml += '<div class="row">';
				fhtml += '<div class="col-sm bg-danger text-center footer_btn" onclick="add_beverage('+pno+','+mno+')">';
				fhtml += '<span id="button_text">선택</span></div>';
				fhtml += '</div>';
			}
			beverageHeader.append(h_html);
			beverageZone.append(html);
			beverageZoneFooter.append(fhtml);
			beverage_default_check();
		}
		
		/* 음료 메뉴에 디폴트로 체크 이미지 표시하기 */
		function beverage_default_check() {
			let check = '<img class="check_img" src="/resources/icons/check.png" width="110px" style="position: absolute;">';
			$("#beverageZone").children("div").find(".add_check").eq(0).append(check);
			
		}
		/* 클릭한 제품에 체크 이미지 표시하기 */
		function beverage_check(e) {
			let check = '<img class="check_img" src="/resources/icons/check.png" width="110px" style="position: absolute;">';
			$("#beverageZone").children("div").find(".add_check").html("");
			$(e).children(".add_check").append(check);
		}
		
		/* 음료 추가 기능 */
		function add_beverage(pno, mno) {
			let beverage_title = $(".check_img").closest("div").siblings("div").eq(0).find("p").eq(0).text();
			let beverage_price = $(".check_img").closest("div").siblings("div").eq(0).find("p").eq(1).find("span").text();
			
			console.log(beverage_title);
			console.log(beverage_price);
		 	$.ajax({
				url : "/addBeverage",
				type : "post",
				data : {
					title : beverage_title,
					price : beverage_price,
					mno : mno,
					pno : pno
				}
			}).done(function(result){
				console.log("성공");
				add_cart(pno, mno);
			}).fail(function(){
				console.log("실패");
			});
		}
		/* 5번 모달 끝 */
		
		/* 카트에 추가하기 */
		function add_cart(pno, mno) {
			
			$.getJSON("/getSelectedProduct/"+pno+".json", function(result){
				console.log(result);
				send_product_info(result, pno, mno);
			}).fail(function(err){
				console.log(err);
			});
		}
		function send_product_info(pvoObj, pno, mno) {
			let title = pvoObj.title;
			let price = pvoObj.price;
			
			$.ajax({
				url : "/cart/register",
				type : "post",
				data : {
					title : title,
					price : price,
					pno : pno,
					mno : mno
				}
			}).done(function(){
				console.log("상품 등록 성공");
				alert("상품이 장바구니에 추가되었습니다");
				$("#beverage_modal").modal("hide");
			}).fail(function(err){
				console.log("상품 등록 실패");
				console.log(err);
			});
		}
</script>


<jsp:include page="common/footer.jsp" />