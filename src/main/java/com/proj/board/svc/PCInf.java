package com.proj.board.svc;

import java.util.List;
import java.util.Map;

import com.proj.board.dto.PCDetailDto;
import com.proj.board.dto.PCDto;

public interface PCInf {

	public void mtdJoin(Map<String, String> map);

	// 로그인처리
	public int loginProc(String uid, String upw);

	/*
	 * // 마이페이지 public Object mypage(int num);
	 */

	// 회원 탈퇴
	public void mtdMemberDel(String num);

	/*
	 * // 회원 목록 조회 public List<PCDto> mtdMemberList();
	 */

	// 어드민 로그인(테이블 별도)
	public int aloginProc(String uid, String upw);

	// 어드민 글쓰기 이름값 반환
	public String uName(String uid);

	// 회원탈퇴
	public int memDelete(String uid, String upw);

	// 회원 정보 보기 마이페이지
	public List<PCDto> mypageInfo(String uid);

	// 회원수정 페이지 진입
	public List<PCDto> memModifyView(String num);

	// 회원 수정 제출 로직
	public List<PCDto> memModifyProcProc(Map<String, String> map);

	// 제품 리스트 출력
	public List<PCDetailDto> mtdPcList();

	// 제품 상세내용 보기
	public PCDetailDto mtdPcView(int pcNum);

	// 비밀번호 변경 PWmod.jsp
	public Object pwMod(String uid, String upw);

	// 비밀번호 수정 실행
	public void pwModProc(Map<String, String> map);

	// 제품 옵션 리스트 출력
	public List<PCDetailDto> mtdPcOptionList();

	// 어드민 페이지 멤버리스트
	public List<PCDto> memList();

	// 회원목록 개별 삭제 실행(어드민 페이지)
	public void memDel(String num);
	
	// 회원 수정페이지(어드민)
	public Object AdMemModi(int num);
	
	// 회원 수정(어드민) 
	public void AdMemModiProc(Map<String, String> map);

	// 아이디 찾기 작업 처리
	public int findIDProc(String uname, String phone);
	
	// 아이디 찾기 성공 페이지 이동
	public List<PCDto> mtdFindIDSucc(String uname);
	
	// 비밀번호 찾기 작업 처리
	public int findPWProc(String uid, String uname, String phone);
	
	// 비밀번호 찾기 성공 페이지 이동
	public List<PCDto> mtdFindPWSuc(String uid);



}
