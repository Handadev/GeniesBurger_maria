<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<!-- ============================================================== -->
	<!-- Preloader - style you can find in spinners.css -->
	<!-- ============================================================== -->
	<div class="preloader">
		<div class="lds-ripple">
			<div class="lds-pos"></div>
			<div class="lds-pos"></div>
		</div>
	</div>
	<!-- ============================================================== -->
	<!-- Main wrapper - style you can find in pages.scss -->
	<!-- ============================================================== -->
	<div id="main-wrapper" data-theme="light" data-layout="vertical"
		data-navbarbg="skin6" data-sidebartype="full"
		data-sidebar-position="fixed" data-header-position="fixed"
		data-boxed-layout="full">
		<!-- ============================================================== -->
		<!-- Topbar header - style you can find in pages.scss -->
		<!-- ============================================================== -->
		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md">
				<div class="navbar-header" data-logobg="skin6">
					<!-- This is for the sidebar toggle which is visible on mobile only -->
					<a class="nav-toggler waves-effect waves-light d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
					<!-- ============================================================== -->
					<!-- Logo -->
					<!-- ============================================================== -->
					<div class="navbar-brand">
						<!-- Logo icon -->
						<a href="/sales/sales_detail"> <b class="logo-icon"> <!-- Dark Logo icon -->
								<img src="/resources/admin/assets/images/genies_logo.png" style="width: 70px; height: 70px;"  alt="homepage"
								class="dark-logo" /> <!-- Light Logo icon --> <img
								src="/resources/admin/assets/images/genies_logo.png" alt="homepage"
								class="light-logo" />
						</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
								<!-- dark Logo text --> <img src="/resources/admin/assets/images/genies_logo_text.png"
								alt="homepage" class="dark-logo" />
						</span>
						</a>
					</div>
					<a class="topbartoggler d-block d-md-none waves-effect waves-light"
						href="javascript:void(0)" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation"><i class="ti-more"></i></a>
				</div>
				<div class="navbar-collapse collapse justify-content-end" id="navbarSupportedContent">
					
					<div style="margin-right:35px;">
						<a href="/" class="btn btn-warning">Genie's Burger</a>
					</div>
				</div>
			</nav>
		</header>