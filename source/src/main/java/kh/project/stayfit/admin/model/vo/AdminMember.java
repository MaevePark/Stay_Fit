package kh.project.stayfit.admin.model.vo;

import lombok.Setter;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.ToString;


@ToString
@Getter
@Setter
public class AdminMember {
//	"MID"	NUMBER		NOT NULL,
//	"MROLE"	CHAR(1)	DEFAULT 'M'	NOT NULL,
//	"MEMAIL"	VARCHAR2(100)		NOT NULL,
//	"MPW"	VARCHAR2(50)		NOT NULL,
//	"MNAME"	VARCHAR2(50)		NOT NULL,
//	"MCREATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL,
//	"MUPDATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NULL,
//	"ENABLED"   CHAR(1)   DEFAULT '1'   CHECK(ENABLED='0' OR ENABLED='1') NOT NULL,
//	"PROFIMG"	VARCHAR2(1000)	DEFAULT '/resources/profile/img/기본이미지.jpg' NOT NULL

	private String profimg;
	private int mid;
	private String memail;
	private String mname;
	private int postcnt; //게시글수
	private int replycnt; //댓글수
	private int payment; //총주문금액
	private String mcreate;

}
