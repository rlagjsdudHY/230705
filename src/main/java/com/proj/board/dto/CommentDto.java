package com.proj.board.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class CommentDto {
	private int num;
	private int bno;
	private String uname;
	private String comment;
	private Timestamp regTM;
}
