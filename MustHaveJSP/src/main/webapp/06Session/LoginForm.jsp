<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../Common/BootStrap.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Session</title>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>로그인 페이지</h2>
	<br />
	<span style="color: red; font-size: 1.2em;"> <%=request.getAttribute("LoginErrMsg") == null ? "" : request.getAttribute("LoginErrMsg")%>
	</span>
	<%
	if (session.getAttribute("UserId") == null) {
	%>
	<script>
		function validateForm(form) {
			if (!form.user_id.value) {
				alert("아이디를 입력하세요.");
				return false;
			}
			if (form.user_pw.value == "") {
				alert("패스워드를 입력하세요.");
				return false;
			}
		}
	</script>
	<form action="LoginProcess.jsp" method="post" name="loginFrm"
		onsubmit="return validateForm(this);">
		<div class="form-floating mb-3">
			<input type="text" class="form-control" id="floatingInput"
				placeholder="UserId" name="user_id" style="width: 305px"> <label
				for="floatingInput">UserName</label>
		</div>
		<div class="form-floating">
			<input type="password" class="form-control" id="floatingPassword"
				placeholder="Password" name="user_pw" style="width: 305px">
			<label for="floatingPassword">Password</label>
		</div>
		<div class="row mb-3">
			<div class="col-sm-10 offset-sm-2">
				<div class="form-check">
					<input class="form-check-input" type="checkbox" id="gridCheck1">
					<label class="form-check-label" for="gridCheck1"> 아이디 기억하기
					</label>
				</div>
			</div>
		</div>
		<button type="submit" class="btn btn-primary" style="width: 305px; height: 60px;">로그인</button>
		<br />
	</form>
	<%
	} else {
	%>
	<%=session.getAttribute("UserName")%>
	회원님, 로그인하셨습니다.
	<br>
	<a href="Logout.jsp">[로그아웃]</a>
	<%
	}
	%>
</body>
</html>