<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul>
				<c:if test="${pghdl.pBtn }">
					<li>
						<a href="/cart/purchaseList?pageIndex=${pghdl.fPageIndex-1 }
						&countPerPage=${pghdl.mpgvo.countPerPage}
						&range=${pghdl.mpgvo.range}
						&keyword=${pghdl.mpgvo.keyword}">
						&lt;</a>
					</li>
				</c:if>
				<c:forEach begin="${pghdl.fPageIndex }" end="${pghdl.lPageIndex }" var="i">
					<li class=" ${pghdl.mpgvo.pageIndex == (i - 1) * pghdl.mpgvo.countPerPage ? 'active' : ''}">
						<a href="/cart/purchaseList?pageIndex=${i }
						&countPerPage=${pghdl.mpgvo.countPerPage}
						&range=${pghdl.mpgvo.range}
						&keyword=${pghdl.mpgvo.keyword}">
						${i }
					</a>
					</li>
				</c:forEach>
				<c:if test="${pghdl.nBtn }">
					<li>
						<a href="/cart/purchaseList?pageIndex=${pghdl.lPageIndex+1 } 
						&countPerPage=${pghdl.mpgvo.countPerPage}
						&range=${pghdl.mpgvo.range}
						&keyword=${pghdl.mpgvo.keyword}">
						&gt;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
