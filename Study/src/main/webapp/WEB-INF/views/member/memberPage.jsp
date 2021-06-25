<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#div_page {
	width: 100%;
	min-height: 700px;
}

#div_main {
	position: absolute;
	left: 50%;
	width: 250px;
	min-height: 100px;
	margin-left: -9%;
	text-align: left;
}
</style>

<c:import url="../template/hm_import.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<h1>&nbsp;</h1>
	<h1>&nbsp;</h1>
	<div class="container">
		<div id="div_page" class="container" style="text-align: center;">
			<h2 class="mt-4">회원정보</h2>
			<div id="div_main" class="container mt-2">
				<form id="frm" action="./memberUpdate" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label for="id">아이디 </label>
						<input type="text" class="form-control" value="${member.id}" id="id" name="id"	readonly>
					</div>
					<div class="form-group">
						<label for="pw">비밀번호</label> 
						<input type="password" class="form-control" id="pw" name="pw">
					</div>

					<div class="form-group">
						<label for="name">이름</label> 
						<input type="text" class="form-control etc" value="${member.name}" id="name" name="name">
					</div>

					<div class="form-group">
						<label for="email">Email</label> 
						<input type="text" class="form-control etc" value="${member.email}" id="email"	name="email">
					</div>
					<div class="form-group">
						<label for="phonenum">전화번호</label> 
						<input type="text" class="form-control etc" value="${member.phone}" id="phone"	name="phone">
						<input type="hidden" value="${member.admin}" id="admin" name="admin">
					</div>

					<input type="button" value="정보 수정" class="btn btn-primary"	id="btn_update" name="btn_update"> 
					<input type="button" value="회원 탈퇴" class="btn btn-primary" id="btn_delete"	name="btn_delete">
				</form>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$("#btn_update").click(function(){

				const id = $("#id").val();
				const pw = $("#pw").val();
				const name = $("#name").val();
				const email = $("#email").val();
				const phone = $("#phone").val();
				
				if (pw.length == "") {
					alert("비밀번호를 입력하세요.");
				} else {
					if (name.length==""||email.length==""||phone.length=="") {
						alert("모든항목을 입력하세요.")
					} else {
						$.ajax({
							method : "get",
							url : './getSelect',
							data : {
								id : id,
								pw : pw,
							},
								success : function(data) {
								data = data.trim();
								if (data === '1') {
									frm.submit();
								} else {
									alert("비밀번호가 틀렸습니다.");
								}
							}
						})
					}
				}
			});

		$("#btn_delete").click(function() {
			const id = $("#id").val();
			const pw = $("#pw").val();

			if (confirm("회원탈퇴 하시겠습니까?")) {
				if (pw.length == "") {
					alert("비밀번호를 입력하세요.");
				} else {
					$.ajax({
						method : "get",
						url : "./memberDelete",
						data : {
							id : id,
							pw : pw
						},

						success : function(data) {
							data = data.trim();
							if (data === '1') {
								alert("회원탈퇴 완료");
								location.href = "../";

							} else {
								alert("비밀번호가 틀렸습니다.");
							}
						}
					})
				}
			}

		});
	</script>
</body>
</html>