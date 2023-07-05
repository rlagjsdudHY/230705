<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	request.setCharacterEncoding("UTF-8");
String uidSession = (String) session.getAttribute("uidSession");
%>

    
    <!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="/style/style.css">
		<style>
		div#wrap { margin: 0 auto; width: 1000px; text-align: center;}
				table { border-collapse: collapse;  width:900px; margin: 0 auto; }
				table th { border: 1px solid #000;  background-color: #78b9e0; }
				table td { border: 1px solid #000;  }
/* 				div#submitLine { margin-top: 30px; float:right; }	 */
				table#listHeader tbody tr th:nth-child(1) { width: 180px; }
				table#listHeader tbody tr th:nth-child(2) { width: 530px; }
				table#listHeader tbody tr th:nth-child(3) { width: 220px; }
				table#listHeader tbody tr th:nth-child(4) { width: 150px; }
				table#listHeader tbody tr th:nth-child(5) { width: 220px; }
				div#search { text-align:center; }
				div#nWrite { float:right; }
				input#searchText { width: 300px; height: 30px;   }
				button { padding: 10px 15px; }
				
				/* 임시 CSS */
		</style>
	</head>
	<body>
		<div id="wrap">
				<c:forEach var="list" items="${QNAList}">
			<h1>글쓰기 상세보기(QNA게시판)</h1>
			<hr>
			
			<div>제목 : ${list.title}</div>
			<hr>
			<div id="QNAresultContent">
			<span>작성자 : ${list.writer }</span>
			<span>조회수 : ${list.readcnt }</span>
			<span>날짜 : <fmt:formatDate value="${list.regTM}" pattern="yyyy-MM-dd" /></span>
			</div>
			<hr>
			
			<div>내용 : 
				<c:choose>
					<c:when test="${empty list.filename}">
						<span>${list.content}</span>
					</c:when>
					<c:otherwise>
							<span> 
								<img src="/uploadDir/${list.filename}" alt="image" width="300px">
							</span>
							<br>
						<span>${list.content}</span>
					</c:otherwise>
				</c:choose>
			
			</div>
					<button onclick="location.href='/QNA'">목록</button>
			<c:if test="${writer == uid}">
				<button value="${num}" id="QNAmodFrmbtn" form="QNAmodFrm" name="num">수정</button>
				<button value="${num}" id="QNAdelFrmbtn" form="QNAdelFrm" name="num">삭제</button>
			</c:if>
			<c:if test="${uidSession != null && 'admin'.equals(uidSession)}">
				<button value="${num}" id="QNAmodFrmbtn" form="QNAmodFrm" name="num">수정</button>
				<button value="${num}" id="QNAdelFrmbtn" form="QNAdelFrm" name="num">삭제</button>
			</c:if>
			<c:if test="${uidSession == null || !'admin'.equals(uidSession)}">
				<span></span>
			</c:if>
		</c:forEach>
			<form action="" id="noticeFrm"></form>
			<form action="" id="QNAdelFrm"></form>
			<form action="" id="QNAmodFrm"></form>
			
			<!-- 댓글출력 시작 Commentlist -->
			<table id="listHeader">
				<tbody>
					<tr>
						<th>글쓴이</th>
						<th>내용</th>
						<th>날짜</th>
					</tr>
				</tbody>
				<tbody id="listInner">
			<c:forEach var="list" items="${Commentlist}">
					 <tr>  
						<td>${list.uname }</td>
						<td>${list.comment }</td>
						<td>
                            <fmt:formatDate value="${list.regTM}" pattern="yyyy-MM-dd" />
                        </td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
			
			<!-- 댓글출력 끝 -->
			<!-- 댓글달기 시작 -->
			<div>
			<span>
			내용 : <textarea cols="100" rows="2" name="comment" form="commentFrm"></textarea>
			</span>
			<span><button type="submit" id="commentBtn" form="commentFrm">등록</button></span>
			</div>
			<input type="hidden" name="num" value="${num}" form="commentFrm">
			<form action="" id="commentFrm"></form>
			<!-- 댓글달기 끝 -->
		</div>	
		<!-- div#wrap -->
		<script src="/script/jquery-3.6.4.min.js"></script>
        <script src="/script/script.js"></script>	
        <script>
        	$(function(){
        		/*게시글 삭제 시작*/
        		
				$("#QNAdelFrmbtn").click(function(){
					let QNADel = confirm("정말 삭제하시겠습니까?");
					if(QNADel){
					$("#QNAdelFrm").attr("action","/QNADel");
					$("#QNAdelFrm").submit();
					alert("삭제되었습니다.");
					}
				});
        		/*게시글 삭제 끝 */
        		
        		/*게시글 수정 시작*/
				$("#QNAmodFrmbtn").click(function(){
					$("#QNAmodFrm").attr("action","/QNAmod");
					$("#QNAmodFrm").submit();
				});
				/*게시글 수정 끝*/
        		
				/*댓글 메서드 시작*/
				$("#commentBtn").click(function(){
					$("#commentFrm").attr("action","/CommentInsert");
					$("#commentFrm").submit();
				});
        	});
        	
        </script>
	</body>
</html>
   
 