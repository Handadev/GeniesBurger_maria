<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5 justify-content-center">
	  <ul style="list-style-type: none; ">
		<c:if test="${cpghdl.prev }">
			<li style="float: left; "><a
				href="/coupon/issueList?pageIndex=${cpghdl.firstPageIndex-1 }&countPerPage=${cpghdl.cpgvo.countPerPage}&range=${pghdl.cpgvo.range}&keyword=${cpghdl.cpgvo.keyword}"
				style="margin-left: 10px; ">
					&#60;</a></li>
		</c:if>
		<c:forEach begin="${cpghdl.firstPageIndex }"
			end="${cpghdl.lastPageIndex }" var="i">
			<li style="float: left; " class="${cpghdl.cpgvo.pageIndex == i ? 'active' : '' }"><a
				href="/coupon/issueList?pageIndex=${i }&countPerPage=${cpghdl.cpgvo.countPerPage}&range=${cpghdl.cpgvo.range}&keyword=${cpghdl.cpgvo.keyword}"
				style="margin-left: 10px; ">
					${i }</a></li>
		</c:forEach>
		<c:if test="${cpghdl.next }">
			<li style="float: left; "><a
				href="/coupon/issueList?pageIndex=${cpghdl.lastPageIndex+1 }&countPerPage=${cpghdl.cpgvo.countPerPage}&range=${cpghdl.cpgvo.range}&keyword=${cpghdl.cpgvo.keyword}"
				style="margin-left: 10px; ">
						&#62;</a></li>
			</c:if>
	</ul>
</div>
