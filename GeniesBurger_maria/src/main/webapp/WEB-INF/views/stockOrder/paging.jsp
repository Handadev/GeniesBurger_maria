<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5 justify-content-center">
	<ul style="list-style-type: none;">
		<c:if test="${spghdl.prev }">
			<li style="float: left;"><a
				href="/stockOrder/dateList?pageIndex=${spghdl.firstPageIndex-1 }&countPerPage=${spghdl.sopgvo.countPerPage}&order_date=${spghdl.sopgvo.order_date }&range=${spghdl.sopgvo.range}&keyword=${spghdl.sopgvo.keyword}"
				style="margin-left: 10px;"> &#60;</a></li>
		</c:if>
		<c:forEach begin="${spghdl.firstPageIndex }"
			end="${spghdl.lastPageIndex }" var="i">
			<li style="float: left;"
				class="${spghdl.sopgvo.pageIndex == i ? 'active' : '' }"><a
				href="/stockOrder/dateList?pageIndex=${i }&countPerPage=${spghdl.sopgvo.countPerPage}&order_date=${spghdl.sopgvo.order_date }&range=${spghdl.sopgvo.range}&keyword=${spghdl.sopgvo.keyword}"
				style="margin-left: 10px;"> ${i }</a></li>
		</c:forEach>
		<c:if test="${spghdl.next }">
			<li style="float: left;"><a
				href="/stockOrder/dateList?pageIndex=${spghdl.lastPageIndex+1 }&countPerPage=${spghdl.sopgvo.countPerPage}&order_date=${spghdl.sopgvo.order_date }&range=${spghdl.sopgvo.range}&keyword=${spghdl.sopgvo.keyword}"
				style="margin-left: 10px;"> &#62;</a></li>
		</c:if>
	</ul>
</div>