package com.proj.board.svc;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.board.dao.QNADao;
import com.proj.board.dto.CommentDto;
import com.proj.board.dto.QNADto;

@Service
public class QNAImp implements QNAInf {
	
	@Autowired
	private QNADao qNADao;
	
	@Override
	// QNA게시판 리스트 불러오기
	public List<QNADto> QNAList(int pageNum, int pageSize){
		return qNADao.QNAList(pageNum,pageSize);
	}
	@Override
	// QNA게시판 총 게시글 수 조회
	public int getTotalQNACount(){
		return qNADao.getTotalQNACount();
	}
	@Override // QNA 글쓰기 처리 로직
	public void QNAWrite(String title,String content,String fileName,String uid,String name) {
		qNADao.QNAWrite(title,content,fileName,uid,name);
	}
	@Override //QNA 게시글 상세보기
	public List<QNADto> QNAresult(String num){
		return qNADao.QNAresult(num);
	}
	@Override // 댓글달기
	public void comment(String num,String comment,String uname) {
		qNADao.comment(num,comment,uname);
	}
	@Override //코멘트 불러오기
	public List<CommentDto> Commentlist(String num) {
		return qNADao.Commentlist(num);
	}
	@Override // 글작성자 찾기
	public String writerFind(String num) {
		return qNADao.writerFind(num);
	}
	@Override // QNA 글삭제
	public void QNAdel(String num) {
		 qNADao.QNAdel(num);
	}
	@Override //QNA 수정페이지
	public List<QNADto> QNAmod(String num){
		return qNADao.QNAmod(num);
	}
	@Override //QNA 수정 로직
	public void QNAmodProc(String title,String content,String fileName,String uid,String name,String num){
		  qNADao.QNAmodProc(title,content,fileName,uid,name,num);
	}
	@Override //QNA글 조회수 증가
	public void QNAreadCnt(String num) {
		qNADao.QNAreadCnt(num);
	}
	
}
