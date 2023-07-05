<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  

 
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="UTF-8">
		<title>장바구니</title>
		<link rel="stylesheet" href="/style/style.css">
		<link rel="stylesheet" href="/style/style_Template.css">
		<style>
		main#main {	text-align: center;	margin: 20px;}
		table {margin: 10px;	border: 1px solid #eee;}				
		#btnArea {	margin: 20px;	text-align: right;}
		#btnArea button {	font-size: 20px;	padding: 10px 15px;	border-radius: 6px;	border: 1px solid #eee;
							background-color: rgba(0, 109, 41, 0.1);	color: #006a26;	margin: 10px;}
		button {cursor: pointer;}
		div#lnb {margin: 0 50px 0 0;}
		/* 장바구니 리스트 시작 */
		div#cartListArea {	width: 750px;}
		div.listColumn {padding: 12px 10px;	border-bottom: 1px dotted #888;}
		div.listColumn span {	text-align: center;		}					
		div.listColumn span input[type=checkbox]{	width: 18px;	height: 18px;	}					
		div.listColumn span {	text-align: center;		}					
		div.listColumn span:nth-child(1) {	width: 40px;	}						
		div.listColumn span:nth-child(2) { 	width: 200px;	}		
		div.listColumn span:nth-child(3) { 	flex: 1;	}		
		div.listColumn span:nth-child(4) { 	width: 60px;	}		
		div.listColumn span:nth-child(4)>input { 	width: 30px; text-align: center; margin: 5px;	font-size: 16px;	}		
		div.listColumn span:nth-child(4)>button { font-weight: bold; font-size: 16px;	}		
		div.listColumn span:nth-child(5) { 	flex: 1;	}	
		div.listColumn span:nth-child(6) { 	flex: 1;	}	
		div.listColumn span:nth-child(6) button {width: 80px;	padding: 4px 10px; border-radius: 4px; font-weight: bold;}
			
		div.listHeader {	background-color: rgba(0, 109, 41, 0.1);	margin-top: 20px; }
		div.listHeader span {	font-size: 18px;	font-weight: bold; color: #333;	line-height: 46px;	}	
		div.listRow {	width: 100%;	border-bottom: 1px solid #aaa;}
		div.listRow span {		line-height: 40px;	}					
		
		div.listRow span.delIcon:hover {font-size: 20px; font-weight: bold;}
		
		/* 장바구니 리스트 끝 */
		
		/* 장바구니 수량 수정 버튼 시작 */
		button.cntModBtn {font-size: 15px;	font-weight: bold;	padding: 3px 4px;}
		/* 장바구니 수량 수정 버튼 끝 */
		/* 장바구니 삭제버튼 영역 시작 */
		div#delBtnArea {padding: 10px 20px;}
		div#delBtnArea button {font-size: 16px; font-weight: bold;	padding: 4px 16px;}
		div#delBtnArea div {flex: 1; text-align: left;}
		div#delBtnArea div button {border-radius: 6px;}
		div#delBtnArea span:nth-child(3) {width: 160px;}
		div#delBtnArea span:nth-child(4) {width: 80px;	text-align: right;	margin-right: 40px;}
		div#delBtnArea .listRow input.cntBox {width: 36px;	font-size: 16px;	text-align: center;	padding: 1px;}
		/* 장바구니 삭제버튼 영역 끝 */
		</style>
	</head>
	<body>
		<div id="wrap">
		
			<!--  헤더템플릿 시작 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp" %>
	    	<!--  헤더템플릿 끝 -->   
	    	
	    	<main id="main" class="dFlex">
	    	
	    		<div id="lnb">
		    		<!--  메인 LNB 템플릿 시작 -->
					<%@ include file="/WEB-INF/views/ind/mainLnbTmp.jsp" %>
		    		<!--  메인 LNB 템플릿 끝 -->    	
    			</div>
				<div id="mainList">
					<form action="/goodsRegProc" id="goodsRegForm">
						<div id="cartListArea">
						<h1>장바구니</h1>
						
							<div class="listHeader listColumn dFlex">
								<span><input type="checkbox" id="chkAll" class="chkDel"></span>
								<span>상품명/옵션</span>
								<span>제품가격</span>
								<span>수량</span>
								<span>주문금액</span>
								<span>주문하기</span>
							</div>
						
							<c:set var="totalSum" value="0" />
							<c:forEach var="order" items="${cartList}">
							<div class="listRow listColumn dFlex">
								<span class="delIcon"><input type="checkbox" class="chkDel chkBox" value="${order.num}"></span>
								<span>${order.goodsName}</span>
								<fmt:formatNumber var="price" value="${order.price}" pattern="#,###원"/>
								<span>${price}</span>
								<span>
								<input type="text" name="cnt" id="cntBox" maxlength="2"  value="${order.cnt}"><br>
								<button type="submit" class="cntModBtn" value="${order.num }">변경</button>
								</span>
								
								<fmt:formatNumber var="priceSum" value="${order.price*order.cnt}" pattern="#,###원"/>
								<span>${priceSum}</span>
								<span><button id="directDeal">바로주문</button><br><button id="delete">삭제</button></span>
							</div>
							<c:set var="totalSum" value="${totalSum + order.price*order.cnt}" />
							</c:forEach>
						
						</div>  <!-- div#selArea -->
						
						<div id="delBtnArea" class="dFlex">
							<div>
								<span><button id="delBtn">선택삭제</button></span>
								<span><button id="delAllBtn">장바구니 비우기</button></span>
							</div>
							<span>총 결제액</span>
							<fmt:formatNumber var="endPrice" value="${totalSum}" pattern="#,###원"/>
							<span>${endPrice}</span>
						</div>
					</form>
					<div id="btnArea">
		    			<button>선택 주문하기</button>
		    			<button>전체 주문하기</button>
		    		</div>
				</div>
	    	</main>
	    	<!-- main#main -->
    		<form action="" id="modifyFrm" method="post"></form>
	    	
	    	<!--  푸터템플릿 시작 -->
	    	<%@ include file="/WEB-INF/views/ind/footerTmp.jsp" %>
	    	<!--  푸터템플릿 끝 --> 
				
	
		</div>
		<!-- #wrap -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
		<!-- <script src="/script/script.js"></script> -->
		<script>
		
		$(function(){
		//선택 삭제, 일괄 삭제 시작
		
		//정방향 체크
		$("input#chkAll").click(function(){
			let chkProp = $(this).prop("checked");
			//alert("chkProp : " + chkProp);
			$("span.delIcon>input.chkDel").prop("checked", chkProp);
		});
		
		//역방향 체크	
		$("span.delIcon>input.chkDel").click(function(){
			let chkLen = $("span.delIcon>input.chkDel").length;
			//alert("chkLen : " + chkLen);
			let falseCnt = 0;
			for(let i=0; i<chkLen; i++) {
				let chkToF = $("span.delIcon>input.chkDel").eq(i).prop("checked");
				if(chkToF == false) falseCnt++;
			}
			
			if (falseCnt == 0) {
				$("input#chkAll").prop("checked", true);
			} else {
				$("input#chkAll").prop("checked", false);
			}
		});
		
		// 삭제 프로세스 시작
		$("#btnDel").click(function(){	
		
			let chkLen = $("span.delIcon>input.chkDel").length;
			let trueCnt = 0;
			for (let i=0; i<chkLen; i++) {
				let chkToF = $("span.delIcon>input.chkDel").eq(i).prop("checked");
				if (chkToF == true) trueCnt++;
			}
			if (trueCnt == 0) {
				alert("삭제하실 상품을 선택해주세요");
			} else {
				let delConfirm = confirm("선택된 상품을 삭제하시겠습니까?");
				if(delConfirm) {
					$("form#chkDelForm").submit();
				} else {
					alert("취소하셨습니다.");
				}
			}
		});
		//선택 삭제, 일괄 삭제 끝
		
		 	// 수량 변경
		 	$("button.cntModBtn").click(function(){
		 		let num = $(this).val().trim();
		 		let cnt = $(this).prev().val().trim();
		 		if (parseInt(cnt)<1 || parseInt(cnt)>10) {
		 			alert("1~10 사이 값을 입력해주세요.");
		 		} else {
		 			//alert("cnt : " + cnt);
		 			location.href="/cntChange?num="+num+"&cnt="+cnt;
		 		}
		 		
		 	});
		 
		 });
		</script>
	</body>
</html>