<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<style>
.subtitle {
	font-size: 3em;
}
.main {
	background-color: #F1EAE5;
	padding: 50px 0px 45px
}
.inner {
	background-color: #ffffff;
	margin: 0px auto;
	padding: 20px 50px;
	font-size: 1.5em;
}
.box {
	text-align: center;
}
input[name='name'] {
	margin-bottom: 10px;
}
li {
	font-size: 15px;
}
.btndiv {
	text-align: center;
	height: 100px;
	margin-top: 30px;
}
#submitBtn {
	 margin: 0px auto;
	 background-image: url(/resources/icons/button2.png);
	 background-repeat: no-repeat;
     background-position: 0px -10px;
     background-size: cover;
     background-color: transparent;
     border: none;
     cursor: pointer;
     width: 300px;
     height: 100px;
     color: white;
     font-size: 1.5em;
}
</style>

<div class="main">
	<div class="container">
		<div>
			<p class="subtitle"><b>아이디 찾기</b></p>
		</div>
		<div class="inner">
			<p>가입 시 회원정보로 등록한 이름과 휴대폰 번호를 입력해 주세요.</p>
			<hr>
			<form action="/member/findID" method="post" id="findIDForm">
				<div class="box">
					<b>이름</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="name" placeholder=" 이름"><br>
					<b>휴대폰 번호</b>&nbsp;
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="mobile" placeholder=" 휴대폰 번호">
				</div>
			</form>
			<hr>
			<div class="info">
				<ul>
					<li>가입 시 입력한 이름과 휴대폰번호로 아이디 정보를 찾을 수 있습니다.</li>
					<li>휴대폰 번호는 "-"를 제외한 숫자만 입력하세요.</li>
				</ul>
			</div>
		</div>
		<div class="btndiv">
			<button type="button" id="submitBtn"><span>아이디 찾기</span></button>
		</div>
	</div>
</div>

<script>
$("#submitBtn").click(function() {
	let name_val = $("input[name=name]").val();
	let mobile_val = $("input[name=mobile]").val();
	
	if (name_val == "") {
		alert("이름을 입력하세요!");
	} else if (mobile_val == "") {
		alert("휴대폰 번호를 입력하세요!")
	} else {
		$("#findIDForm").submit();
	}
});
</script>

<jsp:include page="../common/footer.jsp" />