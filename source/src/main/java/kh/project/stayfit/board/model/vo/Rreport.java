package kh.project.stayfit.board.model.vo;

import lombok.ToString;
import oracle.sql.TIMESTAMP;
import lombok.Getter;
import lombok.Setter;

@ToString
@Getter
@Setter
public class Rreport {
//	"MID"	NUMBER		NOT NULL,
//	"RID"	NUMBER		NOT NULL,
//	"REPID"	NUMBER		NOT NULL,
//	"RCREATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL
	private int mid;
	private int rid;
	private int repid;
	private TIMESTAMP rcreate;
}
