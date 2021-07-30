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
	margin-bottom: 20px;
}
.question {
	font-size: 2em;
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
			<p>본인 확인 질문에 답하세요.</p>
			<hr>
			<form action="/member/findPwd" method="post" id="findPwdForm">
				<input type="hidden" name="email" value="${mvo.email }">
				<div class="box">
					<b class="question">Q. ${mvo.question }</b>
					<div>
						<b>본인 확인 답변</b>&nbsp;
						<input type="text" name="answer" placeholder=" 답변을 입력하세요">
					</div>
				</div>
			</form>
		</div>
		<div class="btndiv">
			<button type="button" id="submitBtn"><span>비밀번호 찾기</span></button>
		</div>
	</div>
</div>

<script>
$("#submitBtn").click(function() {
	$("#findPwdForm").submit();
});
</script>

<jsp:include page="../common/footer.jsp" />