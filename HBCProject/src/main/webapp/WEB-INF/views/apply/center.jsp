
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@include file="../include/header.jsp"%>

<!-- Start main-content -->
<div class="main-content">
	<!-- Section: inner-header -->
	<section
		class="inner-header divider parallax layer-overlay overlay-dark-5"
		data-bg-img="http://placehold.it/1920x1280">
		<div class="container pt-70 pb-20">
			<!-- Section Content -->
			<div class="section-content">
				<div class="row">
					<div class="col-md-12">
						<h2 class="title text-white">수강신청</h2>
					</div>
				</div>
			</div>
		</div>
	</section>

</div>

<!-- Section: Course list -->
<section>
	<div class="container">
		<div class="row">
			<div class="col-md-9 blog-pull-right">

				<c:forEach items="${list}" var="applyVO" varStatus="status">
					<div class="row mb-15">
						<div class="col-sm-15 col-md-15">
							<h4 class="line-bottom mt-0 mt-sm-20">
								<b>${applyVO.courname }</b>
							</h4>
							<%-- <ul class="review_text list-inline">
								<li><h4 class="mt-0">
										<span class="text-theme-color-2">수강료 :</span> ${applyVO.price }
									</h4></li>
								<li>
									<div class="star-rating" title="Rated 4.50 out of 5">
										<span style="width: 90%;">4.50</span>
									</div>
								</li>
							</ul>
							<p>수강 기간 : ${applyVO.sdate } ~ ${applyVO.edate }</p>
							<p>수강 요일 : ${applyVO.dayinfo }</p>
							<p>${applyVO.spec }</p>
							<a
								class="btn btn-dark btn-theme-colored btn-sm text-uppercase mt-10"
								href="page-courses-accounting-technologies.html">view
								details</a> --%>
							<table class="table table-striped">
								<tr>
									<th style="text-align: center">기관</th>
									<th style="text-align: center">기간</th>
									<th style="text-align: center">요일</th>
									<th style="text-align: center">수강료</th>
									<th style="text-align: center">결제</th>
								</tr>

								<tr style="text-align: center">
									<td>${applyVO.compname}</td>
									<td>
										<%-- <fmt:formatDate value=" ${applyVO.edate }" pattern="yyyy-MM-dd"/> --%>
										<fmt:formatDate value="${applyVO.sdate}" pattern="yyyy년 M월 d일" /> 
										&nbsp; ~ &nbsp;
										<fmt:formatDate value="${applyVO.edate}" pattern="yyyy년 M월 d일" /> 
									</td>
									<td>${applyVO.dayinfo }</td>
									<td><span class="text-theme-color-2">${applyVO.price }</span>
									<td>
									<c:if test="${applyVO.link ne null }">
										<button type="button" class="btn btn-danger"
											onClick="location.href='${applyVO.link}">결 제</button>
											</c:if>
									<c:if test="${applyVO.link eq null }">
										<button type="button" class="btn btn-primary">데스크 문의</button>
											</c:if>
								</tr>

							</table>
							<%-- <p>${applyVO.spec }</p> --%>
						</div>
					</div>
					<hr>
				</c:forEach>
			</div>


			<!-- nav 시작 -->
			<div class="col-md-3">
				<div class="sidebar sidebar-left mt-sm-30">
					<div class="widget">
						<h5 class="widget-title line-bottom">수강신청</h5>
						<div class="categories">
							<ul class="list list-border angle-double-right">
								<c:forEach items="${appCompList}" var="list" varStatus="status">
								<li><a href="/apply/center?page=${cri.page}&perPageNum=${cri.perPageNum}&compnum=${list.compnum }">${list.compname }</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<!-- nav 종료 -->



		</div>
	</div>
</section>
</div>
<!-- end main-content -->

<div class="box-footer">

	<div class="text-center">
		<ul class="pagination">

			<c:if test="${pageMaker.prev}">
				<li><a
					href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage }"
				end="${pageMaker.endPage }" var="idx">
				<li <c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
					<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a
					href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
			</c:if>
		</ul>
	</div>
	<!-- .text-center END -->
	<section>
		<%-- 						 <div class="container">
							<div class="row">
										<div class="col-md-9 blog-pull-right">
							
								<div class="col-md-2 col-xs-4">
									<select name="searchType" class="form-control">
										<option value=""
											<c:out value="${cri.searchType == null?'selected':''}"/>>
											선택</option>
										<option value="c"
											<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
											과목명</option>
										<option value="t"
											<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
											기관명</option>
										<option value="ct"
											<c:out value="${cri.searchType eq 'ct'?'selected':''}"/>>
											과목명, 기관명</option>
									</select>
								</div>
								<div class="col-md-2 col-xs-6">
									<input type="text" class="form-control"
										placeholder="키워드를 입력하세요" id="keywordInput">
								</div>
								<div class="col-md-2 col-xs-4">
									<button type="submit" id ="btn-default" class="btn btn-default">
										<i class="fa fa-search"></i> 검색</button>
								</div>
							</div>
							</div>
						</div>  --%>



		<div class="Searchcontainer">
			<div class="row">
				<div class="col-md-9 blog-pull-right">

					<div class="col-sm-3">
						<div class="col-sm-6">
							<!--     		<select class="form-control">
					  <option>최신순</option>
					  <option>오래된순</option>
					  <option>인기순</option>
					</select>  -->
						</div>
					</div>
					<div class="col-sm-7">
						<div class="col-xs-3">
							<select name="searchType" class="form-control">
								<option value=""
									<c:out value="${cri.searchType == null?'selected':''}"/>>
									선택</option>
								<option value="c"
									<c:out value="${cri.searchType eq 'c'?'selected':''}"/>>
									과목명</option>
								<option value="t"
									<c:out value="${cri.searchType eq 't'?'selected':''}"/>>
									기관명</option>
								<option value="ct"
									<c:out value="${cri.searchType eq 'ct'?'selected':''}"/>>
									과목명, 기관명</option>
							</select>
						</div>
						<div class="col-xs-6">
							<div class="form-group">
								<input type="text" class="form-control" placeholder="키워드를 입력하세요"
									id="keywordInput">
							</div>
						</div>
						<div class="col-xs-1 mt-5">
							<button type="submit" id="btn-default" class="btn btn-default">
								<i class="fa fa-search"></i> 검색 </button>
						</div>

					</div>

				</div>
			</div>
		</div>
	</section>

	<script>
		$(document).ready(
				function() {

					$('#btn-default').on(
							"click",
							function(event) {

								self.location = "center"
										+ '${pageMaker.makeQuery(1)}'
										+ "&searchType="
										+ $("select option:selected").val()
										+ "&keyword="
										+ $('#keywordInput').val();

							});

				});
	</script>

	<%@include file="../include/footer.jsp"%>