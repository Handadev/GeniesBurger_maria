<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
<style>
.list-group-item span {
	float: left;
	margin: 0 auto;
	padding: 0 2%;
}

.sname {
	width: 25%;
}

.qty {
	width: 15%;
}

.shelf_life, .regdate, .del_mod {
	width: 20%;
}

.btn-danger {
	font-size: 15px;
	height: 35px;
	border-radius: 10px;
}

.fa-times:hover {
	cursor: pointer;
}

#delete:hover, #modify:hover {
	cursor: pointer;
	color: skyblue;
}

label {
	margin-left: 10px;
}
</style>

<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-7 align-self-center">
			<h3
				class="page-title text-truncate text-dark font-weight-medium mb-1">
				재고 관리</h3>
			<div class="d-flex align-items-center"></div>
		</div>

	</div>
</div>
<!-- ============================================================== -->
<!-- End Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->

<!-- ============================================================== -->
<!-- Container fluid  -->
<!-- ============================================================== -->
<div class="container-fluid">
	<!-- ============================================================== -->
	<!-- Start Page Content -->
	<!-- ============================================================== -->
	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">재고 입력</h4>
					<form>
						<div class="form-body">
							<div class="row">
								<div class="col-md-4">
									<div class="form-group">
										<label>이름</label> <input type="text" class="form-control"
											placeholder="이름" id="insert_sname" name="insert_sname">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>수량</label> <input type="number" class="form-control"
											placeholder="수량" id="insert_qty">
									</div>
								</div>
								<div class="col-md-3">
									<div class="form-group">
										<label>유통기한</label> <input type="date" class="form-control"
											id="insert_shelf_life">
									</div>
								</div>
								<div class="col-md-2">
									<div class="form-group">
										<label>버거 재료 여부</label>
										<div class="custom-control custom-checkbox">
											<input type="checkbox" class="custom-control-input"
												id="customCheck1" name="insert_isburger"> <label
												class="custom-control-label" for="customCheck1"></label>
										</div>
									</div>
								</div>
							</div>

						</div>
						<div class="form-actions">
							<div class="text-left">
								<button type="button" class="btn btn-info" id="submit">Submit</button>
								<button type="reset" class="btn btn-dark">Reset</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">재고 현황</h4>
					<div id="accordion" style="clear: both;" class="d-flex flex-wrap"></div>
				</div>
			</div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- End PAge Content -->
	<!-- ============================================================== -->
</div>
<!-- ============================================================== -->
<!-- End Container fluid  -->
<!-- ============================================================== -->
<!-- The Modal -->
<div class="modal" id="modifyModal">
	<div class="modal-dialog">
		<div class="modal-content">

			<!-- Modal Header -->
			<div class="modal-header">
				<h4 class="modal-title">재고 수량 수정</h4>
				<button type="button" class="close" data-dismiss="modal">&times;</button>
			</div>

			<!-- Modal body -->
			<div class="modal-body">
				<input type="hidden" id="modSno" name="modSno"> <input
					type="text" class="form-control" id="modQty">
			</div>

			<!-- Modal footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-danger" data-dismiss="modal"
					id="qtyModify">수정하기</button>
			</div>

		</div>
	</div>
</div>


<script src="/resources/admin/assets/libs/jquery/dist/jquery.min.js"></script>
<script>
function insert_stock() {
	let sname_val = $("#insert_sname").val();
	let qty_val = $("#insert_qty").val();
	let shelf_life_val = $("#insert_shelf_life").val();
	let isburger_val = 0;
	let extra_price_val = 0;
	if($("input:checkbox[name=insert_isburger]").is(":checked") == true) {
		isburger_val = 1;
	}
	console.log("isburger " + isburger_val)
	if (sname_val == null || sname_val == '') {
		if (qty_val == null || qty_val == ''){
			if (shelf_life_val == null || shelf_life_val == ''){
				alert("내용을 확인하세요!");
				return false;
			}
		}
	} else {
		let stock_data = {
			sname : sname_val,
			stock_qty : qty_val,
			shelf_life : shelf_life_val,
			isburger : isburger_val
		};
		$.ajax({
			url : "/stock/register",
			type : "post",
			data : JSON.stringify(stock_data),
			contentType : "application/json; charset=utf-8"
		}).done(function(result) {
			alert("재고 입력 성공");
			total_list();
		}).fail(function(err) {
			alert("재고 입력 실패");
			console.log(err);
		}).always(function() {
			$("#insert_sname").val("");
			$("#insert_qty").val("");
			$("#insert_shelf_life").val("");
		});
	}
}

function modify_qty(stockObj){
	$.ajax({
		url: "/stock/" + stockObj.sno,
		type: "put",
		data : JSON.stringify(stockObj),
		contentType : "application/json; charset=utf-8"
	}).done(function(result) {
		alert("재고 수량 수정 성공");
		total_list();
	}).fail(function(err) {
		alert("재고 수량 수정 실패");
		console.log(err);
	});
}

function remove_one(sno) {
	console.log("실행실행");
	$.ajax({
	url: "/stock/" + sno,
	type: "delete"
	}).done(function(result){
		alert("재고 개별 삭제 성공");
		total_list();	
	}).fail(function(err) {
		console.log(err);
		alert("재고 개별 삭제 실패");
	});
}

function remove_all(sname) {
	$.ajax({
	url: "/stock/sname/" + sname,
	type: "delete"
	}).done(function(result){
		alert("재고 일괄 삭제 성공");
		total_list();	
	}).fail(function(err) {
		console.log(err);
		alert("재고 일괄 삭제 실패");
	});
}

	function print_totalList(list){
			console.log(list);
			let listZone = $("#accordion");
			listZone.empty();	
			for (let svo of list) {
				let card = '<div class="col-lg-6">'
				card += '<div class="card">';
				card += '<div class="card-header d-flex">';
			    card += '<a class="collapsed card-link" data-toggle="collapse" href="#'+svo.sname+'" id="stockList">';
			    card += '<span class="stock_sname" id="stock_sname">'+svo.sname+'</span><span class="badge badge-primary badge-pill">'+svo.stock_qty+'</span></a>';
			    card += '<i class="p-2 ml-auto fas fa-times" style="color:DeepPink;" data-sname="' + svo.sname + '"></i>';
			    card += '</div><div id="'+svo.sname+'" class="collapse" data-parent="#accordion">';
			    card += '<div class="card-body">';
			    card += '</div></div></div></div>';
			    listZone.append(card);
			    select_oneList(svo.sname);
				}
				$(".stock_sname").css("margin-right", "30px");		
	}
	function total_list() {
		$.getJSON("/stock/totalCntList.json", function(result) {
			print_totalList(result);
		}).fail(function(err) {
			console.log(err);
			alert("재고 리스트 로딩 실패!");
		});
	}

	function print_oneList(sname, oneList){
		let listZone2 = $("#"+sname);
		listZone2.empty();	
		let card2 = '<ul class="list-group list-group-flush">'
		   	card2 += '<li class="list-group-item">';
		   	card2 += '<span class="sname">이름</span>';
	   		card2 += '<span class="qty">수량</span>';
	   		card2 += '<span class="shelf_life">유통기한</span>';
	   		card2 += '<span class="regdate">입고일</span>';
		   	card2 += '</li></ul>';
		for (let svo of oneList) {
	   		//아코디언 내용(유통기한 표시)
	   		console.log("sno!!!" + svo.sno);
	   		card2 += '<ul class="list-group list-group-flush">'
	   		card2 += '<li class="list-group-item">';
	   		card2 += '<span class="sname">'+svo.sname+'</span>';
	   		card2 += '<span class="qty">'+svo.stock_qty+'</span>';
	   		card2 += '<span class="shelf_life">'+svo.shelf_life+'</span>';
	   		card2 += '<span class="regdate">'+svo.stock_regdate+'</span>';
	   		card2 += '<span class="del_mod">';
	   		card2 += '<span id="modify" data-sno="' + svo.sno + '" data-stock_qty="' + svo.stock_qty + '" data-toggle="modal" data-target="#modifyModal">수정</span>';
	   		card2 += '<span id="delete" data-sno="' + svo.sno + '">삭제</span></span>';   
	    	card2 += '</li></ul>'; 	
		}
		listZone2.append(card2);
	}
	function select_oneList(sname) {
		$.getJSON("/stock/oneList/"+sname+".json", function(result) {
			print_oneList(sname, result);
		}).fail(function(err) {
			console.log(err);
			alert("one 리스트 로딩 실패!");
		});
	}
	
</script>

<script>
$(document).on("click", "#submit", insert_stock);

$(document).on("click", "#modify", function(){
	let sno_val = $(this).data("sno");
	let qty_val = $(this).data("stock_qty");
	$("#modSno").val(sno_val);
	$("#modQty").val(qty_val);
});

$(document).on("click", "#qtyModify", function(){
	let sno_val = $("#modSno").val();
	let qty_val = $("#modQty").val();
	if (qty_val == null || qty_val == '') {
		alert("수량을 정확히 입력하세요!");
		return false;
	} else {
		let stockObj = {
			sno : sno_val,
			stock_qty : qty_val
		};
		modify_qty(stockObj);
	}
});

$(document).on("click", ".fa-times", function(){
	let sname_val = $(this).data("sname");
	remove_all(sname_val);
});

$(document).on("click", "#delete", function(){
	let sno_val = $(this).data("sno");
	console.log("sno " + sno_val);
	remove_one(sno_val);
});
 
$(function() {
	total_list();	
});
</script>
<jsp:include page="../adminCommon/footer.jsp" />