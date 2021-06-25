<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인폼</title>
<style>
#div_page {
	width: 100%;
	height: 700px;
}

#div_main {
	position: absolute;
	left: 50%;
	width: 20%;
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
	<div id="div_page" class="container" style="text-align: center;">
	<h2 class="mt-4">로그인</h2>
		<div id="div_main" class="container mt-2">
			<form id="frm" action="./memberLogin" method="post">
				<div class="form-group">
					<input type="text" id="id" name="id" placeholder="아이디" class="form-control">
				</div>
				<div class="form-group">
					<input type="password" id="pw" name="pw" placeholder="비밀번호" class="form-control">
				</div>
				<div>
					<input class="btn btn-primary" id="btn_Login" name="btn_Login" type="button" value="로그인">
					<input class="btn btn-primary" type="button"
						onclick="location.href='memberJoin'" value="회원가입">
				</div>

			</form>

		</div>
	</div>
	<script type="text/javascript">
		$("#btn_Login").click(function() {
			const id = $("#id").val();
			const pw = $("#pw").val();
			if(id.length=="" || pw.length==""){
				alert("아이디 비밀번호를 입력하세요.");	
			}else{
				$.ajax({
					method : "post",
					url : './memberLogin',
					data : {
						id : id,
						pw : pw
					},
					
					success : function(data){
						data = data.trim();
						if (data ==='1'){
							location.href = "${pageContext.request.contextPath}/";
						}else{
							alert("아이디 비밀번호를 확인하세요.");
						}
					}
				})
			}
		});
	</script>


</body>
</html>