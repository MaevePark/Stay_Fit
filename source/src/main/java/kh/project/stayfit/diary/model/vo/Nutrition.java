package kh.project.stayfit.diary.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Nutrition {
//	ERD 영양성분 테이블 기준으로 작성함 담당자가 추후 변경 -mjpark  

//	"ID"	NUMBER(6)		NOT NULL,
//	"PRODUCT"	VARCHAR2(200)		NOT NULL,
//	"LOCBRAND"	VARCHAR2(50)		NULL,
//	"BIGCATEG"	VARCHAR2(30)		NULL,
//	"DETAILCATEG"	VARCHAR2(30)		NULL,
//	"SERSIZE"	NUMBER(6, 2)	DEFAULT 0	NULL,
//	"CAPUNIT"	VARCHAR2(5)		NOT NULL,
//	"KCAL"	NUMBER(8, 2)	DEFAULT 0	NULL,
//	"MOISTML"	NUMBER(8, 2)	DEFAULT 0	NULL,
//	"PROTEING"	NUMBER(8, 2)	DEFAULT 0	NULL,
//	"FATG"	NUMBER(8, 2)	DEFAULT 0	NULL,
//	"CARBOG"	NUMBER(8, 2)	DEFAULT 0	NULL,
//	"SUGARG"	NUMBER(8, 2)	DEFAULT 0 NULL,
//	"CHOLESTEMG"	NUMBER(8, 2)	DEFAULT 0	NULL,
//	"SATFATG"	NUMBER(8, 2)	DEFAULT 0	NULL
	
	private int id;
	private String product;
	private String locbrand;
	private String bigcateg;
	private String detailcateg;
	private int sersize;
	private String capunit;
	private int kcal;
	private int moistml;
	private int proteing;
	private int fatg;
	private int carbog;
	private int sugarg;
	private int cholestemg;
	private int satfatg;
	
	
}
