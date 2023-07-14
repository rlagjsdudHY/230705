<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
	request.setCharacterEncoding("UTF-8");
String uidSession = (String) session.getAttribute("uidSession");
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>공지사항 게시판</title>
<link rel="stylesheet" href="/style/style.css">
<style>
div#wrapNotice {
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

tr.listRow:hover {
	background-color: rgba(0, 128, 255, 0.05);
	cursor: pointer;
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
</style>
</head>
<body>
	<div id="wrapNotice">
		<h1>공지사항 게시판</h1>
		<hr>

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
			<tbody id="listInner">
				<c:forEach var="list" items="${NoticeList}">
					<tr onclick="location.href='result?num=${list.num}'"
						data-link="${list.num}" class="listRow">
						<td>${list.num }</td>
						<td>${list.title }</td>
						<td>${list.writer }</td>
						<td>${list.readcnt }</td>
						<td><fmt:formatDate value="${list.regTM}"
								pattern="yyyy-MM-dd" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<!-- 페이징 -->
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
			<!-- 페이지 번호 출력 -->

			<c:if test="${pageNum < maxPage}">
				<a href="?pageNum=${pageNum + 1}&pageSize=${pageSize}">다음
					&raquo;</a>
			</c:if>
		</div>

		<div id="nWrite">
			<%
				if ((uidSession != null && "admin".equals(uidSession))) {
			%>
			<button type="button" id="noticeWrite">글쓰기</button>
			<%
				} else {
			%>
			<span></span>
			<%
				}
			%>
		</div>
		<form action="" id="searchFrm" method="post">
			<div id="search">
				<br> <br> <input type="text" id="searchText"
					name="searchName">
				<button type="submit" id="subsearch">검색</button>
				<button type="button" onclick="location.href='/notice'">목록</button>
			</div>
		</form>
		<!-- 			footer 삽입 -->
	</div>
	<!-- div#wrap -->
	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>
<script>
    $(document).ready(function() {
        //글쓰기 페이지 이동
        $("#noticeWrite").click(function() {
            location.href = "/write";
        });

        // 조회수 증가 함수
        function increaseReadCount(num) {
            $.ajax({
                url: "/readCnt",
                type: "POST",
                data: { num: num },
                success: function(response) {
                    // 조회수 증가 성공 시 수행할 작업 (생략 가능)
                },
                error: function(xhr, status, error) {
                    console.log("조회수 증가 오류 발생: " + error);
                }
            });
        }

        // 각 공지사항 리스트를 클릭했을 때 조회수 증가 이벤트 처리
        $("#listInner tr.listRow").click(function() {
            var num = $(this).data("link");
            increaseReadCount(num);
            // 해당 공지사항 상세 페이지로 이동
            location.href = "result?num=" + num;
        });

        // 검색기능 시작
        $("#subsearch").click(function() {
            $("#searchFrm").attr("action", "/noticeSearch");
            $("#searchFrm").submit();
        });
        // 검색기능 끝
    });
</script>
</body>
</html>



