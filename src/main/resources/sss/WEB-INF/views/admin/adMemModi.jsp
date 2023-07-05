<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   

<!DOCTYPE html>
<html lang ="ko">
	<head>
		<meta charset="UTF-8">
		<title>Document</title>
		<link rel="stylesheet" href="/style/style.css">
		<link rel="stylesheet" href="/style/style_mypage.css">
	</head>
	<body>
		<div id="wrap">
		
			<main id="main" class="dFlex">
	    	
	    		<div id="lnb">
		    		<!--  메인 LNB 템플릿 시작 -->
					<%@ include file="/WEB-INF/views/ind/mainLnbTmp.jsp" %>
		    		<!--  메인 LNB 템플릿 끝 -->    	
    			</div>
    			<div id="mainTbl">
					<form action="/AdMemModiProc" id="AdMemModiProc">
				    <table>
				        <tbody>
				            <tr>
				                <td colspan="2">회원정보</td>
				            </tr>
				            <tr>
				                <td>아이디</td>
				                <td> ${AdMemModi.uid}</td>
				            </tr>
				            <tr>
				                <td>이름</td>
				                <td><input type="text" value="${AdMemModi.uname}" name="uname"></td>
				            </tr>
				            <tr>
				                <td>전화번호</td>
				                <td><input type="text" value="${AdMemModi.phone}" name="phone"></td>
				            </tr>
				            <tr>
				                <td>주소</td>
				                <td><input type="text" value="${AdMemModi.address}" name="address"></td>
				            </tr>
				            <tr>
				                <td>이메일</td>
				                <td><input type="text" value="${AdMemModi.email}" name="email"></td>
				            </tr>
				        </tbody>
				    </table>
				    <input type="hidden" name="uid"  value="${AdMemModi.uid}">
				    <input type="hidden" name="num" value="${AdMemModi.num}">
					<div id="btnArea">
						<button type="submit" id="">수정하기</button>
						<button type="reset">다시쓰기</button>
					</div>
					</form>
    			</div>
			
			</main>
		</div>
		<!-- #wrap -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
  		<script src="/script/script.js"></script>
  		<script>
  		</script>
	</body>
</html>