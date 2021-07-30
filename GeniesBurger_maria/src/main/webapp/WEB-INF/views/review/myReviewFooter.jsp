<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul>
				<c:if test="${rpghdl.prev }">
					<li>
						<a href="/review/myReview?pageIndex=${rpghdl.firstPageIndex-1 }&countPerPage=${rpghdl.rpgvo.countPerPage}&email=${ses.email}">&lt;</a>
					</li>
				</c:if>

				<c:forEach begin="${rpghdl.firstPageIndex }" end="${rpghdl.lastPageIndex }"	var="i">
					<li class=" ${rpghdl.rpgvo.pageIndex == (i-1) * rpghdl.rpgvo.countPerPage ? 'active' : ''}">
						<a href="/review/myReview?pageIndex=${i }&countPerPage=${rpghdl.rpgvo.countPerPage}&email=${ses.email}">${i }</a>
					</li>
				</c:forEach>

				<c:if test="${rpghdl.next }">
					<li>
						<a href="/member/myReview?pageIndex=${rpghdl.lastPageIndex+1 }&countPerPage=${rpghdl.rpgvo.countPerPage}&email=${ses.email}">&gt;</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>