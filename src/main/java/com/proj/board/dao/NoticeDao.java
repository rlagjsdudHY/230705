package com.proj.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.board.dto.NoticeDto;

@Mapper
public interface NoticeDao {
	
	public void noticeDel(String num); // 공지사항 글삭제 어드민전용

	public List<NoticeDto> NoticeList(int offset , int pageSize); // 공지사항 게시글 불러오기
	
	public int getTotalNoticeCount(); //전체게시글갯수조회

	public void noticeWrite(String title, String content, String uName); // 공지사항 게시글 쓰기

	public List<NoticeDto> result(String num); // 공지사항 게시글 자세히보기

	public void readCnt(String num); // 조회수 증가

	public List<NoticeDto> noticeSearch(String searchName); // 공지사항 글검색


}
