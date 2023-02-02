package kh.project.stayfit.board.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class BoardReply {
//	"RID"	NUMBER		NOT NULL,
//	"BID"	NUMBER		NOT NULL,
//	"MID"	NUMBER		NOT NULL,
//	"RCONTENT"	CHAR		NOT NULL,
//	"RCASE"	NUMBER	DEFAULT 0	NOT NULL
	private int rid;
	private int bid;
	private int mid;
	private char rcontent;
	private int rcase;

}
