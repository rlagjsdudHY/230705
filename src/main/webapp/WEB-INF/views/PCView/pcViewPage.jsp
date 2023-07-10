<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	String uidSession = (String) session.getAttribute("uidSession");
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<link rel="stylesheet" href="/style/style_PC.css">
<link rel="stylesheet" href="/style/style_Template.css">
</head>
<body>
	<div id="wrapView">
		<header id="header">
			<!--  헤더템플릿 시작 -->
			<%@ include file="/WEB-INF/views/ind/headerTmp.jsp"%>
			<!--  헤더템플릿 끝 -->
		</header>

		<main id="main" class="dFlex">
			<div id="GoodsImage">
				<img alt="제품" src="images/TestImg.jpg"> <img alt="#"
					src="images/sampleImg.png">
				<div id="ASArea">
					<div id="a" class="dFlex">
						<span>상품문의</span> <span>1566-2728</span> <span>게시판 문의</span> <span>카카오
							상담</span>
					</div>
					<div id="b" class="dFlex">
						<span>전국 A/S</span> <span>1566-2728</span> <span>출장신청 (보증기간
							내 무료)</span>
					</div>
				</div>
			</div>
			<div id="goodsOption">
				<h1>${pcDetailDto.goodsName}</h1>
				<hr>
				<div id="opArea01" class="opArea dFlex">
					<span>모니터 포함</span>
					<div id="selArea">
						<select name="monitor" id="monitor">
							<option value="0">${pcDetailDto.monitor}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.monitorOpPrice}">
									${opList.monitorOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea02" class="opArea dFlex">
					<span>CPU</span>
					<div id="selArea">
						<select name="pcCpu" id="pcCpu">
							<option value="0">${pcDetailDto.pcCpu}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.pcCpuOpPrice}">
									${opList.pcCpuOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea03" class="opArea dFlex">
					<span>CPU 쿨러</span>
					<div id="selArea">
						<select name="cpuCooler" id="cpuCooler">
							<option value="0">${pcDetailDto.cpuCooler}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.cpuCoolerOpPrice}">
									${opList.cpuCoolerOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea04" class="opArea dFlex">
					<span>메모리</span>
					<div id="selArea">
						<select name="pcMemory" id="pcMemory">
							<option value="0">${pcDetailDto.pcMemory}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.pcMemoryOpPrice}">
									${opList.pcMemoryOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea05" class="opArea dFlex">
					<span>메인보드</span>
					<div id="selArea">
						<select name="mainboard" id="mainboard">
							<option value="0">${pcDetailDto.mainboard}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.mainboardOpPrice}">
									${opList.mainboardOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea06" class="opArea dFlex">
					<span>SSD 하드</span>
					<div id="selArea">
						<select name="ssd" id="ssd">
							<option value="0">${pcDetailDto.ssd}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.ssdOpPrice}">
									${opList.ssdOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea07" class="opArea dFlex">
					<span>HDD 추가</span>
					<div id="selArea">
						<select name="hdd" id="hdd">
							<option value="0">${pcDetailDto.hdd}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.hddOpPrice}">
									${opList.hddOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea08" class="opArea dFlex">
					<span>그래픽 카드</span>
					<div id="selArea">
						<select name="graphic" id="graphic">
							<option value="0">${pcDetailDto.graphic}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.graphicOpPrice}">
									${opList.graphicOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea09" class="opArea dFlex">
					<span>CD 드라이브</span>
					<div id="selArea">
						<select name="cd" id="cd">
							<option value="0">${pcDetailDto.cd}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.cdOpPrice}">${opList.cdOpName}
								</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea10" class="opArea dFlex">
					<span>사운드</span>
					<div id="selArea">
						<select name="sound" id="sound">
							<option value="0">${pcDetailDto.sound}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.soundOpPrice}">
									${opList.soundOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea11" class="opArea dFlex">
					<span>랜카드</span>
					<div id="selArea">
						<select name="networkCard" id="networkCard">
							<option value="0">${pcDetailDto.networkCard}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.networkCardOpPrice}">
									${opList.networkCardOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea12" class="opArea dFlex">
					<span>케이스</span>
					<div id="selArea">
						<select name="pcCase" id="pcCase">
							<option value="0">${pcDetailDto.pcCase}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.pcCaseOpPrice}">
									${opList.pcCaseOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea13" class="opArea dFlex">
					<span>파워</span>
					<div id="selArea">
						<select name="power" id="power">
							<option value="0">${pcDetailDto.power}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.powerOpPrice}">
									${opList.powerOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea14" class="opArea dFlex">
					<span>윈도우</span>
					<div id="selArea">
						<select name="windows" id="windows">
							<option value="0">${pcDetailDto.windows}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.windowsOpPrice}">
									${opList.windowsOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea15" class="opArea dFlex">
					<span>오피스</span>
					<div id="selArea">
						<select name="office" id="office">
							<option value="0">${pcDetailDto.office}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.officeOpPrice}">
									${opList.officeOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea16" class="opArea dFlex">
					<span>사은품</span>
					<div id="selArea">
						<select name="freeGift" id="freeGift">
							<option value="0">${pcDetailDto.freeGift}</option>
							<c:forEach var="opList" items="${pcOptionList}">
								<option value="${opList.freeGiftOpPrice}">
									${opList.freeGiftOpName}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div id="opArea17" class="opArea dFlex">
					<span>추가 사은품</span>
					<div id="selArea">
						<span>[해당 제품은 추가 사은품이 없습니다]</span>
					</div>
				</div>
				<div id="opArea18" class="opArea dFlex">
					<span>AS</span>
					<div id="selArea">
						<span>1년 무료 A/S(택배및본사방문,주변기기는 1개월이후 센터AS)</span>
					</div>
				</div>
				<hr>
				<div id="plusBuyArea" class="opArea dFlex">
					<span>추가 구매</span> <span>[추가된 상품이 없습니다.]</span>
				</div>
				<hr>
				<div id="orderArea" class="opArea dFlex">
					<span>주문 수량</span>
					<div id="orderCnt">
						<select name="orderCnt" id="orderCnt" form="cartForm">
							<option >1</option>
							<option >2</option>
							<option >3</option>
							<option>4</option>
							<option>5</option>
							<option>6</option>
							<option>7</option>
							<option>8</option>
							<option>9</option>
							<option>10</option>
						</select> <span>개</span>
					</div>
				</div>

				<table>
					<tbody>
						<tr>
							<th><span>제조원</span></th>
							<td><span>주식회사 원</span></td>
						</tr>
						<tr>
							<th><span>기본가격</span></th>
							<td><span id="basePrice" >${pcDetailDto.pcPrice}</span> <span>원</span>
							</td>
						</tr>
						<tr>
							<th><span>결제금액</span></th>
							<td><span id="TotalPrice" name="TotalPrice" form="cartForm">${pcDetailDto.pcPrice}</span> <span name="price" form="cartForm">원
									(V.A.T 포함)</span></td>
						</tr>
					</tbody>
				</table>
				
				<input type="hidden" name="uid" value="${uidSession}" form="cartForm" >
				<input type="hidden" name="goodsName" value="${pcDetailDto.goodsName}" form="cartForm">
				<%-- <input type="hidden" name="price"  form="cartForm" value="${TotalPrice }"> --%>
				<input type="hidden" name="cnt"  form="cartForm" value="${orderCnt }">
				
				
				<div id="btnArea">
					<span>구매하기</span> <span><button form="cartForm" id="cartFormBtn">장바구니 담기</button></span> <span>견적서 출력</span>
				</div>
				<form action="/goodsRegProc" id="cartForm"></form>
			</div>
		</main>
		
		<input type="text" form="cartForm" value="${pcDetailDto.pcPrice}" name="SS">	
		<input type="text" value="0" name="test" form="cartForm">
		<!--  푸터템플릿 시작 -->
		<%@ include file="/WEB-INF/views/ind/footerTmp.jsp"%>
		<!--  푸터템플릿 끝 -->

	</div>
	<!-- div#wrap -->

	<script src="/script/jquery-3.6.4.min.js"></script>
	<script src="/script/script.js"></script>
	<script>
		// 쉼표를 추가할 함수 정의
		function addCommas(number) {
			return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		$(function() {
			// 기본가격과 결제금액 가져오기
			var basePriceElement = $("#basePrice");
			var totalPriceElement = $("#TotalPrice");

			// 쉼표를 추가하여 값을 변경
			var basePrice = parseInt(basePriceElement.text().replace(/,/g, ""));
			basePriceElement.text(addCommas(basePrice));

			var totalPrice = parseInt(totalPriceElement.text()
					.replace(/,/g, ""));
			totalPriceElement.text(addCommas(totalPrice));

			// 제품 옵션 또는 주문 수량 변경과 동시에 최종 결제금액 수정하기
			function updateTotalPrice() {
				let cnt = parseInt($("select#orderCnt").val());
				let totalPrice = basePrice;

				// 변경된 옵션 값들의 value 값을 가져와서 기본 결제금액에 추가하기
				$("div#selArea select").each(function() {
					totalPrice += parseInt($(this).val().replace(/,/g, ""));
				});

				totalPrice *= cnt; // 주문 수량 곱하기

				// Format totalPrice with commas
				$("#TotalPrice").text(addCommas(totalPrice)); // 최종 결제금액 업데이트
				$('input[name=test]').attr('value',totalPrice);
// 				if(totalPrice != basePrice ){
// 				    $('input[name=test]').attr('value',basePrice);
// 				}
				
				
// 			 $("#cartFormBtn").click(function(){
// 				 $.ajax({
// 						url : "/goodsRegProc",
// 						type : "POST",
// 						data : {
// 							basePrice : basePrice,totalPrice : totalPrice
// 						},
// 						success : function(response) {
							
// 						},
// 						error : function(xhr, status, error) {
// 							console.log(" : " + error);
// 						}
// 					});
// 			 });
			// 에이잭스처리
// 			$.ajax({
// 				url : "/goodsRegProc",
// 				type : "POST",
// 				data : {
// 					basePrice : basePrice,totalPrice : totalPrice
// 				},
// 				success : function(response) {
					
// 				},
// 				error : function(xhr, status, error) {
// 					console.log(" : " + error);
// 				}
// 			});
			//에이잭스처리끝
			
// 			// 에이잭스처리2
// 			$.ajax({
// 				url : "/goodsRegProc",
// 				type : "POST",
// 				data : {
// 					totalPrice : totalPrice
// 				},
// 				success : function(response) {
					 
// 				},
// 				error : function(xhr, status, error) {
// 					console.log(" : " + error);
// 				}
// 			});
// 			//에이잭스처리끝2
			}

			$("div#selArea select, select#orderCnt").change(updateTotalPrice);
		
			
		});
// 	 $(function(){
// 		 $("#cartFormBtn").click(function{
// 			 $.ajax({
// 					url : "/goodsRegProc",
// 					type : "POST",
// 					data : {
// 						basePrice : basePrice,totalPrice : totalPrice
// 					},
// 					success : function(response) {
						
// 					},
// 					error : function(xhr, status, error) {
// 						console.log(" : " + error);
// 					}
// 				});
// 		 });
// 	 });
	</script>
</body>
</html>