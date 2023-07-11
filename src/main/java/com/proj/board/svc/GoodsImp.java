package com.proj.board.svc;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.board.dao.GoodsDao;
import com.proj.board.dto.GoodsDto;

@Service
public class GoodsImp implements GoodsInf {

	@Autowired
	private GoodsDao goodsDao;

	// 장바구니 리스트
	@Override
	public List<GoodsDto> cart(String uid) {
		return goodsDao.cart(uid);
	}

	// 장바구니 리스트 삭제
	@Override
	public void mtdDelete(String[] delIdx) {
		goodsDao.mtdDelete(delIdx);

	}

	// 상품개수 수정
	@Override
	public Object cntChange(String num, String cnt) {
		return goodsDao.cntChange(num, cnt);
		// TODO Auto-generated method stub
	}
		
		// 상품 장바구니 등록 실행
	@Override
	public void goodsRegProc(Map<String, String> map) {
		goodsDao.goodsRegProc(map);
	}

}
