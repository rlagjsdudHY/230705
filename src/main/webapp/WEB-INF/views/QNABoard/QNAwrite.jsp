<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <!DOCTYPE html>
<html lang="ko">
				<div>세션 값: <%= session.getAttribute("uidSession") %></div>
	<head>
		<meta charset="UTF-8">
		<title>QNA 글쓰기 페이지</title>
		<style>
				div#wrap { margin: 0 auto; width: 1200px; text-align: center;}
				table { border-collapse: collapse;  width:900px; margin: 0 auto; }
				table th { border: 1px solid #000;  background-color: #78b9e0; }
				table td { border: 1px solid #000;  }
				div#submitLine { margin-top: 30px; float:right; }	
				table#listHeader tbody tr th:nth-child(1) { width: 180px; }
				table#listHeader tbody tr th:nth-child(2) { width: 530px; }
				table#listHeader tbody tr th:nth-child(3) { width: 220px; }
				table#listHeader tbody tr th:nth-child(4) { width: 150px; }
				table#listHeader tbody tr th:nth-child(5) { width: 220px; }
				div#Qtext input { width: 600px; height: 30px; margin-top: 15px;  }
				div#Qtext textarea { width: 600px; height: 140px; margin-top: 15px; }
				div#Qbutton * { width:80px; height: 35px;  margin-top: 15px; }
		</style>
	</head>
	<body>
	
		<div id="wrap">
	<!-- 헤더삽입 -->
			<h2>글쓰기</h2>
			<hr>
			<form action="" id="QNAwriteProc" method="post" enctype="multipart/form-data">
			<div id="Qtext">
				 <input type="hidden" name="writer" value="<%= session.getAttribute("uidSession") %>">		
				 <div></div>	
				<div>제목 : <input type="text" name="title"></div>
				<div>내용 : <textarea name="content" id="" ></textarea></div>
				<div><input type="file" name="fileName"></div>
				</div>
				
				<div id="Qbutton">
				<button type="submit" id="QNAWriteButton">등록</button>
				<button type="reset">다시쓰기</button>
				<button type="button" onclick="location.href='/QNA'">리스트</button>
			 	</div>
			 	<input type="hidden" value="${uName}" name="uName">
				</form>
			 
<!-- 			footer 삽입 -->
		</div>	
		<!-- div#wrap -->
		<script src="/script/jquery-3.6.4.min.js"></script>
        <script src="/script/script.js"></script>
        <script>
        	$(function(){
        		$("#QNAWriteButton").click(function(){
        			$("#QNAwriteProc").attr("action","/QNAwriteProc")
        			$("#QNA writeProc").submit();
        		});
        	});
        	
        </script>	
	</body>
</html>
   