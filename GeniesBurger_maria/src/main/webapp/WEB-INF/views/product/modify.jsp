<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../common/header.jsp" />

<style>
.pcontainer {
	padding-top : 50px;
	padding-bottom : 50px;
}
</style>
<div class="container-fluid border pcontainer">
	<div class="container col-sm-4">
		<h2>상품 정보 수정</h2>
		<form action="/product/modify" method="post"
			enctype="multipart/form-data">

			<div class="form-group">
				<label for="title">상품 품목:</label> <select name="category"
					class="form-control">
					<option value="">상품 품목선택</option>
					<option value="1" <c:out value="${pvo.category eq 1 ? 'selected' : '' }"/>>버거</option>
					<option value="2" <c:out value="${pvo.category eq 2 ? 'selected' : '' }"/>>버거 세트</option>
					<option value="3" <c:out value="${pvo.category eq 3 ? 'selected' : '' }"/>>버거 라지 세트</option>
					<option value="4" <c:out value="${pvo.category eq 4 ? 'selected' : '' }"/>>올데이할인 버거</option>
					<option value="5" <c:out value="${pvo.category eq 5 ? 'selected' : '' }"/>>올데이할인 버거 세트</option>
					<option value="6" <c:out value="${pvo.category eq 6 ? 'selected' : '' }"/>>올데이할인 버거 라지 세트</option>
					<option value="7" <c:out value="${pvo.category eq 7 ? 'selected' : '' }"/>>사이드</option>
					<option value="8" <c:out value="${pvo.category eq 8 ? 'selected' : '' }"/>>음료</option>
					<option value="9" <c:out value="${pvo.category eq 9 ? 'selected' : '' }"/>>햄버거 추가 재료</option>
				</select>
			</div>
			
			<div class="form-group">
				<label for="title">제품 번호:</label> <input type="text"
					class="form-control" value="${pvo.pno }"
					name="pno" readonly>
			</div>
			
			<div class="form-group">
			<input type="hidden" id="relatePno" value="${pvo.relate_pno }">
				<label for="title">연동된 단품:</label> 
				<select name="relate_pno" id="relateSel" class="form-control">
					<option value="0">연동할 상품명 선택</option>
					<c:forEach items="${single_list }" var="pvo">
						<option value="${pvo.pno }">
							<c:choose>
								<c:when test="${pvo.category eq 1}">버거 단품</c:when>
								<c:otherwise>올데이세일 단품</c:otherwise>
							</c:choose>
						 - ${pvo.title }
						</option>
					</c:forEach>
				</select>
			</div>
						
			<div class="form-group">
				<label for="title">상품명:</label> <input type="text"
					class="form-control" id="title" value="${pvo.title }"
					name="title">
			</div>

			<div class="form-group">
				<label for="content">제품설명:</label> <input type="text"
					class="form-control" id="content" value="${pvo.content }"
					name="content">
			</div>

			<div class="form-group">
				<label for="price">가격:</label> <input type="number"
					class="form-control" id="price" value="${pvo.price }"
					name="price">
			</div>

			<div class="form-group">
				<label for="price">칼로리:</label> <input type="number"
					class="form-control" value="${pvo.calorie }"
					name="calorie">
			</div>

			<div class="form-group">
				<label for="price">판매중여부:</label>
				<select name="cansale" class="form-control">
				<option value="0" <c:out value="${pvo.cansale eq 0 ? 'selected' : '' }"/>>판매중</option>
				<option value="1" <c:out value="${pvo.cansale eq 1 ? 'selected' : '' }"/>>일시품절</option>
				</select>
			</div>

			<div class="form-group">
				<label for="price">이미지:</label> <input type="file"
					class="form-control" id="files" name="files" multiple
					style="display: none;">
				<button type="button"
					class="btn btn-outline-info btn-block col-sm-6" id="fileTrigger">사진
					업로드</button>
			</div>
			<div class="form-group">
				<ul class="list-group" id="fileZone"></ul>
			</div>
			<!-- File List Part-->
			<c:if test="${pvo.flist.size() > 0 }">
				<div class="form-group">
					<tr>
						<td>
							<ul class="list-group">
								<c:forEach items="${pvo.flist }" var="fvo">
									<li
										class="list-group-item d-flex justify-content-between align-items-center">
										<img src="/upload/${fvo.savedir }/${fvo.puuid}_th_${fvo.fname}">
										<span class="badge badge-success badge-pill">${fvo.fname }</span>
										<button type="button" class="btn-close" aria-label="Close" data-puuid="${fvo.puuid }">
										<span aria-hidden="true">&times;</span>
										</button>
									</li>
								</c:forEach>
							</ul>
						</td>
					</tr>
				</div>
			</c:if>
			
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</div>
</div>

<script src="/resources/js/jquery-3.2.1.min.js"></script>
<script>
	
	function remove_file_li(i_obj) {
		$(i_obj).closest("li").remove();
	}
	$(function() {
		$(document).on("click", ".btn-close", function() {
			let puuid_obj = $(this);
			let puuid_val = puuid_obj.data("puuid");
			console.log(puuid_val);
			$.ajax({
				url : "/product/del_product_file",
				type : "post",
				data : {
					puuid : puuid_val
				}
			}).done(function(result) {
				alert("파일삭제 성공~");
				console.log(puuid_obj);
				remove_file_li(puuid_obj);
			}).fail(function(err) {
				console.log(err);
				alert("파일삭제 실패!");
			});
		});
	});
	
	
	$(document).on("click", "#fileTrigger", function() {
		$("#files").click();
	});
	
	let regExp = new RegExp("\.(exe|sh|bat|js|msi|dll)$");
	let maxSize = 1048576; //1mb
	function fileValidation(fname, fsize) {
		if (regExp.test(fname)) {
			alert(fname+"는 허용되지 않는 파일형식입니다");
			return false;
		} else if (fsize > maxSize) {
			alert("1mb 파일만 허용됩니다");
			return false;
		} else {
			return true;
		}
	}
	
	$(document).on("change", "#files", function() {
		$("button[type=submit]").attr("disabled", false);
		let formObj = $("#files");
		let fileObjs = formObj[0].files;
		let fileZone = $("#fileZone");
		fileZone.html("");
		
		for (let fobj of fileObjs) {
			let li = '<li class="list-group-item d-flex justify-content-between align-items-center">';
			if(fileValidation(fobj.name, fobj.size)) {
				li += fobj.name+'<span class="badge badge-success badge-pill">';
			} else {
				li += '<i class="fa fa-times-rectangle" style="font-size:24px;color:red"></i>';
				li += fobj.name+'<span class="badge badge-danger badge-pill">';
				$("button[type=submit]").attr("disabled", true);
			}
				let fileSize = fobj.size / 1024;
				fileSize = parseInt(fileSize);
				li += fileSize.toFixed(2) + 'KB</span></li>';
				fileZone.append(li);
		}
	});
	
	/* 기존에 연동된 상품pno 가져와서 select에 적용 */
	let relate_pno_val = $("#relatePno").val();
	$("#relateSel").val(relate_pno_val).attr("selected", "selected");
</script>


<jsp:include page="../common/footer.jsp" />