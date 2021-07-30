<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
	<div class="container">
		<h2>재고 주문</h2>
			<form action="/stockOrder/register" id="registForm" method="post">
			  <div class="form-group">
			    <label for="sname">재고명</label>
			    <input type="text" class="form-control" placeholder="재고명을 입력하세요." id="sname" name="sname">
			  </div>
			  <div class="form-group">
			    <label for="order_qty">주문 수량</label>
			    <input type="text" class="form-control" placeholder="주문 수량을 입력하세요." id="order_qty" name="order_qty">
			  </div>
			  <div class="form-group">
				  <button type="button" id="stockOdBtn" class="btn btn-primary">주문</button>
				  <a href="/stockOrder/dateList" class="btn btn-primary float-right">목록으로</a>
			  </div>
			</form>
		</div>
		<script src="/resources/js/jquery.min.js"></script>
		<script>
		$("#stockOdBtn").on("click", function() {
			var sname = $("#sname").val();
			var order_qty = $("#order_qty").val();

			if (sname == "" || sname == null) {
				alert("재고명을 입력해주세요.");
				$("#sname").focus();
			} else if (order_qty == "" || order_qty == null) {
				alert("주문 수량을 입력해주세요.");
				$("#order_qty").focus();
			} else {
				document.getElementById("registForm").submit();
				alert("정상적으로 주문완료되었습니다.");
			}
		});
		</script>
<jsp:include page="../adminCommon/footer.jsp" />