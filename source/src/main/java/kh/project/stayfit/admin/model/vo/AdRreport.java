package kh.project.stayfit.admin.model.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;


@ToString
@Getter
@Setter
public class AdRreport {//사용여부 담당자기 결정 
	//신고댓글목록페이지  // RREPORT테이블
//	"MID"	NUMBER		NOT NULL,
//	"RID"	NUMBER		NOT NULL,
//	"REPID"	NUMBER		NOT NULL,
//	"RCREATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL
	private int mid;
	private int rid;
	private int repid;
	private Timestamp rcreate; 

}
