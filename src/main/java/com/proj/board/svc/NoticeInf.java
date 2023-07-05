package com.proj.board.svc;

import java.util.List;

import com.proj.board.dto.NoticeDto;

public interface NoticeInf {
	
	public void noticeDel(String num); //공지사항 삭제 어드민전용
	
	public List<NoticeDto> NoticeList(int pageNum, int pageSize); // 공지사항 게시글 목록보기

	public void noticeWrite(String title, String content, String uName); // 공지사항 게시글 등록

	// 공지사항 상세보기
	public List<NoticeDto> result(String num);

	// 조회수 증가
	public void readCnt(String num);

	public List<NoticeDto> noticeSearch(String searchName); // 공지사항 글검색

	public int getTotalNoticeCount(); //전체게시글갯수조회
	
}
