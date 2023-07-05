<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String uidSession_MLTmp = (String) session.getAttribute("uidSession");
request.setCharacterEncoding("UTF-8");

String gnbParam = "";
if (request.getParameter("gnbParam") != null) {
	gnbParam = request.getParameter("gnbParam");
}
%>

<nav id="mainLNB">
	<ul id="lnbMainMenu">

		<%
			if (uidSession_MLTmp == null) {
			// 비로그인 상태에서 출력할 메뉴 항목
			if (gnbParam.equals("")) {
		%>
		<li class="lnbMainLi"><a href="#">menu1</a></li>
		<li class="lnbMainLi"><a href="#">menu2</a></li>
		<li class="lnbMainLi"><a href="#">menu3</a></li>
		<li class="lnbMainLi"><a href="#">menu4</a></li>
		<%
			} else if (gnbParam.equals("notice")) {
		%>
	    <li class="lnbMainLi"><a href="#" data-url="/notice?gnbParam=notice">공지사항</a></li>
        <li class="lnbMainLi"><a href="#" data-url="/QNA?gnbParam=notice">QnA 게시판</a></li>
        <li class="lnbMainLi"><a href="#" data-url="/FAQ?gnbParam=notice">FAQ</a></li>
		<%
			} else {
		%>
		<li class="lnbMainLi"><a href="#">menu1</a></li>
		<li class="lnbMainLi"><a href="#">menu2</a></li>
		<li class="lnbMainLi"><a href="#">menu3</a></li>
		<li class="lnbMainLi"><a href="#">menu4</a></li>
		<%
			}
		} else {
		// 로그인 상태에서 출력할 메뉴 항목
		if (gnbParam.equals("myPage")) {
		%>
		<li class="lnbMainLi"><a href="/mypage?gnbParam=myPage">마이페이지</a></li>
		<li class="lnbMainLi"><a href="/memModifyProc?gnbParam=myPage">회원정보수정</a></li>
		<li class="lnbMainLi"><a href="/pwMod?gnbParam=myPage">비밀번호변경</a></li>
		<li class="lnbMainLi"><a href="">결제내역</a></li>
		<li class="lnbMainLi"><a href="/delete?gnbParam=myPage">회원탈퇴</a></li>
		<%
			} else if (gnbParam.equals("Cart")) {
		%>
		<li class="lnbMainLi"><a href="/mypage?gnbParam=myPage">마이페이지</a></li>
		<li class="lnbMainLi"><a href="#">구매내역</a></li>
		<li class="lnbMainLi"><a href="#">menu4</a></li>
		<%
		
			} else if (gnbParam.equals("notice")) {
		%>
	    <li class="lnbMainLi"><a href="#" data-url="/notice?gnbParam=notice">공지사항</a></li>
        <li class="lnbMainLi"><a href="#" data-url="/QNA?gnbParam=notice">QnA 게시판</a></li>
        <li class="lnbMainLi"><a href="#" data-url="/FAQ?gnbParam=notice">FAQ</a></li>
		<%
			} else {
		%>
		<%
			}
		%>
		<%
			}
		%>

	</ul>
</nav>