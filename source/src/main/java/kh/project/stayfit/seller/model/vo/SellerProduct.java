package kh.project.stayfit.seller.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class SellerProduct {
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
	private String cname;
	private String pname;
	private String pimage;
	private String pprice;
	private Integer psales; // int -> Integer로 바꾸면 insert등 할 때 입력값이 없어도 오류안남
	private Integer pstock;
	private String plink;
	
}
