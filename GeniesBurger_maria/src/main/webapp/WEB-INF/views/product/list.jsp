<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="../common/header.jsp" />

<style>
.pcontainer {
	padding-top: 50px;
	padding-bottom: 50px;
}
.page {
	margin-top: 40px;
	text-align: center;
}
.pagination {
	display: inline-flex; 
}
p{
	font-size:2em;
	color:black;
}
</style>
<div class="container-fluid border pcontainer">
	<div class="container col-sm-9">
		<p class="float-left">상품 목록<p>
		<div class="form-group float-right">
			<form action="/product/list" class="form-inline">
				<select class="form-control" name="range">
					<option value="propri">전체</option>
					<option value="pro">제품명</option>
					<option value="pri">가격</option>
				</select> <input class=form-control type="text" placeholder="검색어 입력"
					name="keyword" value="<c:out value='${product_paging.ppgvo.keyword }'/>">
				<button type="submit" class="btn-lg btn-success">검색</button>
			</form>
		</div>
		<table class="table">
			<thead>
				<tr>
					<th>제품번호</th>
					<th>제품명</th>
					<th>가격</th>
					<th>판매량</th>
					<th>판매중여부</th>
					<th>등록일</th>
					<th>수정일</th>
					<th>기능</th>
				</tr>
			</thead>
			<c:choose>
				<c:when test="${product_list.size() ne 0 }">
					<tbody>
						<c:forEach items="${product_list }" var="pvo">
							<tr>
								<td>${pvo.pno }</td>
								<td><a href="/product/detail?pno=${pvo.pno }"
								style="color:black">${pvo.title }</a></td>
								<td><fmt:formatNumber value="${pvo.price }" pattern="#,###"/></td>
								<td>${pvo.sales }</td>
								<td><c:choose>
										<c:when test="${pvo.cansale eq 0}">
											<span>판매중</span>
										</c:when>
										<c:otherwise>
											<span>일시품절</span>
										</c:otherwise>
									</c:choose></td>
								<td>${pvo.regdate }</td>
								<td>${pvo.moddate }</td>
								<td><a href="/product/modify?pno=${pvo.pno }"
									class="btn btn-warning">상품수정</a>
									<button type="button" class="btn btn-danger del-btn">상품삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>

				</c:when>
				<c:otherwise>
					<tbody>
						<tr>
							<th colspan="8" class="text-center">
								<h2>등록된 상품이 없습니다! 상품을 등록하세요</h2> <a href="/product/register"
								class="btn btn-primary">상품등록</a>
							</th>
						</tr>
					</tbody>
				</c:otherwise>
			</c:choose>
		</table>
			<div class="container page">
				<ul class="pagination">
					<c:if test="${product_paging.prev }">
						<li class="page-item"><a class="page-link"
							href="/product/list?pageIndex=${product_paging.firstPageIndex-1 }&countPerPage=${product_paging.ppgvo.countPerPage}&range=${product_paging.ppgvo.range}&keyword=${product_paging.ppgvo.keyword}">
								Previous</a></li>
					</c:if>
					<c:forEach begin="${product_paging.firstPageIndex }"
						end="${product_paging.lastPageIndex }" var="i">
						<li
							class="page-item ${product_paging.ppgvo.pageIndex == i ? 'active' : '' }"><a
							class="page-link"
							href="/product/list?pageIndex=${i }&countPerPage=${product_paging.ppgvo.countPerPage}&range=${product_paging.ppgvo.range}&keyword=${product_paging.ppgvo.keyword}">
								${i }</a></li>
					</c:forEach>
					<c:if test="${product_paging.next }">
						<li class="page-item"><a class="page-link"
							href="/product/list?pageIndex=${product_paging.lastPageIndex+1 }&countPerPage=${product_paging.ppgvo.countPerPage}&range=${product_paging.ppgvo.range}&keyword=${product_paging.ppgvo.keyword}">
								Next</a></li>
					</c:if>
				</ul>
			</div>
	</div>
</div>

<form action="/product/remove" method="post" id="rmForm">
	<input type="hidden" name="pno">
</form>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
	$(document).on("click", ".del-btn", function(e) {
		e.preventDefault();
		let pno_num = $(this).closest("tr").find("td").eq(0).text();
		$("input[name=pno]").val(pno_num);
		$("#rmForm").submit();
	});
</script>
<script>
	$(document).on("click", ".cartBtn", function(e){
		e.preventDefault();
		let cart_val = $(this).data("cartBtn");
		console.log(cart_val);

	})
</script>

<jsp:include page="../common/footer.jsp" />