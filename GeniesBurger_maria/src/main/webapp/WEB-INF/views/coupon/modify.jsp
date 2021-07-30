<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
<c:choose>
	<c:when test="${ses.email eq 'admin@admin.com' }">
	<div class="container">
		<h2>쿠폰 수정</h2>
		<form action="/coupon/modify" method="post" id="modifyForm">
			<input type="hidden" name="cpno" value="${cpvo.cpno }">
			<div class="form-group">
				<label for="cpname">쿠폰명</label> <input type="text"
					class="form-control" value="${cpvo.cpname }" id="cpname" name="cpname">
			</div>
			<div class="form-group">
				<label for="discount">할인율(%)</label> <input type="text"
					class="form-control" value="${cpvo.discount }" id="discount" name="discount">
			</div>
	
			<button type="button" class="btn btn-primary" id="couponSbmBtn">수정</button>
		</form>
	</div>
	<script src="/resources/js/jquery.min.js"></script>
		<script>
		$("#couponSbmBtn").on("click", function() {
			var cpname = $("#cpname").val();
			var discount = $("#discount").val();

			if (cpname == "" || cpname == null) {
				alert("쿠폰명을 입력해주세요.");
				$("#cpname").focus();
			} else if (discount == "" || discount == null) {
				alert("할인율을 입력해주세요.");
				$("#discount").focus();
			} else {
				document.getElementById("modifyForm").submit();
				alert("쿠폰이 정상적으로 수정되었습니다.");
			}
		});
		</script>
		</c:when>
			<c:otherwise>
			<script>
				alert("관리자 로그인이 필요한 페이지 입니다!");
				location.replace("/member/login");
			</script>
			</c:otherwise>
		</c:choose>
<jsp:include page="../adminCommon/footer.jsp" />
