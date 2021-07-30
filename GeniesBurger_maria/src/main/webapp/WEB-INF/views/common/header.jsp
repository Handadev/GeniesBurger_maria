<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Genie's Burger</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/open-iconic-bootstrap.min.css">
<link rel="stylesheet" href="/resources/css/animate.css">
<link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
<link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
<link rel="stylesheet" href="/resources/css/magnific-popup.css">
<link rel="stylesheet" href="/resources/css/aos.css">
<link rel="stylesheet" href="/resources/css/ionicons.min.css">
<link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
<link rel="stylesheet" href="/resources/css/jquery.timepicker.css">
<link rel="stylesheet" href="/resources/css/flaticon.css">
<link rel="stylesheet" href="/resources/css/icomoon.css">
<link rel="stylesheet" href="/resources/css/style.css">
<link rel="shortcut icon" href="/resources/icons/favicon.png">
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">

</head>
<style>
.welcomeAtag:hover {
	color: #ffffff;
}

.myImg {
	margin-right: 10px;
	margin-top: 7px;
}

.welcome {
	margin-top: 11px;
	margin-left: 5px;
}
</style>
<!-- Start header / nav  -->
<body class="goto-here">
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="/" id="logo"> <img
				src="/resources/icons/logo.png" style="width: 70px; height: 70px;" />
				<span id="logo-text" style="margin-left: 20px">지니스버거</span>
			</a>

		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#ftco-nav" aria-controls="ftco-nav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="oi oi-menu"></span> Menu
		</button>
		<div class="collapse navbar-collapse" id="ftco-nav"
			style="margin-right: 50px;">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item dropdown"><c:choose>
						<c:when test="${ses.email ne null && ses.email ne '' }">
							<li class="nav-item"><a href="/member/logout"
								class="nav-link">logout</a></li>
						</c:when>
						<c:otherwise>
							<li class="nav-item"><a class="nav-link"
								href="/member/login">Login</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/member/register">Register</a></li>
						</c:otherwise>
					</c:choose></li>
				<li class="nav-item"><a href="/review/list" class="nav-link">Review</a></li>
				<c:if test="${ses.email eq 'admin@admin.com' }">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="dropdown04"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">PRODUCT</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<c:choose>
								<c:when test="${ses.email eq 'admin@admin.com' }">
									<a class="dropdown-item" href="/product/register">PRODUCT REGISTER</a>
								</c:when>
							</c:choose>
							<a class="dropdown-item" href="/product/list">PRODUCT LIST</a>
						</div></li>
				</c:if>
				<c:choose>
					<c:when test="${ses.email eq 'admin@admin.com' }">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="dropdown04"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">ADMIN</a>
							<div class="dropdown-menu" aria-labelledby="dropdown04">
								<a class="dropdown-item" href="/member/detail?mno=${ses.mno }">
									MY PAGE</a> <a class="dropdown-item" href="/sales/sales_detail">ADMIN
									PAGE</a> <a class="dropdown-item" href="/member/list">MEMBER
									LIST</a> <a class="dropdown-item" href="/cart/purchaseList">PURCHASE
									PAGE</a>
							</div>
					</c:when>
					<c:when
						test="${ses.email ne null && ses.email ne '' && ses.email ne 'admin@admin.com' }">
						<li>
							<div class="welcome">
								<div class="float-left myImg">
									<a href="/member/detail?mno=${ses.mno }"> <img
										src="/resources/icons/who.png"
										style="width: 45px; height: 45px;" />
									</a>
								</div>
								<div style="width: 200px;">
									<a href="/member/detail?mno=${ses.mno }" class="welcomeAtag">
										<strong>${ses.name}</strong><br> my page
									</a>
								</div>
							</div>
						</li>
					</c:when>
					<c:otherwise>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</nav>
	<div>
		<div class="container-fluid" id="navBtn">
			<div class="row">
				<c:choose>
					<c:when test="${ses.mno ne null && ses.mno ne '' }">
						<div class="col">
							<a href="/cart/purchaseListMember?mno=${ses.mno }" id="navOrder">
								<strong>주문내역</strong>
							</a>
						</div>
						<div class="col">
							<a href="/cart/cart?mno=${ses.mno }" id="navCart"> <strong>장바구니</strong>
							</a>
						</div>
					</c:when>
					<c:when test="${ses.mno eq null || ses.mno eq '' }">
						<div class="col">
							<a href="#" id="navOrder"> <strong>주문내역</strong>
							</a>
						</div>
						<div class="col">
							<a href="#" id="navCart"> <strong>장바구니</strong>
							</a>
						</div>
						<script src="/resources/js/jquery-3.2.1.min.js"></script>
						<script>
							$("#navOrder, #navCart").click(function(e) {
								e.preventDefault();
								alert("먼저 로그인을 해야합니다!");
								location.replace("/member/login");
							});
						</script>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>
	<!-- END header / nav -->