<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../payCommon/header_02.jsp" />
<style>
  * {
    font-size: 22px;
  }

  .box {
    box-shadow: 1px 1px 1px 1px;
    border: none;
    width: 850px;
    height: 750px;
    margin: auto;
  }

  .img {
    width: 350px;
  }

  span {
    font-size: 1.8em;
    font-weight: bold;
  }

  .method {
    color: red;
  }

  .choose {
    color: black;
  }

  div {
    text-align: center;
  }
</style>

<div class="container p-3 my-3 box">
    <span class="method">결제 수단을</span><br>
    <span class="choose">선택해주세요</span><br><br>
    <a href="creditcard"><img src="/resources/images/creditcard2.png" class="img"></a>
    <a href="#"><img src="/resources/images/payco.png" class="img"></a>
    <br><br><br><br><br><br><br>
  </div>
<script>
var data = '';
	if(localStorage.getItem('price')) {
		data = localStorage.getItem('price');
		console.log("***data : " + data);
	}
</script>
<jsp:include page="../payCommon/payFooter.jsp" />