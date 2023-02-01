package kh.project.stayfit.admin.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import oracle.sql.TIMESTAMP;

@ToString
@Getter
@Setter
public class AdminBoardReply {//사용여부 담당자기 결정 
	//신고댓글목록페이지
//	"MID"	NUMBER		NOT NULL,
//	"RID"	NUMBER		NOT NULL,
//	"REPID"	NUMBER		NOT NULL,
//	"RCREATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL
	private int mid;
	private int rid;
	private int repid;
	private TIMESTAMP rcreate; //String?? oracle.sql?? java.sql??

}
