package kh.project.stayfit.shop.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class ShopProduct {//사용여부 담당자기 결정 
	//쇼핑몰페이지 
//	"PID"	NUMBER		NOT NULL,
//	"CID"	NUMBER		NOT NULL,
//	"PNAME"	VARCHAR2(500)		NOT NULL,
//	"PIMAGE"	VARCHAR2(500)		NOT NULL,
//	"PPRICE"	NUMBER		NOT NULL,
//	"PSALES"	NUMBER	DEFAULT 0	NULL,
//	"PSTOCK"	NUMBER	DEFAULT 0	NULL,
//	"PSALE"	NUMBER(2)	DEFAULT 0	NOT NULL
	
	private int pid;
	private int cid;
	private String pname;
	private String pimage;
	private int pprice;
	private int psales;
	private int pstock;
	private int psale;

}
