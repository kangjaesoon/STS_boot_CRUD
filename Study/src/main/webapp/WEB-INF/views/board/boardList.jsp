<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<c:import url="../template/hm_import.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>

	<h2>&nbsp;</h2>
	<h2>&nbsp;</h2>

	<div class="container">


		<h2>
			<a href="./${board}List">${board}List</a>
		</h2>

		<table class="table">
			<thead class="thead-dark">
				<tr>
					<c:if test="${member.admin eq '1'}">
						<th><input type="checkbox" id="allCheck" name="allCheck" /></th>
					</c:if>
					<th>분류</th>
					<th>TITLE</th>
					<th>DATE</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list}" var="dto">
					<tr>
						<c:if test="${member.admin eq '1'}">
							<th><input type="checkbox" name="RowCheck"
								value="${dto.num}" class="chBox"></th>
						</c:if>
						<td>Q.</td>
						<td><a href="./${board}Select?num=${dto.num}">
								${dto.title} </a></td>
						<td>${dto.regDate}</td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
	</div>

	<div class="container">
		<ul class="pagination">

			<c:if test="${pager.pre}">
				<li class="page-item"><a class="page-link p" href="#"
					title="${pager.startNum-1}">Previous</a></li>
			</c:if>

			<c:forEach begin="${pager.startNum}" end="${pager.lastNum}" var="i">
				<li class="page-item"><a class="page-link p" href="#"
					title="${i}">${i}</a></li>
			</c:forEach>

			<c:if test="${pager.next}">
				<li class="page-item"><a class="page-link p" href="#"
					title="${pager.lastNum+1}">Next</a></li>
			</c:if>
		</ul>

		<div class="input-group mt-3 mb-3">
			<form id="frm" action="./${board}List" class="form-inline">
				<input type="hidden" name="curPage" value="1" id="curPage">
				<div class="input-group-prepend"></div>
				<input type="text" class="form-control" name="search" id="search"
					value="${pager.search}" placeholder="">
				<div class="input-group-append">
					<button class="btn btn-success" type="submit">Search</button>
				</div>
			</form>
		</div>
		<a href="./${board}Insert" class="btn  btn-primary" role="button">Write</a>
		<input type="button" value="ChoiceDelete" class="btn  btn-primary">
		<script type="text/javascript">
			let kind = '${pager.kind}';//Title, Writer, Contents

			$(".p").click(function() {
				let curPage = $(this).attr("title");
				$("#curPage").val(curPage);
				let search = '${pager.search}';
				$("#frm").submit();

			});
			
			
			$("#allCheck").click(function(){
				var check = $("#allCheck").prop("checked");
				if(check){
					$(".chBox").prop("checked", true);
				}else{
					$(".chBox").prop("checked", false);
				}
			});
			
			$(".chBox").click(function(){
				$("#allCheck").prop("checked", false);
			});
		</script>
	</div>

</body>
</html>