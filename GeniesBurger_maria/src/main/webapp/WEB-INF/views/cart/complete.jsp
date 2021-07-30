<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../payCommon/header_04.jsp" />
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<style>
* {
    font-size: 22px;
  }

.box {
    border: none;
    width: 850px;
    height: 750px;
    margin: auto;
  }

.img {
	width: 500px;
}
div {
	text-align: center;
}
.order {
	font-size: 1.8em;
}
.orderNum {
	font-size: 1.5em;
	color: red;
}
#ranNum {
	font-size: 7.0em;
	color: red;
	line-height: 200px;
}
.receipt {
	font-size: 1.5em;
}
#mno {
	display: none;
}
</style>

<div class="container p-3 my-3 border">
	<span class="order">주문이 완료되었습니다!</span><br><br>
	<span class="orderNum">주문번호</span><br>
	<span id="ranNum"></span><br><br>
	<span class="receipt">신용카드를 뽑은 후</span><br>
	<span class="receipt">출력된 영수증을 받아가세요!</span><br><br><br>
	<span id="mno">${ses.mno }</span>	
	<img src="/resources/images/complete.png" class="img" id="img">
	<br><br><br><br><br><br><br>
</div>

<script>
// 할인 금액
if(localStorage.getItem('price')) {
	var data = localStorage.getItem('price');
	console.log("***data : " + data);
}
var arr = [];
var count = 0;
for (var i = 0; i < data.length; i++) {
	if(data.charAt(i) == ",") {
		count++;
	}
}
for (var i = 0; i < count+1; i++) {
	arr[i] = data.split(",")[i];
}
console.log(arr); // arr ctrl로 넘겨줘야됨~~~~~~~~

let ranNum = Math.floor((Math.random() * 900)+100)
$("#ranNum").text(ranNum);

$("#img").click(function() {
	let mno_val = $("#mno").text();
	console.log(mno_val);
	if (mno_val == '') {
		alert("세션이 만료되었습니다. 다시 로그인해주세요!");
		location.replace("/member/login");
	} else {
		$.ajax({
			url: "/cart/mno/",
			type: "post",
			data:{
				mno:mno_val,
				list : arr
				}
		}).done(function(result) {
			alert("이용해주셔서 감사합니다~");
			location.replace("/");
		}).fail(function(err) {
			alert("오류가 발생했습니다");
		});
	}
});
</script>

