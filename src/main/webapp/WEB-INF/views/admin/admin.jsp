<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("UTF-8");
	String uidSession = (String) session.getAttribute("uidSession");
%>
<!DOCTYPE html>
<html lang ="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="/style/style.css">
		<style>
		div.category {border: 1px solid #000080; margin: 10px;}
		</style>
	</head>
	<body>
		<div id="wrap">
		<div>세션:${uidSession}</div>
			<!--  헤더템플릿 시작 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp" %>
	    	<!--  헤더템플릿 끝 --> 
	    	<div class="category">
		    	<!-- 회원관리 -->
		    	<c:import url="/memList"/>
	    	</div>
	    	<br>
	    	<div class="category">
	    		<h1>공지사항 항목</h1><br>
				<!-- 공지사항 게시판 -->
				<c:import url="/notice"/><br>
				<!-- 공지사항 글쓰기 -->
				<c:import url="/write"/>
	    	</div>
			<div class="category">
				<!-- QnA -->
				<c:import url="/QNA"/>
			</div>
			
		</div>
		<!-- #wrap -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
 
	</body>
</html>