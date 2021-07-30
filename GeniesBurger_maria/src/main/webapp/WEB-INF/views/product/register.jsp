<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<style>
.pcontainer {
	padding-top : 50px;
	padding-bottom : 50px;
}

</style>
<div class="container-fluid border pcontainer">
	<div class="container col-sm-4">
		<p style="font-size:2em;">상품 등록</p>
		<form class="" action="/product/register" method="post"
			enctype="multipart/form-data">

			<div class="form-group">
				<label for="title">상품 품목:</label> <select name="category"
					class="form-control">
					<option value="">상품 품목선택</option>
					<option value="1">버거</option>
					<option value="2">버거 세트</option>
					<option value="3">버거 라지 세트</option>
					<option value="4">올데이할인 버거</option>
					<option value="5">올데이할인 버거 세트</option>
					<option value="6">올데이할인 버거 라지 세트</option>
					<option value="7">사이드</option>
					<option value="8">음료</option>
					<option value="9">햄버거 추가 재료</option>
				</select>
			</div>

			<div class="form-group">
				<label for="title">세트 구성을 위한 단품 연동:</label> <select name="relate_pno" id="relateSel"
					class="form-control">
					<option value="0">연동할 상품명 선택</option>
					<c:forEach items="${single_list }" var="pvo">
						<option value="${pvo.pno }">
							<c:choose>
								<c:when test="${pvo.category eq 1}">버거 단품</c:when>
								<c:otherwise>올데이세일 단품</c:otherwise>
							</c:choose>
						 - ${pvo.title }
						</option>
					</c:forEach>
				</select>
			</div>

			<div class="form-group">
				<label for="title">제품명:</label> <input type="text"
					class="form-control" id="title" placeholder="Enter title"
					name="title">
			</div>

			<div class="form-group">
				<label for="content">제품설명:</label> <input type="text"
					class="form-control" id="content" placeholder="Enter content"
					name="content">
			</div>

			<div class="form-group">
				<label for="price">가격:</label> <input type="number"
					class="form-control" id="price" placeholder="Enter price"
					name="price">
			</div>

			<div class="form-group">
				<label for="price">칼로리:</label> <input type="number"
					class="form-control" id="price" placeholder="Enter calorie"
					name="calorie">
			</div>

			<div class="form-group">
				<label for="price">사진파일:</label> <input type="file"
					class="form-control" id="files" name="files" multiple
					style="display: none;">
				<button type="button"
					class="btn-lg btn-outline-info btn-block col-sm-6" id="fileTrigger">사진
					업로드</button>
			</div>
			
			<div class="form-group">
				<ul class="list-group" id="fileZone"></ul>
			</div>
			
			<div class="form-group">
				<ul class="list-group" id="relateStockZone"></ul>
			</div>
			
			<div class="form-group">
				<button type="button" class="btn-sm btn-info float-right addstock"
				style="margin-bottom:5px">재고 추가</button>
				<label for="stock">재고 연동:</label> 
				<select id="stock" name="sname" class="form-control">
					<option value="">재고 선택</option>
					<c:forEach items="${stock_list }" var="svo">
					<option value="${svo.sname }">${svo.sname }</option>
					</c:forEach>
				</select>
				<div id="stockZone"></div>
			</div>
			<button type="submit" class="btn-lg btn-danger">추가</button>
		</form>
	</div>
</div>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
	$(document).on("click", "#fileTrigger", function() {
		$("#files").click();
		console.log("fileTrigger");
	});
	
	let regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
	let maxSize = 1048576; //1mb
	function fileValidation(fname, fsize) {
		if (regExp.test(fname)) {
			alert(fname+"는 허용되지 않는 파일형식입니다");
			return false;
		} else if (fsize > maxSize) {
			alert("1mb 파일만 허용됩니다");
			return false;
		} else {
			return true;
		}
	}
	
	/* 실무에서는 유효성 검사까지 해야함 */
	$(document).on("change", "#files", function() {
		$("button[type=submit]").attr("disabled", false);
		let formObj = $("#files");
		let fileObjs = formObj[0].files;
		let fileZone = $("#fileZone");
		fileZone.html("");
		
		for (let fobj of fileObjs) {
			let li = '<li class="list-group-item d-flex justify-content-between align-items-center">';
			if(fileValidation(fobj.name, fobj.size)) {
				li += fobj.name+'<span class="badge badge-success badge-pill">';
			} else {
				li += '<i class="fa fa-times-rectangle" style="font-size:24px;color:red"></i>';
				li += fobj.name+'<span class="badge badge-danger badge-pill">';
				$("button[type=submit]").attr("disabled", true);
			}
				let fileSize = fobj.size / 1024;
				fileSize = parseInt(fileSize);
				li += fileSize.toFixed(2) + 'KB</span></li>';
				fileZone.append(li);
		}
	});
</script>
<script>
	let stockval_arr = $("#stock option").map(function() {return $(this).val()});
	let stocktext_arr = $("#stock option").map(function() {return $(this).text()});
	console.log(stockval_arr);
	console.log(stocktext_arr);

	
	let stockList = [];
	function StockObj(val, text) {
		this.val = val;
		this.text = text;
	}
	$(document).on("click", ".addstock", function() {
		stockList.length = 0;
		for (let i = 0; i < stockval_arr.length; i++) {
			for (let j = 0; j < stocktext_arr.length; j++) {
				if (i == j) {
					let stock = new StockObj(stockval_arr[i], stocktext_arr[j]);
					console.log(stockval_arr[i]);
					stockList.push(stock);
				}
			}
		}
		console.log("stockArr = "+ stockList);
		
		let stockZone = $("#stockZone");
		let select_html = "";
		select_html += '<select name="sname" class="form-control">';
		for (let obj of stockList) {
			for (let key in obj) {
				if (key == 'val') {
					select_html += '<option value="'+obj[key]+'">';
				} else {
					select_html += obj[key]+'</option>';
				}
			}
		}
		select_html += '</select>';
		stockZone.append(select_html); 
		
	});
	
	/* 단품 연동 select에 값이 들어가면 해당 pno 값과 연동되어있는 stock - sname이 출력됨*/
	$("#relateSel").change(function() {
		let relate_pno = $(this).val();
		
		$.getJSON("/product/getRelateStock/"+relate_pno+".json", function(result) {
			console.log(result);
			print_relate_stock(result);
		}).fail(function(err){
			console.log(err);
		})
	});
	
	function print_relate_stock(list) {
		let html ='';
		let relateStockZone = $("#relateStockZone");
		relateStockZone.html("");
		if (list.length != 0) {
			html += '<label for="price">선택한 단품과 연동되어있는 재고:</label>';
			for (let psvo of list) {
				html += '<input type="text" class="form-control" placeholder="'+psvo.sname+'" name="sname" value="'+psvo.sname+'" readonly>';
			}
		}
		
		relateStockZone.append(html);
	}
</script>

<jsp:include page="../common/footer.jsp" />