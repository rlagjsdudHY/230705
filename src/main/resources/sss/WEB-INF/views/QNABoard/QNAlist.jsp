<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
String uidSession = (String) session.getAttribute("uidSession");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>QNA 게시판 리스트</title>
<link rel="stylesheet" href="/style/style.css">
<style>
div#wrapQNA {
	margin: 0 auto;
	width: 1000px;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 900px;
	margin: 0 auto;
}

table th {
	border: 1px solid #000;
	background-color: #78b9e0;
}

table td {
	border: 1px solid #000;
}
/* 				div#submitLine { margin-top: 30px; float:right; }	 */
table#listHeader tbody tr th:nth-child(1) {
	width: 180px;
}

table#listHeader tbody tr th:nth-child(2) {
	width: 530px;
}

table#listHeader tbody tr th:nth-child(3) {
	width: 220px;
}

table#listHeader tbody tr th:nth-child(4) {
	width: 150px;
}

table#listHeader tbody tr th:nth-child(5) {
	width: 220px;
}

div#search {
	text-align: center;
}

div#nWrite {
	float: right;
}

input#searchText {
	width: 300px;
	height: 30px;
}

button {
	padding: 10px 15px;
}

.pagination {
	text-align: center;
	margin-top: 10px;
}
span#lock {
	float:left;
}
.listRowQ:hover{
	  background: silver;
}
</style>
</head>
<body>
	<div id="wrapQNA">
		<div>로그인 세션 : ${uidSession}</div>
		<h1>QnA 게시판</h1>

		<table id="listHeader">
			<tbody>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>글쓴이</th>
					<th>조회</th>
					<th>날짜</th>
				</tr>
			</tbody>
			<tbody id="listInnerQ">
				<c:forEach var="list" items="${QNAList}">
					<tr class="listRowQ"
						onclick="location.href='QNAresult?num=${list.num}'"
						data-link="${list.num}">
						<td>${list.num}</td>
						<td><span id="lock">🔒</span>${list.title}</td>
						<td>${list.writer}</td>
						<td>${list.readcnt}</td>
						<td><fmt:formatDate value="${list.regTM}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div class="pagination">
			<c:if test="${pageNum > 1}">
				<a href="?pageNum=${pageNum - 1}&pageSize=${pageSize}">&laquo;
					이전</a>
			</c:if>
			<c:forEach var="i" begin="1" end="${maxPage}">
				<c:choose>
					<c:when test="${i == pageNum}">
						<strong>${i}</strong>
					</c:when>
					<c:otherwise>
						<a href="?pageNum=${i}&pageSize=${pageSize}">${i}</a>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageNum < maxPage}">
				<a href="?pageNum=${pageNum + 1}&pageSize=${pageSize}">다음
					&raquo;</a>
			</c:if>
		</div>

		<button id="QNAwrite">글쓰기</button>
	</div>

	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>
	<script>
		//글쓰기 페이지 이동
		$(function() {
			$("#QNAwrite").click(function() {
				location.href = "/QNAwrite";
			});
		});

		// 조회수 증가 함수
		function increaseReadCount(num) {
			$.ajax({
				url : "/QNAreadCnt",
				type : "POST",
				data : {
					num : num
				},
				success : function(response) {
					// 조회수 증가 성공 시 수행할 작업 (생략 가능)
				},
				error : function(xhr, status, error) {
					console.log("조회수 증가 오류 발생: " + error);
				}
			});
		}

		// 각 QNA 리스트를 클릭했을 때 조회수 증가 이벤트 처리
		$("#listInnerQ tr.listRowQ").click(function() {
			var num = $(this).data("link");
			increaseReadCount(num);
			// 해당 QNA 상세 페이지로 이동
			location.href = "QNAresult?num=" + num;
		});
	</script>
</body>
</html>
