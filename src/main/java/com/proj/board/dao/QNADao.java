package com.proj.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.board.dto.CommentDto;
import com.proj.board.dto.QNADto;

@Mapper
public interface QNADao {

	
	public List<QNADto> QNAList(int pageNum, int pageSize); //QNA 게시판 게시글 불러오기
	
	public int getTotalQNACount(); //QNA 총 게시글 조회
	
	public void QNAWrite(String title,String content,String fileName,String uid,String name); // QNA 게시판 글쓰기 처리 로직
	
	public List<QNADto> QNAresult(String num); // QNA 글 상세보기
	
	public void comment(String num,String comment,String uname); // 코멘트달기
	
	public List<CommentDto> Commentlist(String num); //코멘트 불러오기
	
	public String writerFind(String num); //글작성자찾기
	
	public void QNAdel(String num); // QNA 글삭제
	
	public List<QNADto> QNAmod(String num); // QNA 수정 페이지
	
	public void QNAmodProc(String title,String content,String fileName,String uid,String name,String num); // QNA 글수정 로직
	
	public void QNAreadCnt(String num); // QNA 글 조회수 증가
	
}
