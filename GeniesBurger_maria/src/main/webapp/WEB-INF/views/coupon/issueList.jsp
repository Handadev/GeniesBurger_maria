<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../adminCommon/header.jsp" />
<jsp:include page="../adminCommon/nav.jsp" />
<jsp:include page="../adminCommon/sidebar.jsp" />
<%-- <c:choose>
	<c:when test="${ses.email eq 'admin@admin.com' }"> --%>
	<div class="container">
	<h2 class="float-left">발급된 쿠폰 리스트</h2>
		<a href="/coupon/list" class="btn btn-primary float-right ml-3">쿠폰 목록</a>
		<a href="/coupon/issue" class="btn btn-primary float-right">쿠폰 발급</a>
	  <div class="form-group float-left ml-3">
	<form action="/coupon/issueList" class="form-inline">
		<select class="form-control" name="range">
			<option value="all" <c:out value="${cpghdl.cpgvo.range eq 'all' ? 'selected' : '' }"/>>
			전체</option>
			<option value="io" <c:out value="${cpghdl.cpgvo.range eq 'io' ? 'selected' : '' }"/>>
			발급 번호</option>
			<option value="c" <c:out value="${cpghdl.cpgvo.range eq 'c' ? 'selected' : '' }"/>>
			쿠폰 번호</option>
			<option value="cn" <c:out value="${cpghdl.cpgvo.range eq 'cn' ? 'selected' : '' }"/>>
			쿠폰명</option>
			<option value="m" <c:out value="${cpghdl.cpgvo.range eq 'm' ? 'selected' : '' }"/>>
			멤버 번호</option>
			<option value="e" <c:out value="${cpghdl.cpgvo.range eq 'e' ? 'selected' : '' }"/>>
			이메일</option>
			<option value="d" <c:out value="${cpghdl.cpgvo.range eq 'd' ? 'selected' : '' }"/>>
			유효기간</option>
			<option value="s" <c:out value="${cpghdl.cpgvo.range eq 's' ? 'selected' : '' }"/>>
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
	      	<th>발급 번호</th>
	        <th>쿠폰 번호</th>
	        <th>쿠폰명</th>
	        <th>멤버 번호</th>
	        <th>이메일</th>
	        <th>할인율(%)</th>
	        <th>유효기간</th>
	        <th>발급 취소</th>
	      </tr>
	    </thead>
	    <c:choose>
	    	<c:when test="${issueList.size() ne 0 }">
	    		<tbody>
	  		 	 <c:forEach items="${issueList }" var="cplvo">
	    		  <tr>
	     		   <td>${cplvo.cplno }</td>
	     		   <td>${cplvo.cpno }</td>
	     		   <td>${cplvo.cpname }</td>
	     		   <td>${cplvo.mno }</td>
	     		   <td>${cplvo.email }</td>
	     		   <td>${cplvo.discount }%</td>
	     		   <td>${cplvo.enddate}</td>
	     		   <td>
	     		   <button type="button" id="cancelBtn" data-cplno="${cplvo.cplno }" class="btn btn-danger">취소</button>
	     		   </td>
	    		  </tr>
	    		  </c:forEach>
	   		 	</tbody>
	   		 	<tfoot>
    			<tr>
    				<td	colspan="7">
    					<jsp:include page="issuePaging.jsp"/>
    				</td>
    			</tr>
    		</tfoot>
	    	</c:when>
	    	<c:otherwise>
	    		<tbody>
	    			<tr>
	    				<td colspan="7" class="text-center">
	    					<h3>발급한 쿠폰이 없습니다.</h3>
	    				</td>
	    			</tr>
	    		</tbody>
	    	</c:otherwise>
	    </c:choose>
	  </table>
  </div>
  <script src="/resources/js/jquery.min.js"></script>
  <script>
 	 function coupon_cancel(cplno){
		$.ajax({
			url: "/coupon/" + cplno,
			type: "delete"
		}).done(function(result) {
			alert("발급 취소 성공!");
			location.reload();
		}).fail(function(err) {
			alert("발급 취소 실패...");
			 console.log(err);
		});
	 }
 	 $(document).on("click", "#cancelBtn", function() {
		let cplno_val = $(this).data("cplno"); 
		console.log(cplno_val)
		coupon_cancel(cplno_val);
	 });
  </script>
  <%-- </c:when>
			<c:otherwise>
			<script>
				alert("관리자 로그인이 필요한 페이지 입니다!");
				location.replace("/member/login");
			</script>
			</c:otherwise>
		</c:choose> --%>
<jsp:include page="../adminCommon/footer.jsp" />