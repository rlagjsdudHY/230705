// 회원 탈퇴
$("span.delIcon").click(function() {
  var chkToF = confirm("정말로 회원탈퇴 하시겠습니까?");
  if (chkToF) {
    var num = $(this).parent("div").attr("data-link");
    location.href = "/memberDel?num=" + num;
    return false;
  } else {
    alert("회원탈퇴를 취소하셨습니다.");
    return false;
  }
});

// 제품 상세내용 보기
$("div.post").click(function() {
  let pcNum = $(this).attr("data-link");
  //alert("num : " + pcNum);
  location.href = "/pcViewPage?pcNum=" + pcNum;
});

// 클릭 이벤트 - 게시글 상세 페이지로 이동
function clickPost(postId) {
  // postId를 pcViewPage로 전달하면서 이동하는 코드 작성
  window.location.href = "/pcViewPage?id=" + postId; // 이동할 페이지의 경로와 전달할 postId를 쿼리 파라미터로 함께 전달
}

// JavaScript 코드 추가
const container = document.getElementById('container');
const items = document.querySelector('.items');
const prevButton = document.querySelector('.prev');
const nextButton = document.querySelector('.next');
const steps = document.querySelectorAll('.step');

let currentIndex = 0;

// 이전 버튼 클릭 시 이전 이미지 보여주기
prevButton.addEventListener('click', () => {
  currentIndex = (currentIndex === 0) ? items.childElementCount - 1 : currentIndex - 1;
  updateSlider();
});

// 다음 버튼 클릭 시 다음 이미지 보여주기
nextButton.addEventListener('click', () => {
  currentIndex = (currentIndex === items.childElementCount - 1) ? 0 : currentIndex + 1;
  updateSlider();
});

// 자동 이미지 슬라이드 설정 (5초마다 다음 이미지 보여주기)
let slideInterval = setInterval(() => {
  currentIndex = (currentIndex + 1) % items.childElementCount;
  updateSlider();
}, 5000);

// 슬라이더 업데이트 함수
function updateSlider() {
  const itemWidth = container.offsetWidth;
  const translateValue = -1 * currentIndex * itemWidth;

  items.style.transform = `translateX(${translateValue}px)`;

  // 활성화된 스텝 표시
  steps.forEach((step, index) => {
    step.classList.toggle('active-step', index === currentIndex);
  });

  // 자동 슬라이드 간격 초기화
  clearInterval(slideInterval);
  slideInterval = setInterval(() => {
    currentIndex = (currentIndex + 1) % items.childElementCount;
    updateSlider();
  }, 5000);
}

// Chatbot 버튼 클릭 시 Chatbot 창 토글
    const chatbotButton = document.getElementById('chatbot-button');
    const chatbotWindow = document.getElementById('chatbot-window');
    const chatOptionsContainer = document.getElementById('chatbot-options-container');

    chatbotButton.addEventListener('click', () => {
      chatOptionsContainer.style.display = 'none'; // 선택 창 닫기
      chatbotWindow.style.display = chatbotWindow.style.display === 'none' ? 'block' : 'none';
      chatbotInput.focus(); // 챗봇 창이 열릴 때 입력 창에 포커스 설정
    });

    const chatbotInput = document.getElementById('chatbot-input-text');
    const chatbotContent = document.getElementById('chatbot-content');

    chatbotInput.addEventListener('keydown', (event) => {
      if (event.key === 'Enter') {
        event.preventDefault();
        const inputText = chatbotInput.value.trim();
        if (inputText !== '') {
          handleChatbotInput(inputText);
          chatbotInput.value = '';
        }
      } else if (event.key === '^') {
        event.preventDefault();
        toggleChatbotOptions();
      }
    });

    function handleChatbotInput(inputText) {
      const chatMessage = createChatMessage('User', inputText);
      chatbotContent.appendChild(chatMessage);

      if (inputText === '안녕') {
        handleOptionClick('안녕');
      } else if (inputText === '날씨') {
        handleOptionClick('날씨');
      } else {
        const responseMessage = createChatMessage('Chatbot', '죄송해요, 이해하지 못했습니다.');
        chatbotContent.appendChild(responseMessage);
      }

      chatbotContent.scrollTop = chatbotContent.scrollHeight;
    }

    function createChatMessage(sender, message) {
      const chatMessage = document.createElement('div');
      chatMessage.classList.add('chat-message');
      chatMessage.textContent = `${sender}: ${message}`;
      return chatMessage;
    }

    function toggleChatbotOptions() {
      chatOptionsContainer.style.display = chatOptionsContainer.style.display === 'none' ? 'block' : 'none';
    }

    function handleOptionClick(option) {
      const chatMessage = createChatMessage('User', option);
      chatbotContent.appendChild(chatMessage);
      chatbotInput.value = option;

      if (option === '안녕') {
        const responseMessage = createChatMessage('Chatbot', '안녕하세요! 고객님');
        chatbotContent.appendChild(responseMessage);
      } else if (option === '날씨') {
        const responseMessage = createChatMessage('Chatbot', '오늘의 날씨는 맑아요');
        chatbotContent.appendChild(responseMessage);
      }

      chatbotContent.scrollTop = chatbotContent.scrollHeight;
      toggleChatbotOptions();
    }

    const chatbotSubmitButton = document.getElementById('chatbot-input-submit');
    chatbotSubmitButton.addEventListener('click', () => {
      const inputText = chatbotInput.value.trim();
      if (inputText !== '') {
        handleChatbotInput(inputText);
        chatbotInput.value = '';
      }
    });

    document.addEventListener('DOMContentLoaded', () => {
      showChatbotOptions(['안녕', '날씨']);
    });

    function showChatbotOptions(options) {
      chatOptionsContainer.innerHTML = '';

      options.forEach((option) => {
        const optionItem = document.createElement('div');
        optionItem.classList.add('chat-option');
        optionItem.textContent = option;
        optionItem.addEventListener('click', () => handleOptionClick(option));
        chatOptionsContainer.appendChild(optionItem);
      });
    }