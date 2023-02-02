package kh.project.stayfit.admin.model.vo;

import java.sql.Timestamp;

public class AdOrder {
//ORDER 테이블
//	"OID"	NUMBER		NOT NULL,
//	"PID"	NUMBER		NOT NULL,
//	"MID"	NUMBER		NULL,
//    "LMID"	NUMBER		NULL,
//	"ODATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL,
//	"OCOUNT"	NUMBER		NOT NULL
	private int oid;
	private int pid;
	private int mid;
	private int lmid;
	private Timestamp odate;  // 담당자 import확인
	private int ocount;


}
