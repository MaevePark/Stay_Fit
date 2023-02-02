package kh.project.stayfit.admin.model.vo;

import lombok.Setter;
import lombok.Getter;
import lombok.ToString;
import oracle.sql.TIMESTAMP;

@ToString
@Getter
@Setter
public class AdminBoard {//사용여부 담당자기 결정 
	//게시물 목록 페이지
//	"BID"	NUMBER		NOT NULL,
//	"BCID"	NUMBER		NOT NULL,
//	"MID"	NUMBER		NOT NULL,
//	"BTITLE"	VARCHAR2(500)		NOT NULL,
//	"BCONTENT"	CLOB		NOT NULL,
//	"BPICK"	NUMBER	DEFAULT 0	NOT NULL,
//	"BCREATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL,
//	"BUPDATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL,
//	"BSTATE"	CHAR(1)	DEFAULT 'A'	NOT NULL
	
	private int bid;
	private int bcid;
	private int mid;
	private String btitle;
	private String bcontent; //String?? CLOB??
	private int bpick;
	private TIMESTAMP bcreate; //String?? oracle.sql?? java.sql??
	private TIMESTAMP bupdate; //String?? oracle.sql?? java.sql??
	private char bstate;
}