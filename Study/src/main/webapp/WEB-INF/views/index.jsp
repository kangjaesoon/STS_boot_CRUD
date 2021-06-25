<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:import url="./template/hm_import.jsp"></c:import>
<style>
#div_main {
	position: absolute;
	left: 50%;
	width: 30%;
	min-height: 100px;
	
	text-align: right;
}
</style>
</head>
<body>
	<c:import url="./template/header.jsp"></c:import>
	<h1>&nbsp;</h1>
	<h1>&nbsp;</h1>
	<div id="div_main" class="container mt-2">
	
	<h2>
		<a href="${pageContext.request.contextPath}/board/boardList"
			type="button" class="btn btn-primary">게시판</a>
	</h2>
	<c:choose>

		<c:when test="${empty member}">
			<h2><a href="${pageContext.request.contextPath}/member/memberLogin"
					type="button" class="btn btn-primary">로그인</a></h2>
		</c:when>
		<c:when test="${member.admin eq '1'}">
			<h3>${member.name}님안녕하세요</h3>
			<h5>관리자계정</h5>
			<h2><a href="${pageContext.request.contextPath}/member/memberPage"
					type="button" class="btn btn-primary">회원정보</a></h2>
			<h2><a href="${pageContext.request.contextPath}/member/memberLogout"
					type="button" class="btn btn-primary">로그아웃</a></h2>
		</c:when>
		<c:otherwise>
			<h3>${member.name}님안녕하세요</h3>
			<h2><a href="${pageContext.request.contextPath}/member/memberPage"
					type="button" class="btn btn-primary">회원정보</a></h2>
			<h2><a href="${pageContext.request.contextPath}/member/memberLogout"
					type="button" class="btn btn-primary">로그아웃</a></h2>
		</c:otherwise>
	</c:choose>
	</div>
</body>
</html>