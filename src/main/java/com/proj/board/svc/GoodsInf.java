package com.proj.board.svc;

import java.util.List;
import java.util.Map;

import com.proj.board.dto.GoodsDto;

public interface GoodsInf {

	// 장바구니 내역
	public List<GoodsDto> cart(String uid);

	// 장바구니 리스트 삭제
	public void mtdDelete(String[] delIdx);

	// 상품개수 수정
	public Object cntChange(String num, String cnt);

	// 상품 장바구니 등록 실행
	public void goodsRegProc(Map<String, String> map);


}
