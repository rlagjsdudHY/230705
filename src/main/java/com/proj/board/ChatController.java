package com.proj.board;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChatController {

	@GetMapping("/chat")
    public String chatPage() {
        return "chat";
    }

    @PostMapping("/chat")
    public String processChatRequest(@RequestParam("message") String message, Model model) {
        // 챗봇 응답 생성 로직 작성
        String response = generateChatbotResponse(message);

        // 모델에 응답 메시지를 추가하여 JSP에서 사용하도록 전달
        model.addAttribute("response", response);

        return "chat";
    }

    private String generateChatbotResponse(String message) {
        // 챗봇 응답을 생성하는 로직 작성
        String response;

        if (message.contains("안녕")) {
            response = "안녕하세요!";
        } else if (message.contains("날씨")) {
            response = "오늘은 맑은 날씨입니다.";
        } else {
            response = "죄송합니다. 이해하지 못했습니다.";
        }

        return response;
    }
}

