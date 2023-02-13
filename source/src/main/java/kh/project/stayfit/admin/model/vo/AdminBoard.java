package kh.project.stayfit.admin.model.vo;

import lombok.Setter;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.ToString;


@ToString
@Getter
@Setter
public class AdminBoard {
// BOARD테이블
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
	private String bcname;
	private String btitle;
	private int mid;
	private int bviewcount; 
	private String bcreate;
	private String bstate;
}
