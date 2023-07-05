package com.proj.board.dto;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class PCDto {
	
	private int num;
	private String uid;
	private String upw;
	private String uname;
	private String phone;
	private String address;
	private String email;
	private Timestamp regTM;

}
