<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Chatbot Example</title>
</head>
<body>
    <h1>Chatbot Example</h1>

    <button onclick="openChatPopup()">챗봇 열기</button>

    <script>
        function openChatPopup() {
            // 팝업창을 열고 chat.html을 로드하는 로직을 작성
            window.open("/chat.html", "_blank", "width=400,height=600");
        }
    </script>
</body>
</html>