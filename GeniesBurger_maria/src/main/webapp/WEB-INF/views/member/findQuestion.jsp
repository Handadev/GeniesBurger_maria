<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
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
			<p class="subtitle"><b>비밀번호 찾기</b></p>
		</div>
		<div class="inner">
			<p>가입시 회원정보로 등록한 이름과 이메일 주소를 입력해 주세요.</p>
			<hr>
			<form action="/member/findQuestion" method="post" id="findQuestionForm">
				<div class="box">
					<b>이름</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;
					<input type="text" name="name" placeholder=" 이름"><br>
					<b>이메일 주소</b>&nbsp;
					&nbsp;&nbsp;&nbsp;
					<input type="email" name="email" placeholder=" 이메일 주소">
				</div>
			</form>
			<hr>
			<div class="info">
				<ul>
					<li>가입 시 입력한 이름과 이메일 주소로 비밀번호 정보를 찾을 수 있습니다.</li>
					<li>이메일 주소는 이메일 형식에 맞게 작성해주세요.</li>
				</ul>
			</div>
		</div>
		<div class="btndiv">
			<button type="button" id="submitBtn"><span>비밀번호 찾기</span></button>
		</div>
	</div>
</div>

<script>
$("#submitBtn").click(function() {
	let name_val = $("input[name=name]").val();
	let email_val = $("input[name=email]").val();
	
	if (name_val == "") {
		alert("이름을 입력하세요!");
	} else if (email_val == "") {
		alert("이메일 주소를 입력하세요!")
	} else {
		$("#findQuestionForm").submit();
	}
});
</script>

<jsp:include page="../common/footer.jsp" />