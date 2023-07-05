package com.proj.board.dto;

import lombok.Data;

@Data
public class PCDetailDto {
	
	private int pcNum;
	private String goodsName;
	private String monitor;
	private String pcCpu;
	private String cpuCooler;
	private String pcMemory;
	private String mainboard;
	private String ssd;
	private String hdd;
	private String graphic;
	private String cd;
	private String sound;
	private String networkCard;
	private String pcCase;
	private String power;
	private String windows;
	private String office;
	private String freeGift;
	private int pcPrice;
	
	// PC 사양 옵션
	   private int monitorOpNum;
	   private String monitorOpName;
	   private int monitorOpPrice;
	   
	   private int pcCpuOpNum;
	   private String pcCpuOpName;
	   private int pcCpuOpPrice;
	   
	   private int cpuCoolerOpNum;
	   private String cpuCoolerOpName;
	   private int cpuCoolerOpPrice;
	   
	   private int pcMemoryOpNum;
	   private String pcMemoryOpName;
	   private int pcMemoryOpPrice;
	   
	   private int mainboardOpNum;
	   private String mainboardOpName;
	   private int mainboardOpPrice;
	   
	   private int ssdOpNum;
	   private String ssdOpName;
	   private int ssdOpPrice;
	   
	   private int hddOpNum;
	   private String hddOpName;
	   private int hddOpPrice;
	   
	   private int graphicOpNum;
	   private String graphicOpName;
	   private int graphicOpPrice;
	   
	   private int cdOpNum;
	   private String cdOpName;
	   private int cdOpPrice;
	   
	   private int soundOpNum;
	   private String soundOpName;
	   private int soundOpPrice;
	   
	   private int networkCardOpNum;
	   private String networkCardOpName;
	   private int networkCardOpPrice;
	   
	   private int pcCaseOpNum;
	   private String pcCaseOpName;
	   private int pcCaseOpPrice;
	   
	   private int powerOpNum;
	   private String powerOpName;
	   private int powerOpPrice;
	   
	   private int windowsOpNum;
	   private String windowsOpName;
	   private int windowsOpPrice;
	   
	   private int officeOpNum;
	   private String officeOpName;
	   private int officeOpPrice;
	   
	   private int freeGiftOpNum;
	   private String freeGiftOpName;
	   private int freeGiftOpPrice;
	
}
