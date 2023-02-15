<%@ page import="model1.board.BoardDAO"%>
<%@ page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%@ include file="../Common/BootStrap.jsp"%>
<%
String num = request.getParameter("num");
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);
String sessionId = session.getAttribute("UserId").toString();
if (!sessionId.equals(dto.getId())) {
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script type="text/javascript">
	function validateForm(form) {
		if (form.title.value == "") {
			alert("제목을 입력하세요.");
			form.title.focus();
			return false;
		}
		if (form.content.value == "") {
			alert("내용을 입력하세요.");
			form.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<jsp:include page="../Common/Link.jsp" />
	<h2>회원제 게시판 - 수정하기(Edit)</h2>
	<form action="EditProcess.jsp" name="writeFrm" method="post"
		onsubmit="return validateForm(this);">
		<input type="hidden" name="num" value="<%=dto.getNum()%>" />
		<table class="table table table-bordered" width="90%">
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" style="width: 90%;"
					value="<%=dto.getTitle()%>" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td class="form-floating"><textarea class="form-control"
						placeholder="Leave a comment here" id="floatingTextarea2"
						name="content" style="width: 90%; height: 100px;"></textarea> <label
					for="floatingTextarea2">내용을 입력하세요</label></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit" style="position:relative; --bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .8rem;" class="btn btn-outline-primary">작성완료</button>
					<button type="reset" style="position:relative; --bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .8rem;" class="btn btn-outline-primary">다시 입력</button>
					<button type="button" style="position:relative; --bs-btn-padding-y: .25rem; --bs-btn-padding-x: .5rem; --bs-btn-font-size: .8rem;" class="btn btn-outline-primary" onclick="location.href='List.jsp';">목록
						보기</button>

				</td>
			</tr>
		</table>
	</form>
</body>
</html>