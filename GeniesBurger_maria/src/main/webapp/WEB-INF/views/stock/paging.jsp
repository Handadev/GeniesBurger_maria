<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row mt-5">
	<div class="col text-center">
		<div class="block-27">
			<ul style="list-style-type: none; ">
				<c:if test="${srpghdl.prev }">
					<li style="float: left; "><a
						href="/stock/stock_regList?pageIndex=${srpghdl.firstPageIndex-1 }&countPerPage=${srpghdl.srpgvo.countPerPage}&stock_regdate=${srpghdl.srpgvo.stock_regdate }&range=${srpghdl.srpgvo.range}&keyword=${srpghdl.srpgvo.keyword}"
						style="margin-left: 10px; ">
							&#60;</a></li>
				</c:if>
				<c:forEach begin="${srpghdl.firstPageIndex }"
					end="${srpghdl.lastPageIndex }" var="i">
					<li style="float: left; " class="${srpghdl.srpgvo.pageIndex == i ? 'active' : '' }" ><a
						href="/stock/stock_regList?pageIndex=${i }&countPerPage=${srpghdl.srpgvo.countPerPage}&stock_regdate=${srpghdl.srpgvo.stock_regdate }&range=${srpghdl.srpgvo.range}&keyword=${srpghdl.srpgvo.keyword}"
						style="margin-left: 10px; ">
							${i }</a></li>
				</c:forEach>
				<c:if test="${srpghdl.next }">
					<li style="float: left; "><a
						href="/stock/stock_regList?pageIndex=${srpghdl.lastPageIndex+1 }&countPerPage=${srpghdl.srpgvo.countPerPage}&stock_regdate=${srpghdl.srpgvo.stock_regdate }&range=${srpghdl.srpgvo.range}&keyword=${srpghdl.srpgvo.keyword}"
						style="margin-left: 10px; ">
							&#62;</a></li>
				</c:if>
			</ul>
		</div>
	</div>
</div>