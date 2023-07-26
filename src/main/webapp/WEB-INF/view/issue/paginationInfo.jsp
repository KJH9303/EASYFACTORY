<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<link rel="stylesheet" href="../../../resources/issue/css/list.css">
<div id="pagination">
	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li style="display: inline;">
					<a href="${pageMaker.makeQuery(pageMaker.startPage - 1)}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}&selectProcess=${selectProcess}">이전</a>
				</li>
			</c:if>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li style="display: inline;">
					<a href="${pageMaker.makeQuery(idx)}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}&selectProcess=${selectProcess}" class="paging-btn btn-1">${idx}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li style="display: inline;">
					<a href="${pageMaker.makeQuery(pageMaker.endPage + 1)}&searchType=${searchType}&keyword=${keyword}&startDate=${startDate}&endDate=${endDate}&selectProcess=${selectProcess}">다음</a>
				</li>
			</c:if>
		</ul>
	</div>
</div>