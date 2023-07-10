package com.proj.board.svc;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.board.dao.PCDao;
import com.proj.board.dto.PCDetailDto;
import com.proj.board.dto.PCDto;

@Service
public class PCImp implements PCInf {

	@Autowired
	private PCDao pCDao;

	@Override
	public void mtdJoin(Map<String, String> map) {
		pCDao.mtdJoin(map);
	}

	@Override // 로그인처리
	public int loginProc(String uid, String upw) {
		return pCDao.loginProc(uid, upw);
	}

	/*
	 * // 마이페이지
	 * 
	 * @Override public Object mypage(int num) { return pCDao.mypage(num); }
	 */

	// 회원 탈퇴
	@Override
	public void mtdMemberDel(String num) {
		pCDao.mtdMemberDel(num);
	}
	/*
	 * // 회원목록 조회
	 * 
	 * @Override public List<PCDto> mtdMemberList() { return pCDao.mtdMemberList();
	 * }
	 */

	@Override // 어드민 로그인처리 (테이블 별도)
	public int aloginProc(String uid, String upw) {
		return pCDao.aloginProc(uid, upw);
	}

	@Override // 어드민 글쓰기 처리 이름 반환
	public String uName(String uid) {
		return pCDao.uName(uid);
	}

	@Override // 회원탈퇴
	public int memDelete(String uid, String upw) {
		return pCDao.memDelete(uid, upw);
	}

	@Override // 회원정보 마이페이지
	public List<PCDto> mypageInfo(String uid) {
		return pCDao.mypageInfo(uid);
	}

	@Override // 회원수정 페이지 진입
	public List<PCDto> memModifyView(String num) {
		return pCDao.memModifyView(num);
	}

	@Override // 회원 수정 제출 로직
	public List<PCDto> memModifyProcProc(Map<String, String> map) {
		return pCDao.memModifyProcProc(map);
	}

	// 제품 리스트 출력
	@Override
	public List<PCDetailDto> mtdPcList() {
		return pCDao.mtdPcList();
	}

	// 제품 상세내용 보기
	@Override
	public PCDetailDto mtdPcView(int pcNum) {
		return pCDao.mtdPcView(pcNum);
	}

	// 비밀번호 변경 PWmod.jsp
	@Override
	public Object pwMod(String uid, String upw) {
		return pCDao.pwMod(uid, upw);
	}

	// 비밀번호 수정 실행
	@Override
	public void pwModProc(Map<String, String> map) {
		pCDao.pwModProc(map);
	}

	// 제품 옵션 리스트 출력
	@Override
	public List<PCDetailDto> mtdPcOptionList() {
		return pCDao.mtdPcOptionList();
	}

	// 어드민 페이지 멤버리스트
	@Override
	public List<PCDto> memList() {
		return pCDao.memList();
	}

	// 회원목록 개별 삭제 실행(어드민 페이지)
	@Override
	public void memDel(String num) {
		pCDao.memDel(num);
	}

	// 회원 수정페이지(어드민)
	@Override
	public Object AdMemModi(int num) {
		return pCDao.AdMemModi(num);
	}

	// 회원 수정(어드민)
	@Override
	public void AdMemModiProc(Map<String, String> map) {
		pCDao.AdMemModiProc(map);
	}

	// 아이디 찾기 작업 처리
	@Override
	public int findIDProc(String uname, String phone) {
		return pCDao.findIDProc(uname, phone);
	}

	// 아이디 찾기 성공 페이지 이동
	@Override
	public List<PCDto> mtdFindIDSucc(String uname) {
		return pCDao.mtdFindIDSucc(uname);
	}
	
	// 비밀번호 찾기 작업 처리
	@Override
	public int findPWProc(String uid, String uname, String phone) {
		return pCDao.findPWProc(uid, uname, phone);
	}
	
	// 비밀번호 찾기 성공 페이지 이동
	@Override
	public List<PCDto> mtdFindPWSuc(String uid) {
		return pCDao.mtdFindPWSuc(uid);
	}

}