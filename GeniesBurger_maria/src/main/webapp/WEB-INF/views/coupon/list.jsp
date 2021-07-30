<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
<%-- <c:choose>
	<c:when test="${ses.email eq 'admin@admin.com' }"> --%>
	<div class="container">
	<h2 class="float-left">쿠폰 리스트</h2>
		<a href="/coupon/issueList" class="btn btn-danger float-right ml-3">발급 현황</a>
		<a href="/coupon/issue" class="btn btn-primary float-right ml-3">쿠폰 발급</a>
		<a href="/coupon/register" class="btn btn-primary float-right">신규 쿠폰 등록</a>
		<div class="form-group float-left ml-3">
		<form action="/coupon/list" class="form-inline">
			<select class="form-control" name="range">
				<option value="nd" <c:out value="${cpghdl.cpgvo.range eq 'nd' ? 'selected' : '' }"/>>
				전체</option>
				<option value="no" <c:out value="${cpghdl.cpgvo.range eq 'no' ? 'selected' : '' }"/>>
				쿠폰 번호</option>
				<option value="na" <c:out value="${cpghdl.cpgvo.range eq 'na' ? 'selected' : '' }"/>>
			       쿠폰명</option>
				<option value="d" <c:out value="${cpghdl.cpgvo.range eq 'd' ? 'selected' : '' }"/>>
				할인율</option>
			</select>
			<input class="form-control" type="text" placeholder="검색어 입력" name="keyword"
			value='<c:out value="${cpghdl.cpgvo.keyword }"/>'>
			<button type="submit" class="btn btn-success ml-3">검색</button>
		</form>
		</div>
	  <table class="table table-hover">
	    <thead>
	      <tr>
	        <th>쿠폰 번호</th>
	        <th>쿠폰명</th>
	        <th>할인율(%)</th>
	      </tr>
	    </thead>
	    <c:choose>
	    	<c:when test="${list.size() ne 0 }">
	    		<tbody>
	  		 	 <c:forEach items="${list }" var="cpvo">
	    		  <tr>
	     		   <td>${cpvo.cpno }</td>
	     		   <td><a href="/coupon/detail?cpno=${cpvo.cpno }&pageIndex=${cpghdl.cpgvo.pageIndex}&countPerPage=${cpghdl.cpgvo.countPerPage}&range=${cpghdl.cpgvo.range}&keyword=${cpghdl.cpgvo.keyword}">${cpvo.cpname }</a></td>
	     		   <td>${cpvo.discount }%</td>
	    		  </tr>
	    	 	 </c:forEach>
	   		 	</tbody>
	   		 	<tfoot>
    			<tr>
    				<td	colspan="3">
    					<jsp:include page="paging.jsp"/>
    				</td>
    			</tr>
    		</tfoot>
	    	</c:when>
	    	<c:otherwise>
	    		<tbody>
	    			<tr>
	    				<td colspan="3" class="text-center">
	    					<h3>등록된 쿠폰이 없습니다.</h3>
	    				</td>
	    			</tr>
	    		</tbody>
	    	</c:otherwise>
	    </c:choose>
	  </table>
  </div>
  <%-- </c:when>
			<c:otherwise>
			<script>
				alert("관리자 로그인이 필요한 페이지 입니다!");
				location.replace("/member/login");
			</script>
			</c:otherwise>
		</c:choose> --%>
<jsp:include page="../adminCommon/footer.jsp" />
