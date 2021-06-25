<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>

<style>
#div_page {
	width: 100%;
	min-height: 700px;
}

#div_main {
	position: absolute;
	left: 50%;
	width: 30%;
	min-height: 100px;
	margin-left: -15%;
	text-align: left;
}
</style>
<c:import url="../template/hm_import.jsp"></c:import>
</head>
<body>
	<c:import url="../template/header.jsp"></c:import>
	<h1>&nbsp;</h1>
	<h1>&nbsp;</h1>
	<div id="div_page" class="container" style="text-align: center;">


		<h2 class="mt-4">회원가입</h2>
		<div id="div_main" class="container mt-2">
			<form id="frm" action="./memberJoin" method="post"
				enctype="multipart/form-data">
				<div class="form-group">
					<label for="id">아이디</label> <input type="text" class="form-control"
						id="id" name="id">
					<h4 id="idCheckResult"></h4>
					<input type="button" value="중복확인" class="btn btn-primary"
						id="btn_idcheck" name="btn_idcheck">
					<!-- ID 는 6글자 이상 -->
				</div>
				<div class="form-group">
					<label for="pw">비밀번호</label> <input type="password"
						class="form-control" id="pw" name="pw">
					<h4 id="pwResult"></h4>
					<!-- PW는 8글자 이상 -->
				</div>
				<div class="form-group">
					<label for="pw2">비밀번호 확인</label> <input type="password"
						class="form-control" id="pw2" name="pw2">
					<h4 id="pw2Result"></h4>
					<!-- PW 두개는 일치 -->
				</div>
				<div class="form-group">
					<label for="name">이름</label> <input type="text"
						class="form-control etc" id="name" name="name">
					<!-- 비어 있으면 X -->
				</div>

				<div class="form-group">
					<label for="email">Email</label> <input type="text"
						class="form-control etc" id="email" name="email">
					<!-- 비어 있으면 X -->
				</div>
				<div class="form-group">
					<label for="phonenum">전화번호</label> <input type="text"
						class="form-control etc" id="phone" name="phone">
					<!-- 비어 있으면 X -->
				</div>



				<input type="button" id="btn" name="btn" value="가 입" class="btn btn-primary">

			</form>
		</div>
	</div>
	<script type="text/javascript">
	let id_txt = document.getElementById("id");
	let pw = document.getElementById("pw");
	let pw2 = document.getElementById("pw2");
	let name = document.getElementById("name");
	let email = document.getElementById("email");
	let phone = document.getElementById("phone");
	
	
	
	let idCheckResult = false;
	
	
		//중복확인버튼
		$("#btn_idcheck").click(function() {
			const id = $("#id").val();
			if(id_txt.value.length>3){
				$.ajax({
					method : "get",
					url : './memberidCheck',
					data : {
						id : id
					},

					success : function(data) {
						data = data.trim();
						if (data === '1') {
							alert("사용가능한 아이디입니다.");
							idCheckResult = true;
						} else {
							alert("중복된 아이디입니다.");
							idCheckResult = false;
						}
					}
				})				
			}else{
				alert("아이디가 너무 짧습니다.");
			}
		});
		
		//id 블러처리
		id_txt.addEventListener("blur", function() {
			idCheckResult = false;
		});
		
		btn.addEventListener("click", function(){
			if(idCheckResult){
				if(id_txt.value==""||pw.value==""||pw2.value==""||name.value==""||email.value==""||phone.value==""){
					alert("모두입력하세요.");	
				}else{
					if(pw.value==pw2.value){
						frm.submit();
					}else{
						alert("비밀번호 불일치");
					}
				}
			}else{
				alert("아이디 중복확인하세요.");
			}
		});
		
		
	</script>
</body>
</html>