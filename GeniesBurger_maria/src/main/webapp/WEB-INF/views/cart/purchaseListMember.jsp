<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<style>
#addFile{
	cursor:pointer;
}
#content:focus {
	outline: none;
}
#content {
	resize: none;
	border: 2px solid #E7E9EB;
	width:100%;
	height: 200px;
	padding: 10px 10px 10px 10px;
}
</style>
<section class="ftco-section ftco-cart"	style="background-color: #F1EAE5;">
	<c:choose>
		<c:when	test="${purchaseListMember[0].title eq null || purchaseListMember[0].title eq '' }">
			<img src="/resources/icons/nolist_logo2.png" style="width: 350px; display: block; margin: auto; margin-top: 50px;">
		</c:when>
		<c:otherwise>
			<div class="container">
				<div class="row">
					<div class="col" style="margin-bottom: 10px;">
						<form action="/cart/purchaseListMember"	class="form-inline">
							<p style="font-size: 2em; margin-right: 450px;">나의 주문내역</p>
							<select class="form-control" name="range" style="margin-left:180px;">
								<option value="t" <c:out value="${pghdl.mpgvo.range eq 't' ? 'selected' : '' }"/>>상품명</option>
								<option value="p" <c:out value="${pghdl.mpgvo.range eq 'p' ? 'selected' : '' }"/>>가격</option>
							</select>&nbsp;&nbsp; 
							<input class="form-control" type="text"	placeholder="검색어 입력" name="keyword" value="${pghdl.mpgvo.keyword }"> 
							<input type="hidden" name="mno" value="${pghdl.mpgvo.mno }"> &nbsp;&nbsp;
							<button type="submit" class="btn-sm btn-danger detailBtn">검색</button>
						</form>
					</div>
					<div class="col-md-12 ftco-animate">
						<table class="table">
							<thead class="thead-primary">
								<tr class="text-center">
									<th>상품명</th>
									<th>가격</th>
									<th>수량</th>
									<th>주문시간</th>
									<th>리뷰</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${purchaseListMember }" var="purchaseListMember">
									<input type="hidden" value="${purchaseListMember.pno }">
									<input type="hidden" value="${purchaseListMember.purno }">
									<tr class="text-center">
										<td>${purchaseListMember.title }</td>
										<td><fmt:formatNumber value="${purchaseListMember.price }" pattern="#,###" /></td>
										<td>${purchaseListMember.quantity }</td>
										<td>${purchaseListMember.regdate }</td>
										<c:choose>
											<c:when test="${purchaseListMember.rlist.size() == 0}">
												<td><button type="button" class="btn btn-danger revBtn" style="width: 50px;" data-toggle="modal" data-target="#myModal">작성</button></td>
											</c:when>
											<c:otherwise>
												<td>리뷰 작성 완료</td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot>
						</table>
						<jsp:include page="pagingMember.jsp" />
					</div>
				</div>
			</div>
			<script>
				$(".ftco-cart").css("background-color", "white");
			</script>
		</c:otherwise>
	</c:choose>
	<!-- ---------- 모달 ----------- -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">

				<!-- Modal Header -->
				<div class="modal-header">
					<h4 class="modal-title">리뷰 작성하기</h4>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<!-- Modal body -->
				<div class="modal-body justify-content-center">
						<form action="/review/register" method="post" enctype="multipart/form-data" id="regForm">
							<input type="hidden" name="pno" value=""> 
							<input type="hidden" name="purno" value="">
							<input type="hidden" name="email" value="${ses.email }"> 
							<input type="hidden" name="title" value="">
							<textarea id="content" name="rcontent" placeholder="내용을 입력해주세요"></textarea>
							<input type="file" class="form-control" id="files" name="files"	style="display: none;" accept="image/jpeg, image/jpg, image/png">
							<img class="float-left" src="" id="myImg" style="width: 70px; height: 70px;">
							<img class="float-left" id="addFile" src="/resources/images/review-2.png" style="width:70px; height: 70px;">
							<!-- <button type="button" class="btn btn-info btn-block" id="fileTrigger">사진업로드</button> -->
						</form>
				</div>

				<!-- Modal footer -->
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" id="subBtn">리뷰작성</button>
				</div>

			</div>
		</div>
	</div>
	<!-- ---------- 모달 ----------- -->
</section>
<script>
$("#myImg").hide();	
let pno;
let purno;
let title;


$(document).on("click", ".revBtn", function(){
	$("#regForm")[0].reset();
	pno = $(this).closest("td").closest("tr").prev("input").prev("input").val();
	purno = $(this).closest("td").closest("tr").prev("input").val();
	title = $(this).closest("td").closest("tr").find("td").eq("0").text();
});

$(document).on("click", "#addFile", function(){
	$("#files").click();
});

$(document).on("change", "#files", function(){
	setImageFromFile(this, '#myImg');
	$("#myImg").show();
});

$(document).on("click","#subBtn", function(){
	let content = $("#content").val();
	if(content==''){
		alert("내용을 입력하세요~");
	} else{
		$("input[name=pno]").val(pno);
		$("input[name=purno]").val(purno);
		$("input[name=title]").val(title);
		$("#regForm").submit();
	}
});
   
function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
            $(expression).attr('src', e.target.result);
           
        }
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<jsp:include page="../common/footer.jsp" />