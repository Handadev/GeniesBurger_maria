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
	font-size: 3em;
}
.btndiv {
	text-align: center;
	height: 100px;
	margin-top: 30px;
}
#findID {
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
#login {
	 margin: 0px auto;
	 background-image: url(/resources/icons/button.png);
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
			<p>${mvo.email } 계정 비밀번호</p>
			<hr>
			<div class="box">
				<p>${mvo.pwd }</p>
			</div>
		</div>
		<div class="btndiv">
			<button type="button" id="findID" onclick="location.href='/member/findID'"><b>아이디 찾기</b></button>
			<button type="button" id="login" onclick="location.href='/member/login'"><b>로그인</b></button>
		</div>
	</div>
</div>

<jsp:include page="../common/footer.jsp" />