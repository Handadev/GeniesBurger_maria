<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
<%-- <c:choose>
	<c:when test="${ses.email eq 'admin@admin.com' }"> --%>
	<div class="container">
		<h2 class="float-left">쿠폰 정보</h2>
		<a href="/coupon/list?pageIndex=${cpgvo.pageIndex}&countPerPage=${cpgvo.countPerPage}&range=${cpgvo.range}&keyword=${cpgvo.keyword}" class="btn btn-primary float-right">목록으로</a>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>Class</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>쿠폰 번호</td>
					<td>${cpvo.cpno }</td>
				</tr>
				<tr>
					<td>쿠폰명</td>
					<td>${cpvo.cpname }</td>
				</tr>
				<tr>
					<td>할인율(%)</td>
					<td>${cpvo.discount }%</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="2"><a href="/coupon/modify?cpno=${cpvo.cpno }" class="btn btn-primary mr-3">수정</a>
						<a href="#" id="deleteCpBtn" class="btn btn-primary ml-3">삭제</a>
						<form action="/coupon/remove" id="deleteCpForm" method="post">
							<input type="hidden" name="cpno" value="${cpvo.cpno }">
						</form> 
						<script src="/resources/js/jquery.min.js"></script>
						<script>
							$("#deleteCpBtn").on("click", function() {
								$("#deleteCpForm").submit();
							});
						</script>
					</td>
				</tr>
			</tfoot>
		</table>
	</div>
	<%-- </c:when>
			<c:otherwise>
			<script>
				alert("관리자 로그인이 필요한 페이지 입니다!");
				location.replace("/member/login");
			</script>
			</c:otherwise>
		</c:choose> --%>
<jsp:include page="../adminCommon/footer.jsp" />
