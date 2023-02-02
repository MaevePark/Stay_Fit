package kh.project.stayfit.shop.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.TIMESTAMP;

@ToString
@Getter
@Setter
public class ShopBasket {
	//장바구니에 추가
//	"PID"	NUMBER		NOT NULL,
//	"MID"	NUMBER		NOT NULL,
//	"PCOUNT"	NUMBER	DEFAULT 1	NOT NULL,
//	"CUPDATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL
	
	private int pid;
	private int mid;
	private int pcount;
	private TIMESTAMP cupdate; //String?? oracle.sql?? java.sql??
}
