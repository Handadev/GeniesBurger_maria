<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
.footerText {
   color: #6A6A69;
}
.footerItem {
   list-style: none;
}
.footerMenu {
   float: right; 
   background-color: #6A6A69; 
   color: white;
   border-radius: 4px;
   font-size: 13px;
   padding: 2px 10px;
}
.sns {
   width: 36px
}
.ftco-footer {
   background-color: #282828;
   font-size: 15px;
}
</style>

<!-- Start footer -->

<footer class="ftco-footer ftco-section">
  <div class="container">
  <div id="warning" class="footerText">
     <img src="/resources/images/footer_logo.png" style="width: 200px;">
     <hr>
     <div>
     <ul class="footerItem">
<span style="float: right;">이용약관 | 개인정보취급방침 |  법적고지</span>
<li class="footerText">서울특별시 서초구 서초대로77길 54 (서초더블유타워 13,14층) | T. 02-532-6500</li>
<span class="footerMenu" style="margin-left: 5px;">가맹점모집</span>
<span class="footerMenu">인재채용</span>
<li class="footerText">사업자등록번호 : 153-88-00321 | 대표자 : 박현진</li>
<li class="footerText">Copyright by EZEN. All rights reserved.</li>
<li style="margin-top: 6px;"><img src="/resources/icons/fb.png" class="sns">&nbsp;
<img src="/resources/icons/insta.png" class="sns"></li>
</ul>
     </div>
  </div>
  
  </div>
  <script>
   let result = '<c:out value="${result}"/>';
   if (result != "") {
      alert(result);
   }
</script>

<script>
// 전역변수 설정
var socket  = null;

$(document).ready(function(){
connect();
});

function connect() {
	   // 웹소켓 연결
	  var sock = new SockJS('<c:url value="/reviewSock"/>');
	   socket = sock;
	
	sock.onopen = function() {
		console.log("연결!!");
	};
	   // 데이터를 전달 받았을때 
	sock.onmessage = function(event) {
	   	console.log("받은 메시지 : "+event.data+"\n");
	   	let data = event.data;
	   	let toast = "<div class='toast' role='alert' aria-live='assertive' aria-atomic='true'>";
	   	toast += "<div class='toast-header'><i class='fas fa-bell mr-2'></i><strong class='mr-auto'>알림</strong>";
	   	toast += "<small class='text-muted'>just now</small><button type='button' class='ml-2 mb-1 close' data-dismiss='toast' aria-label='Close'>";
	   	toast += "<span aria-hidden='true'>&times;</span></button>";
	   	toast += "</div> <div class='toast-body'>" + data + "</div></div>";
	   	$("#msgStack").append(toast);   // msgStack div에 생성한 toast 추가
	   	$(".toast").toast({"animation": true, "autohide": false});
	   	$('.toast').toast('show');
	};	
	
	sock.onclose = function(event) {
		console.log("연결종료" + event);
	};
}
</script>
</footer>




<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
<script src="/resources/js/popper.min.js"></script>
<script src="/resources/js/bootstrap.min.js"></script>
<script src="/resources/js/jquery.easing.1.3.js"></script>
<script src="/resources/js/jquery.waypoints.min.js"></script>
<script src="/resources/js/jquery.stellar.min.js"></script>
<script src="/resources/js/owl.carousel.min.js"></script>
<script src="/resources/js/jquery.magnific-popup.min.js"></script>
<script src="/resources/js/aos.js"></script>
<script src="/resources/js/jquery.animateNumber.min.js"></script>
<script src="/resources/js/bootstrap-datepicker.js"></script>
<script src="/resources/js/scrollax.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
<script src="/resources/js/google-map.js"></script>
<script src="/resources/js/main.js"></script>
  
</body>
</html>