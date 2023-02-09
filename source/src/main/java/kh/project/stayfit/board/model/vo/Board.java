package kh.project.stayfit.board.model.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Board {
	
//	"BID"	NUMBER		NOT NULL,
//	"BCID"	NUMBER		NOT NULL,
//	"MID"	NUMBER		NOT NULL,
//	"BTITLE"	VARCHAR2(500)		NOT NULL,
//	"BCONTENT"	CLOB		NOT NULL,
//	"BPICK"	NUMBER	DEFAULT 0	NOT NULL,
//	"BCREATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL,
//	"BUPDATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL,
//	"BSTATE"	CHAR(1)	DEFAULT 'A'	NOT NULL
//	"BVIEWCOUNT"	NUMBER	DEFAULT 0	NOT NULL
	
	private int bid;
	private int bcid;
	private int mid;
	private String btitle;
	private String bcontent; //String?? CLOB??
	private int bpick;
	private Timestamp bcreate; //String?? oracle.sql?? java.sql??
	private Timestamp bupdate; //String?? oracle.sql?? java.sql??
	private char bstate;
	private int bviewcount;
	private String bcname;
	private String mname;


}
