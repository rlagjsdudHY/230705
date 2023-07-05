<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Document</title>
<style>
/* FAQ */

div#wrapFAQ {
	margin: 0 auto;
	width: 1000px;
	text-align: center;
}

.faq {
	border-bottom: 0px solid #ddd;
	margin: 1em 0;
}

.faq .faqHeader {
	position: relative;
	zoom: 1
}

.faq .faqHeader .showAll {
	position: absolute;
	bottom: 0;
	right: 0;
	border: 0;
	padding: 0;
	overflow: visible;
	background: none;
	cursor: pointer
}

.faq .faqBody {
	margin: 0;
	padding: 0
}

.faq .faqBody .article {
	list-style: none
}

.faq .q {
	margin:
}

.faq .q a {
	display: block;
	text-align: left;
	background: url("/images/faq1_icon_q.png") no-repeat 0 0;
	padding: 0 0 0 35px;
	font-size: 18px;
	color: #5e5e5e;
	font-weight: bold;
	line-height: 27px;
	cursor: pointer;
	margin: 10px 0;
	!
	important
}

.faq .q a:hover, .faq .q a:active, .faq .q a:focus {
	
}

.faq .a {
	background: #f8f8f8 url("/images/faq1_icon_a.png") no-repeat 40px 10px;
	padding: 10px 75px 10px 75px;
	font-size: 16px;
	color: #444444;
	line-height: 22px;
	border-top: 1px solid #bdbdbd;
	margin: 5px 0 0 0;
}
</style>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-latest.js"></script>
<link rel="stylesheet" href="/style/style.css">
</head>
<body>
	<div id="wrapFAQ">
		<div class="faq">
			<div class="faqHeader">
				<!--button type="button" class="showAll">답변 모두 여닫기</button-->
			</div>
			<ul class="faqBody">
				<li class="article" id="a1">
					<p class="q">
						<a href="#">[주문검토] [주문처리] 등 주문단계가 궁금합니다</a>
					</p>
					<p class="a">[주문검토] 주문검토 단계의 경우 결제하신 이후, 작업배정되기 전 호환성에 대한 검토 등
						및 작업진행 전 주문 대기중인 상태입니다. 휴일 또는 주문량이 많을 경우 잔류하는 일자가 길어질 수 있습니다.
						[주문처리] 주문처리 단계의 경우 주문검토가 끝난 후, 실질적인 작업배정이 시작됨을 안내하는 단계입니다. 이때에
						검토단계 등에서 호환성 등 문제가 있을 경우 연락 드린 후 보정하는 단계를 거치게 됩니다</p>
				</li>
				<li class="article" id="a2">
					<p class="q">
						<a href="#">커브드 모니터 조립방법및 주의내용이 알고싶습니다.</a>
					</p>
					<p class="a">
						위 영상은 커브드 모니터 조립에 대하여 안내를 위한 조립영상이며 모니터 기종별로 조립방법이 일부 상이할 수 있습니다.
						위 영상및 안내는 대부분의 커브드모니터에서 통용되는 조립방법이나, 가급적 제품의 사용설명서의 가이드를 보고 진행하시는
						것을 권장합니다.<br>※ 조립 시 전면 보호 스티로폼 가이드 위에서 작업해주세요.<br>※ 제품을
						위에서 누르지 마세요, 패널 파손 우려가 있습니다.<br>※ 완충재 없이 화면 부분을 바닥, 책상 등 딱딱한
						곳을 향해 올려두실 경우 파손 우려가 있습니다.<br>
						<br>1. 모니터를 상자에서 안전하게 꺼낸 뒤 스티로폼 가이드 위에 놓은 상태로 스탠드 조립을 준비합니다.<br>2.
						모니터 구성품 중의 스탠드 부분을 모니터 결합 부위 위치에 알맞게 맞춘 뒤 체결하여주세요.<br>3. 스탠드를
						조립 완료하셨다면 가이드와 함께 통체로 모니터를 들어 거치하고자 하는 위치에 세팅을 해주신 뒤, 가이드를 벗겨내주세요.
					</p>
				</li>
			</ul>
		</div>
	</div>
	<!-- div#wrap -->
	<script>
		jQuery(function($) {
			var article = $('.faq > .faqBody > .article');
			article.find('.a').hide(); // Hide all answers

			$('.faq > .faqBody > .article > .q > a').click(function() {
				var myArticle = $(this).parents('.article:first');

				if (myArticle.hasClass('hide')) {
					article.addClass('hide').removeClass('show');
					article.find('.a').slideUp(100);
					myArticle.removeClass('hide').addClass('show');
					myArticle.find('.a').slideDown(100);
				} else {
					myArticle.removeClass('show').addClass('hide');
					myArticle.find('.a').slideUp(100);
				}
				return false;
			});
		});
	</script>
</body>
</html>