<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />
<style>
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
#adComment {
	background-color: white;
	border-radius: 10px;
	height: 100px;
	margin-top: 20px;
}
#userComment {
	background-color: white;
	border-radius: 10px;
	height: 100px;
}
</style>
<div class="container">
	<div>나의 리뷰!</div>
	<c:forEach items="${list }" var="rvo">
		<div class="card shadow radius">
			<div class="media">
				<a class="align-self-center" href="#">
				<c:if test="${rvo.rftype eq 1 }">
					<img src="/upload/${rvo.rsavedir }/${rvo.ruuid}_th_${rvo.rfname}">
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
						</c:forEach>
					</c:if>
				</div>
			</div>
		</div>
	</c:forEach>
<jsp:include page="myReviewFooter.jsp"></jsp:include>
</div>
<jsp:include page="../common/footer.jsp" />
