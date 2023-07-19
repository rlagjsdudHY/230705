# 230705
- Spring Boot 팀프로젝트 (팀원 4명)
- Spring Boot MVC 패턴으로 구현한 컴퓨터 판매 게시판 입니다.
- 제작기간 (2023.06.23 ~ 2023.07.05)
- 
- sts4 버전 2.7.13, Java 11, MySQL 8.0.32, MyBatis
- 
- ======== 직접 구현 한 부분 ===================
-  백엔드 담당
- 
- 회원관리 - 회원가입,회원탈퇴,회원정보수정,로그인,로그아웃 구현
- 게시판   - 글쓰기,수정,삭제,파일첨부,댓글,비밀글 기능,조회수,페이징 구현
- 어드민   - 어드민로그인,어드민페이지,공지사항,QNA게시판 조회,회원관리기능
- ============================================

- WAR 배포 파일
- https://drive.google.com/file/d/1sDCxbzDZNWhR-jZznPMEo9z0VcsuuFxl/view?usp=drive_link

- 사용방법
 1. WAR 파일을 다운로드 받고 다운로드 된 파일이 저장된 폴더의 주소창의 주소를 지우고 CMD를 입력하고 Enter 후 CMD창을 띄웁니다.
 2. java -jar ComputerSite-0.0.1-SNAPSHOT.war
    를 CMD창에 입력한 후 Enter. (입력 형식이 "java -jar 파일명이름확장자까지" 입니다. 파일명 변경이 없으시면 이대로 붙여넣기 하셔도 됩니다.)
 3. CMD창에서 스프링이 실행되고 Window 보안 경고 창이 나타납니다. 액세스를 허용하고 CMD창을 열어두고(닫으면 안됩니다) 브라우저를 실행합니다.
 4. 브라우저 주소창에 http://localhost를 입력하고 실행하면 메인페이지가 나타납니다.
 5. WAR배포 파일이기에 이미지 주소가 PC마다 다르기 때문에 이미지 표시가 되지않습니다. DB도 연동 되지 않기 때문에 회원가입도 불가합니다.


![buy](https://github.com/rlagjsdudHY/230705/assets/131653393/e5dc0f51-0c69-4212-a451-0ea159e02064)
![admin](https://github.com/rlagjsdudHY/230705/assets/131653393/ef1c4d29-f7b6-4618-b3bf-e7f135ac3256)
![cart](https://github.com/rlagjsdudHY/230705/assets/131653393/44013aae-825f-4909-9b04-5323dedda909)
![agreement](https://github.com/rlagjsdudHY/230705/assets/131653393/385fe817-4e05-4a71-a6cc-e88e76e6fe39)
![board](https://github.com/rlagjsdudHY/230705/assets/131653393/adead0dd-4d03-480e-a4a0-15676da98869)
![board2](https://github.com/rlagjsdudHY/230705/assets/131653393/a6e1288a-9800-4a3d-8a02-7aa4c7850231)
![board3](https://github.com/rlagjsdudHY/230705/assets/131653393/998b49d1-6f9e-43ec-a8e2-9870fa8c46be)
![board4](https://github.com/rlagjsdudHY/230705/assets/131653393/2cc56490-e3da-4ce4-8190-b744d0f98d52)
![main1](https://github.com/rlagjsdudHY/230705/assets/131653393/9b45a371-e027-46a2-a931-d7c6e0682c53)
![main2](https://github.com/rlagjsdudHY/230705/assets/131653393/c06bca2c-931a-4795-be7b-f18f9b81d742)
![mod](https://github.com/rlagjsdudHY/230705/assets/131653393/3e03321a-a27a-4009-ae79-3de6181f346b)





