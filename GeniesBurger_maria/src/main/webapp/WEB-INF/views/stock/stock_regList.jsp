<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
<!-- ============================================================== -->
<!-- Bread crumb and right sidebar toggle -->
<!-- ============================================================== -->
<div class="page-breadcrumb">
	<div class="row">
		<div class="col-7 align-self-center">
			<h3
				class="page-title text-truncate text-dark font-weight-medium mb-1">
				입고 현황</h3>
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
					<div class="form-group float-left ml-3">
						<form action="/stock/stock_regList" class="form-inline">
							<input type="date" class="float-left mr-3" name="stock_regdate"
								value="${srpghdl.srpgvo.stock_regdate }"> <select
								class="form-control" name="range">
								<option value="all"
									<c:out value="${srpghdl.srpgvo.range eq 'nd' ? 'selected' : '' }"/>>
									전체</option>
								<option value="no"
									<c:out value="${srpghdl.srpgvo.range eq 'no' ? 'selected' : '' }"/>>
									입고 번호</option>
								<option value="na"
									<c:out value="${srpghdl.srpgvo.range eq 'na' ? 'selected' : '' }"/>>
									재고명</option>
								<option value="q"
									<c:out value="${srpghdl.srpgvo.range eq 'q' ? 'selected' : '' }"/>>
									유통기한</option>
							</select> <input class="form-control" type="text" placeholder="검색어 입력"
								name="keyword"
								value='<c:out value="${srpghdl.srpgvo.keyword }"/>'>
							<button type="submit" class="btn btn-success">검색</button>
						</form>
					</div>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>입고 번호</th>
								<th>재고명</th>
								<th>유통기한</th>
								<th>주문일</th>
							</tr>
						</thead>
						<c:choose>
							<c:when test="${dateList.size() ne 0 }">
								<tbody>
									<c:forEach items="${dateList }" var="svo">
										<tr>
											<td>${svo.sno }</td>
											<td>${svo.sname }</td>
											<td>${svo.shelf_life }</td>
											<td>${svo.stock_regdate }</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="4"><jsp:include page="paging.jsp" /></td>
									</tr>
								</tfoot>
							</c:when>
							<c:otherwise>
								<tbody>
									<tr>
										<td colspan="4" class="text-center">입고 내역이 없습니다.</td>
									</tr>
								</tbody>
							</c:otherwise>
						</c:choose>
					</table>
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
<jsp:include page="../adminCommon/footer.jsp" />