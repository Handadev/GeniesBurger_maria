<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
<c:choose>
	<c:when test="${ses.email eq 'admin@admin.com' }">
		<div class="container">
			<h2>쿠폰 등록</h2>
				<form action="/coupon/register" id="registForm" method="post">
				  <div class="form-group">
				    <label for="cpname">쿠폰명</label>
				    <input type="text" class="form-control" placeholder="쿠폰명을 입력하세요." id="cpname" name="cpname">
				  </div>
				  <div class="form-group">
				    <label for="discount">할인율(%)</label>
				    <input type="text" class="form-control" placeholder="할인율을 입력하세요." id="discount" name="discount">
				  </div>
				  <div class="form-group">
					  <button type="button" id="couponSbmBtn" class="btn btn-primary">등록</button>
					  <a href="/coupon/list" class="btn btn-primary float-right">목록으로</a>
				  </div>
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
					document.getElementById("registForm").submit();
					alert("쿠폰이 정상적으로 등록되었습니다.");
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