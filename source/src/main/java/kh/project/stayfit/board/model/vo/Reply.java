package kh.project.stayfit.board.model.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Reply {
//	"RID"	NUMBER		NOT NULL,
//	"BID"	NUMBER		NOT NULL,
//	"MID"	NUMBER		NOT NULL,
//	"RCONTENT"	VARCHAR2(500)		NOT NULL,
//	"RCASE"	NUMBER	DEFAULT 0	NOT NULL,
//    "RSEQ"	NUMBER		NOT NULL,
//    "RSTATE"	NUMBER	DEFAULT 0	NOT NULL,
//    "RCREATE"	TIMESTAMP		NOT NULL
	private int rid;
	private int bid;
	private int mid;
	private String rcontent;
	private int rcase;
	private int rseq;
	private int rstate;
	private Timestamp rcreate;
	private String mname;
	private String profimg;
}
