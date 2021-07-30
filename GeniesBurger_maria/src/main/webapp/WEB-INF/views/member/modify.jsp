<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>.
<style>
.regInput{
  margin: auto;
	/* border:none; */
  width: 40%;
  margin-top: 20px;
  background-size: cover;
  background-repeat: repeat-x;
}
.container-login{
	margin-top: 30px;
	margin-bottom: 50px;
  text-align: center;
}
.input-btn-block{
  margin: auto;
  margin-top: 10px;
  border-radius: 1px;
  width: 40%;
}
</style>

<c:choose>
	<c:when test="${ses.email eq mvo.email }">
		<div class="container container-login">
			<p style="font-size: 2em">회원정보수정</p>
			<form action="/member/modify" method="post" id="modifyForm">
				<div class="form-group">
					<input type="email" class="form-control regInput" id="email"
						placeholder="Enter email" name="email" value="${mvo.email }" readonly>
				</div>
				<div class="form-group">
					<input type="password" class="form-control regInput" id="pwd"
						placeholder="Enter password" name="pwd">
				</div>
				<div class="form-group">
					<input type="password" class="form-control regInput"
						id="confirmPwd" placeholder="Repeat password">
					<p id="confirmMessage"></p>
				</div>
				<div class="form-group">
					<input type="text" class="form-control regInput" id="name"
						placeholder="Enter name" name="name" value="${mvo.name }">
				</div>
				<div class="form-group">
					<input type="text" class="form-control regInput" id="mobile"
						placeholder="Enter mobile" name="mobile" value="${mvo.mobile }">
				</div>
				<div class="form-group">
					<input type="text" class="form-control regInput" id="address"
						placeholder="Enter address" name="address" value="${mvo.address }">
				</div>
				<div class="form-group">
					<input type="date" class="form-control regInput" id="birthday"
						placeholder="Enter birth day" name="birthday">
						<input type="hidden" id="hbd" value="${mvo.birthday }">
				</div>
				<button type="button" class="btn-block btn-danger input-btn-block" id="submitBtn">수정</button>
				<button type="button" class="btn btn-secondary input-btn-block" id="delBtn">회원탈퇴</button>
			</form>
		</div>
		<form action="/member/remove" method="post" id="delForm">
			<input type="hidden" value="${mvo.mno }" id="mno" name="mno">
		</form>
	</c:when>
	<c:otherwise>
		<script>
			alert("로그인이 필요한 페이지 입니다!");
			location.replace("/member/login");
		</script>
	</c:otherwise>
</c:choose>
<script>
	let birthday = $("#hbd").val();
	let only_birthday = birthday.substring(0, 10);
	$("#birthday").val(only_birthday);

	$("#delBtn").on("click", removeMember);
	
	function removeMember() {
		if (confirm("정말 탈퇴하시겠습니까?")) { //확인
			$("#delForm").submit();
		} else { //취소
			return;
		}
	};

	let firstPwd = '';
	let secondPwd = '';

	$("#pwd").keyup(function() {
		firstPwd = $("#pwd").val();
		secondPwd = $("#confirmPwd").val();
		if (firstPwd == '' && secondPwd == '') {
			$("#confirmMessage").text("비밀번호를 입력하세요!").css({
				"color" : "blue",
				"font-size" : "15px"
			});
		} else if (firstPwd == secondPwd) {
			$("#confirmMessage").text("비밀번호가 일치합니다!").css({
				"color" : "green",
				"font-size" : "15px"
			});
		} else {
			$("#confirmMessage").text("비밀번호가 일치하지 않습니다!").css({
				"color" : "red",
				"font-size" : "15px"
			});
		}
	});

	$("#confirmPwd").keyup(function() {
		firstPwd = $("#pwd").val();
		secondPwd = $("#confirmPwd").val();
		if (firstPwd == '' && secondPwd == '') {
			$("#confirmMessage").text("비밀번호를 입력하세요!").css({
				"color" : "blue",
				"font-size" : "15px"
			});
		} else if (firstPwd == secondPwd) {
			$("#confirmMessage").text("비밀번호가 일치합니다!").css({
				"color" : "green",
				"font-size" : "15px"
			});
		} else {
			$("#confirmMessage").text("비밀번호가 일치하지 않습니다!").css({
				"color" : "red",
				"font-size" : "15px"
			});
		}
	});

	$("#submitBtn").click(function() {
		let isEmpty = false;
		$('#modifyForm').find('input[type!="hidden"]').each(function() {
			if (!$(this).val()) {
				isEmpty = true;
			}
		});
		if (isEmpty) {
			alert('값을 전부 입력하세요!');
		} else if (firstPwd != secondPwd) {
			alert('비밀번호를 확인하세요!');
		} else {
			$("#modifyForm").submit();
		}
	});
</script>

<jsp:include page="../common/footer.jsp" />