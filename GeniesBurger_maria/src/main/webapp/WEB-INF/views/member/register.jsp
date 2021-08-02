<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
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

<div class="container container-login">
	<p style="font-size: 2em">회원가입</p>
	<form action="/member/register" method="post" id="registerForm">
		<div class="form-group">
			<input type="email" class="form-control regInput" id="email"
				placeholder="Enter email" name="email">
			<button type="button"
				class="btn btn-danger btn-block input-btn-block" id="checkEmail">중복확인</button>
		</div>
		<div class="form-group">
			<input type="password" class="form-control regInput" id="pwd"
				placeholder="Enter password" name="pwd">
		</div>
		<div class="form-group">
			<input type="password" class="form-control regInput" id="confirmPwd"
				placeholder="Repeat password">
			<p id="confirmMessage"></p>
		</div>
		<div class="form-group">
			<input type="text" class="form-control regInput" id="name"
				placeholder="Enter name" name="name">
		</div>
		<div class="form-group">
			<input type="text" class="form-control regInput" id="mobile"
				placeholder="Enter mobile" name="mobile">
		</div>
		<div class="form-group">
			<select name="question" class="form-control regInput" id="question">
				<option value="본인 확인 질문을 선택하세요.">본인 확인 질문을 선택하세요.</option>
				<option value="어떤 직업을 갖고 싶습니까?">어떤 직업을 갖고 싶습니까?</option>
				<option value="어떤 가수를 좋아하십니까?">어떤 가수를 좋아하십니까?</option>
				<option value="어느 나라에 살고 싶습니까?">어느 나라에 살고 싶습니까?</option>
				<option value="어렸을 때 별명이 무엇이었습니까?">어렸을 때 별명이 무엇이었습니까?</option>
				<option value="가장 좋아하는 동물은 무엇입니까?">가장 좋아하는 동물은 무엇입니까?</option>
				<option value="how are you?">how are you?</option>
			</select>
		</div>
		<div class="form-group">
			<input type="text" class="form-control regInput" id="answer"
				placeholder="Enter answer" name="answer">
		</div>
		<div class="form-group">
			<input type="text" class="form-control regInput" id="address"
				placeholder="Enter address" name="address">
		</div>
		<div class="form-group">
			<input type="date" class="form-control regInput" id="birthday"
				placeholder="Enter birth day" name="birthday">
		</div>
		<button type="button" class="btn-block btn-danger input-btn-block"
			id="submitBtn">가입</button>
	</form>
</div>

<script>
	let isAllowed = false;
	let firstPwd = '';
	let secondPwd = '';
	
	$("#email").on("change", function() {
		isAllowed = false;
	});
	
   $(function() {
      $("#checkEmail").on("click", function(e) {
         e.preventDefault();
         let email_val = $("#email").val();
         $.ajax({
            url: "/member/checkEmail",
            type: "post",
            data: {email: email_val}
         }).done(function(result) {
            if(parseInt(result)==0){
               alert("사용 가능한 이메일입니다!");
               isAllowed = true;
               $("#pwd").focus();
            }else{
               $("#email").focus();
               alert("중복되는 이메일입니다!");
            }
         });
      });
   });
   
   $("#pwd").keyup(function() {
	  firstPwd = $("#pwd").val(); 
	  secondPwd = $("#confirmPwd").val();
	  if (firstPwd == '' && secondPwd == '') {
		  $("#confirmMessage").text("비밀번호를 입력하세요!").css({"color": "blue", "font-size": "15px"});
	  } else if (firstPwd == secondPwd) {
		  $("#confirmMessage").text("비밀번호가 일치합니다!").css({"color": "green", "font-size": "15px"});
	  } else {
		  $("#confirmMessage").text("비밀번호가 일치하지 않습니다!").css({"color": "red", "font-size": "15px"});
	  }
   });
   
   $("#confirmPwd").keyup(function() {
	  firstPwd = $("#pwd").val(); 
	  secondPwd = $("#confirmPwd").val();
	  if (firstPwd == '' && secondPwd == '') {
		  $("#confirmMessage").text("비밀번호를 입력하세요!").css({"color": "blue", "font-size": "15px"});
	  } else if (firstPwd == secondPwd) {
		  $("#confirmMessage").text("비밀번호가 일치합니다!").css({"color": "green", "font-size": "15px"});
	  } else {
		  $("#confirmMessage").text("비밀번호가 일치하지 않습니다!").css({"color": "red", "font-size": "15px"});
	  }
   });
   
   $("#submitBtn").click(function() {
	   console.log("$('#question').val() : " + $("#question").val());
	   console.log("typeof $('#question').val() : " + typeof $("#question").val());
	   let isEmpty = false;
	   firstPwd = $("#pwd").val(); 
       secondPwd = $("#confirmPwd").val();
       
	   $('#registerForm').find('input[type!="hidden"]').each(function(){
	       if(!$(this).val()) {
	    	   isEmpty = true;
	       }
	   });
	   if(isEmpty) {
	       alert('값을 전부 입력하세요!');
	   } else if (!isAllowed) {
		   alert('이메일 중복여부를 확인하세요!');
	   } else if (firstPwd != secondPwd) {
		   alert('비밀번호를 확인하세요!');
	   } else if ($("#question").val() == "본인 확인 질문을 선택하세요.") { 
	   		alert('본인 확인 질문을 선택해주세요!');
	   } else {
		   $("#registerForm").submit();		   
	   }
   });
</script>

<jsp:include page="../common/footer.jsp" />