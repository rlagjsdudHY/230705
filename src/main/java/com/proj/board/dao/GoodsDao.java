package com.proj.board.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.proj.board.dto.GoodsDto;

@Mapper
public interface GoodsDao {

	// 장바구니 내역
	public List<GoodsDto> cart(String uid);

	// 장바구니 리스트 삭제
	public void mtdDelete(String[] delIdx);

	public Object cntChange(String num, String cnt);

}
