<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>        
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
		/* scoreList.jsp 시작 */
div#wrapList {
    width: 100%;
}

header#header {		padding: 0 30px; justify-content: space-between;	}
#header button {	width: 110px; height: 36px; 	font-size: 18px;
					font-weight: bold; padding: 4px 10px; 	
					margin: 0 10px; 	transform: translateY(24px);	}
#header button:hover {	font-weight: bold;	}	

				
div.listHeader {	width: 100%;	font-size: 19px; font-weight: bold; 
					margin-top: 20px; 
					background-color: #78b9e0;	}	}
div.listHeader span {	color: #333;	line-height: 46px;	}	
div.listRow {	width: 100%;	border-bottom: 1px solid #aaa;}
div.listRow:hover {		background-color: rgba(0, 128, 255, 0.05);	
						cursor: pointer;	}
div.listRow span {		line-height: 40px;	}					
div.listColumn span {	text-align: center;		}					
div.listColumn span:nth-child(1) {	width: 60px;	}					
div.listColumn span:nth-child(2) { 	width: 80px;	}					
div.listColumn span:nth-child(3) { 	width: 80px;	}					
div.listColumn span:nth-child(4) { 	width: 150px;	}		
div.listColumn span:nth-child(5) { 	flex: 1;	}					
div.listColumn span:nth-child(6) { 	width: 150px;	}		
div.listColumn span:nth-child(7) { 	width: 140px;	}		
div.listColumn span:nth-child(8) { 	width: 60px;	}

div.listRow span.delIcon:hover {font-size: 20px; font-weight: bold;}
		
		</style>
	</head>
	<body>
		<div id="wrapList">
		<div id="listArea">
			<h1>회원관리</h1>
			<div class="listHeader listColumn dFlex">
				<span>번호</span>
				<span>아이디</span>
				<span>이름</span>
				<span>핸드폰</span>
				<span>주소</span>
				<span>이메일</span>
				<span>가입시간</span>
				<span>삭제</span>
			</div>
			<c:forEach var="list" items="${memList}">
			<div class="listRow listColumn dFlex" data-link="${list.num}">
				<span>${list.num}</span>
				<span>${list.uid}</span>
				<span>${list.uname}</span>
				<span>${list.phone}</span>
				<span>${list.address}</span>
				<span>${list.email}</span>
				<fmt:formatDate var="regTM" value="${list.regTM}" pattern="yyyy-MM-dd"/>
				<span>${regTM}</span>
				<span class="deleteq">&times;</span>
			</div>
			</c:forEach>
		</div>
		<!-- div#listArea -->
		
		</div>
		<!-- #wrap -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>

  		<script>
  		$(function(){
  			
            // 회원 수정페이지 가기
            $("div.listRow").click(function(){
               let num = $(this).attr("data-link");
               //alert("num : " + num);
               location.href="/AdMemModi?num="+num;
            });
            
            // 리스트 개별 삭제
            $("span.deleteq").click(function(){
               let chkToF = confirm("선택하신 회원을 삭제하시겠습니까?");
               if(chkToF) {
                  let num = $(this).parent("div").attr("data-link");
                  alert(num+ "번 회원이 삭제됩니다.");
                  location.href="/memDel?num="+num;
                  return false;
               } else {
                  alert("취소하셨습니다.");
                  return false;
               }
            });
  		});
  		</script>
  		
	</body>
</html>