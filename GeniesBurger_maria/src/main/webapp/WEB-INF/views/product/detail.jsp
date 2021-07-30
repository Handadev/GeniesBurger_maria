<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />
<style>
td {
	padding: 10px !important;
}
</style>
<div class="container-fluid border pcontainer">
	<div class="container col-sm-6">
		<div class="container col-sm-6">
			<c:if test="${pvo.flist.size() > 0 }">
				<tr>
					<td colspan="2">
						<ul class="list-group" id="fileZone">
							<c:forEach items="${pvo.flist }" var="fvo">
								<img src="/upload/${fvo.savedir }/${fvo.puuid}_${fvo.fname}" alt="display none">
								<span class="badge badge-success badge-pill">${fvo.fname }</span>
							</c:forEach>
						</ul>
					</td>
				</tr>
			</c:if>
		</div>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Class</th>
					<th>Description</th>
				</tr>
			</thead>
			<!-- File Part-->
			<tr>
				<td>제품번호</td>
				<td id="pno">${pvo.pno }</td>
			</tr>
			<tr>
				<td>상품 품목</td>
				<td>${pvo.category }</td>
			</tr>
			<tr>
				<td>제품명</td>
				<td>${pvo.title }</td>
			</tr>
			<tr>
				<td>제품설명</td>
				<td>${pvo.content }</td>
			</tr>
			<tr>
				<td>가격</td>
				<td><fmt:formatNumber value="${pvo.price }" pattern="#,###"/></td>
			</tr>
			<tr>
				<td>칼로리</td>
				<td>${pvo.calorie }</td>
			</tr>
			<tr>
				<td>등록일</td>
				<td>${pvo.regdate }</td>
			</tr>
			<tr>
				<td>수정일</td>
				<td>${pvo.moddate }</td>
			</tr>
			<tr>
				<td>판매량</td>
				<td>${pvo.sales }</td>
			</tr>
			<tr>
				<td>연동된 재고</td>
				<td>
					<c:forEach items="${stock_list }" var="svo">
						${svo.sname } /
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td>판매중여부</td>
				<td>
				<c:choose>
						<c:when test="${pvo.cansale eq 0}">
							<span>판매중</span>
						</c:when>
						<c:otherwise>
							<span>일시품절</span>
						</c:otherwise>
					</c:choose>
				</td>
			</tr>
			<tr>
				<td colspan="2"><a href="/product/modify?pno=${pvo.pno }" class="btn btn-warning">EDIT</a>
					<button type="button" class="btn btn-danger del-btn">DEL</button>
					<button type="button" class="btn btn-success" id="addCartBtn">ADD TO CART</button>
				</td>
			</tr>
		</table>
		<form action="/cart/register" method="post" id="cartForm">
			<input type="hidden" name="pno" value="${pvo.pno }">
			<input type="hidden" name="title" value="${pvo.title }">
			<input type="hidden" name="price" value="${pvo.price }">
			<input type="hidden" name="mno" value="${ses.mno }">
		</form>
	</div>
</div>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<form action="/product/remove" method="post" id="rmForm">
	<input type="hidden" name="pno">
</form>
<script>
	$(document).on("click", ".del-btn", function (e) {
		e.preventDefault();
		let pno_num = $("#pno").text();
		$("input[name=pno]").val(pno_num);
		$("#rmForm").submit();
	});
</script>
<!-- 장바구니 스크립트 -->
<script>
 $("#addCartBtn").on("click", function(e){
	e.preventDefault();
	console.log(this);
	if ($("input[name=mno]").val() == '') {
		alert("먼저 로그인을 해야합니다!");
		location.replace("/member/login");
	} else {
		$("#cartForm").submit();
	}
 });
</script>

<jsp:include page="../common/footer.jsp" />