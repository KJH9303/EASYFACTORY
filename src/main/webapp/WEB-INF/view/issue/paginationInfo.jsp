<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<div id="paginationInfo">
	<div>
		<ul>
				<li style="display: inline;">
					<a href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}"><-</a>
				</li>

			<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
				<li style="display: inline;">
					<a href="list${pageMaker.makeQuery(idx)}">${idx}</a>
				</li>
			</c:forEach>

				<li style="display: inline;">
					<a href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">-></a>
				</li>
		</ul>
	</div>
</div>