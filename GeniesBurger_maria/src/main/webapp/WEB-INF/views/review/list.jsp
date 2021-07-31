<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<style>
#textarea {
	resize: none;
	width:100%;
	height: 100px;
	margin-top: 20px;
}
img{
	border-radius: 10px;
	margin-right: 20px;
}
.card{
	padding: 20px 20px 20px 20px;
	background-color: #f5f5f5;
	margin-bottom: 40px;
	border-radius: 10px;
}
#userComment {
	background-color: white;
	border-radius: 10px;
	height: 100px;
}
#adComment {
	background-color: white;
	border-radius: 10px;
	height: 100px;
	margin-top: 20px;
}
body{
background-color: #F1EAE5;
}
</style>
<div class="container" style="margin-top: 40px;">
	<c:choose>
		<c:when
			test="${list[0].title eq null || list[0].title eq  '' }">
			<img src="/resources/icons/no_review_list_logo.png"
				style="width: 350px; display: block; margin: auto; margin-top: 50px;">
		</c:when>
		<c:otherwise>
	<c:forEach items="${list }" var="rvo">
		<div class="card shadow radius">
			<div class="media">
				<a class="align-self-center" href="#">
				<c:if test="${rvo.rftype eq 1 }">
					<img src="/upload/${rvo.rsavedir }/${rvo.ruuid}_th_${rvo.rfname}" style="width:160px; height:100px;"/>
				</c:if>
				</a>
				<div class="media-body">
					<div>
						<span style="font-size: 20px;">상품명 : ${rvo.title }</span>
					</div>
					<div id="userComment">
					&nbsp;&nbsp;<b>${rvo.email }&nbsp;&nbsp;</b><span style="font-weight:lighter;">${rvo.rdate }</span><br>&nbsp;&nbsp;${rvo.rcontent }
					</div>
					<c:if test="${rvo.clist.size() > 0}">
						<c:forEach items="${rvo.clist }" var="cvo">
							<div id="adComment">
								&nbsp;&nbsp;<b>점장님 댓글!</b>&nbsp;&nbsp;<span style="font-weight:lighter;">${cvo.addate }</span>
								<br>
								<br>
								<span>&nbsp;&nbsp;${cvo.adcomment }</span>
							</div>
							<c:if test="${ses.email eq 'admin@admin.com' }">
							<button type="button" class="btn-sm btn-danger float-right adDel" style="margin-top: 20px;">삭제</button>
							<button type="button" class="btn-sm btn-success float-right adUp" style="margin-top: 20px; margin-right: 10px;">수정</button>
							<input type="hidden" value="${rvo.rno }">
							<input type="hidden" value="${cvo.acno }">
							</c:if>
						</c:forEach>
					</c:if>
					<c:if test="${ses.email eq 'admin@admin.com' && rvo.clist.size() == 0 }">
							<input type="hidden" value="${rvo.rno }">
							<textarea id="textarea" disabled></textarea>
							<button type="button" class="btn-sm btn-success adWrite float-right">댓글 작성</button>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
	</c:otherwise>
	</c:choose>
<jsp:include page="reviewFooter.jsp"></jsp:include>
</div>

<script src="/resources/js/jquery.min.js"></script>
<script>
var div;
$(document).on("click",".adWrite",function() {
	$(this).prev("textarea").attr("disabled",false);
	$(this).attr("class","btn-sm btn-danger float-right cancel");
	$(this).attr("style","margin-right: 20px;");
	$(this).text("취소");
	$(this).before("<button type='button' class='btn-sm btn-success adReg float-right'>작성 완료</button>");
});

$(document).on("click",".cancel",function() {
	$(this).siblings("textarea").attr("disabled",true);
	$(this).siblings("textarea").val("");
	$(this).attr("class","btn btn-success adWrite float-right");
	$(this).text("댓글 작성");
	$("button.adReg").remove();
});

$(document).on("click",".adReg",function() {
	let writer = $(this).prev("textarea").prev("input").prev("div").find("b").text().trim();
	let adComment = $(this).siblings("textarea").val();
	let rno = $(this).siblings("input").val();
	// (review,관리자,유저)	
	$.ajax({
		url : "/review/addAdComment",
		type : "post",
		data : {
			rno : rno,
			adComment : adComment
		}
	}).done(function(result) {
		if(result == 1){
			alert("댓글이 등록되었습니당 ㅎㅎ");
			socket.send("점장님이 내 리뷰에 댓글을 달았습니다.," + writer);
			location.reload();
		} else {
			alert("댓글 등록 실패!! ㅠㅜ");
			location.reload();
		}
	});
});

$(document).on("click",".adUp",function() {
	let adComment = $(this).prev("button").prev("div").find("span").eq("1").text();
	adComment = adComment.trim();
	div = $(this).prev("button").prev("div").detach();
	$(this).prev("button").before("<textarea style='width: 100%; height: 100px; margin-top: 10px;'>"+adComment+"</textarea>");
	$(this).attr("class","btn btn-success float-right adRealUp");
	$(this).attr("style","margin-top: 20px; margin-right: 10px;");
	$(this).text("수정완료");
	$(this).prev("button").attr("class","btn-sm btn-danger float-right upCancel");
	$(this).prev("button").attr("style","margin-top: 20px;");
	$(this).prev("button").text("취소");
	
});

$(document).on("click",".upCancel", function() {
	$(this).prev("textarea").remove();
	$(this).before(div);
	$(this).attr("class","btn btn-danger float-right adDel");
	$(this).attr("style","margin-top: 20px;");
	$(this).text("삭제");
	$(this).next("button").attr("class","btn-sm btn-success float-right adUp");
	$(this).next("button").attr("style","margin-top: 20px; margin-right: 10px;");
	$(this).next("button").text("수정");
});

$(document).on("click",".adRealUp",function() {
	let adComment = $(this).prev("button").prev("textarea").val();
	let rno = $(this).next("input").val();
	console.log(adComment);
	$.ajax({
		url: "/review/acUpdate",
		type: "post",
		data: {
			adComment:adComment,
			rno:rno
		}
	}).done(function(result) {
		if(result == 1) {
			alert("댓글수정 완료!");
			location.reload();
		} else {
			alert("댓글 수정 실패 ㅠㅜ");
			location.reload();
		}
	});
});

$(document).on("click",".adDel",function() {
		if (confirm("정말 삭제 하시겠습니까?")) {
			let acno = $(this).next("button").next("input").next("input").val();
			
			$.ajax({
				url : "/review/acDelete",
				type : "post",
				data : {
					acno : acno
				}
			}).done(function(result) {
				if (result == 1) {
					alert("댓글이 삭제 되었습니다!");
					location.reload();
				} else {
					alert("댓글 삭제 실패 ㅠㅜ");
					location.reload();
				}
			});
		}
});
</script>
<jsp:include page="../common/footer.jsp" />
