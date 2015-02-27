<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form id="pform">
		<input type="hidden"  name="n_no"  value="">
		<input type="hidden"  name="page"  value="${cri.page}">
		<input type="hidden"  name="perPageNum"  value="${cri.perPageNum}">
		<input type="hidden"  name="displayPageNum"  value="${cri.displayPageNum}">
	</form>
	<h1>
		${pageMaker.totalCount}
	</h1>
	<div>
		<c:forEach var = "news" items="${list}" >
			<div>${news}</div>
			<br/>
			<br/>
			<br/>
		</c:forEach>
	</div>
	<div>
		<div style='float:left;'><h2><a href="#">&laquo;</a></h2></div>
		<c:forEach begin ="${pageMaker.first}" end="${pageMaker.last}" var="idx">
			<div style='float:left;'><h2><a href="${idx}">${idx}</a></h2></div>
		</c:forEach>
		<div style='float:left;'><h2><a href="#">&raquo;</a></h2></div>
	</div>
</body>
</html>