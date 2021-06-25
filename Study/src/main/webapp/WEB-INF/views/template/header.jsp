<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상단 메뉴바</title>
<style>

</style>
</head>
<body>
	<nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
		<div class="collapse navbar-collapse" id="navbarCollapse">
			<c:if test="${empty member}">
				<a class="nav-link btn btn-outline-primary"
					href="${pageContext.request.contextPath}/member/memberLogin">로그인</a>
        &nbsp;
        <a class="nav-link btn btn-outline-primary"
					href="${pageContext.request.contextPath}/member/memberJoin">회원가입</a>
			</c:if>

			<c:if test="${not empty member}">

				<a class="nav-link btn btn-outline-primary"
					href="${pageContext.request.contextPath}/">Home</a>
		 &nbsp;
        <a class="nav-link btn btn-outline-primary"
					href="${pageContext.request.contextPath}/member/memberLogout">로그아웃</a>

			</c:if>
		</div>
	</nav>
</body>
</html>