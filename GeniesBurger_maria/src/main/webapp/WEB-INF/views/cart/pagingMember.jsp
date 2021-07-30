<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul>
				<c:if test="${pghdlM.pBtn }">
					<li>
						<a href="/cart/purchaseListMember?
						pageIndex=${pghdlM.fPageIndex-1 }
						&countPerPage=${pghdlM.mpgvo.countPerPage}
						&mno=${pghdlM.mpgvo.mno}">
						&lt;</a>
					</li>
				</c:if>
				<c:forEach begin="${pghdlM.fPageIndex }" end="${pghdlM.lPageIndex }" var="i">
					<li class=" ${pghdlM.mpgvo.pageIndex == i ? 'active' : ''}">
						<a href="/cart/purchaseListMember?pageIndex=${i }
						&countPerPage=${pghdlM.mpgvo.countPerPage}&mno=${pghdlM.mpgvo.mno}">
						${i }
					</a>
					</li>
				</c:forEach>
				<c:if test="${pghdlM.nBtn }">
					<li>
						<a href="/cart/purchaseListMember?pageIndex=${pghdlM.lPageIndex+1 } 
						&countPerPage=${pghdlM.mpgvo.countPerPage}&mno=${pghdlM.mpgvo.mno}">
						&gt;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
