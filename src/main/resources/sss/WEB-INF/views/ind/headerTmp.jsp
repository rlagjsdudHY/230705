<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	String uidSession_HTmp = (String) session.getAttribute("uidSession");
%>


<header id="header" class="dFlex">
	<!-- 로고, GNB -->
	<div id="headerLogo">
		<a href="/"> <img src="/images/logo.png" alt="헤더로고이미지">
		</a>
	</div>



    <nav id="gnb">
        <% if (uidSession_HTmp != null) { %>
            <span id="userInfo"><b><%= uidSession_HTmp %></b> 님 로그인 중입니다. </span>
            <ul id="mainMenu" class="dFlex">
                <li class="mainLi"><a href="/">HOME</a></li>
                <li>|</li>
                <li class="mainLi"><a href="/logout">로그아웃</a></li>
                <li>|</li>
                <li class="mainLi"><a href="/mypage?gnbParam=myPage">마이페이지</a></li>
                <li>|</li>
                <li class="mainLi"><a href="/cart?gnbParam=Cart">장바구니</a></li>
                <li>|</li>
                <li class="mainLi"><a href="/mainnotice?gnbParam=notice">고객센터</a></li>
            </ul>
        <% } else { %>
            <ul id="mainMenu" class="dFlex">
                <li class="mainLi"><a href="/">HOME</a></li>
                <li>|</li>
                <li class="mainLi"><a href="/login">로그인</a></li>
                <li>|</li>
                <li class="mainLi"><a href="/joinagree">회원가입</a></li>
                <li>|</li>
                <li class="mainLi">
                    <a href="#" onclick="showLoginMessage()">장바구니</a>
                </li>
                <li>|</li>
                <li class="mainLi"><a href="/mainnotice?gnbParam=notice">고객센터</a></li>
            </ul>
        <% } %>
    </nav>
</header>
<!--  header#header  -->
<hr class="sepLine">

<%-- Script to show login message and redirect to the login page --%>
<script>
    function showLoginMessage() {
        alert("장바구니를 이용하시려면 로그인을 먼저 해주세요.");
        window.location.href = "/login";
    }
</script>