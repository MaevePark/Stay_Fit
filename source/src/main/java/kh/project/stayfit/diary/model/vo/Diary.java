package kh.project.stayfit.diary.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Diary{
//	ERD 다이어리 테이블 기준으로 작성함 담당자가 추후 변경 -mjpark	 

//	"DDATE"	DATE		NOT NULL,
//	"MID"	NUMBER		NOT NULL,
//	"BREAKFAST"	NUMBER	DEFAULT 0	NULL,
//	"SNACK1"	NUMBER	DEFAULT 0	NULL,
//	"LUNCH"	NUMBER	DEFAULT 0	NULL,
//	"SNACK2"	NUMBER	DEFAULT 0	NULL,
//	"DINNER"	NUMBER	DEFAULT 0	NULL,
//	"SNACK3"	NUMBER	DEFAULT 0	NULL,
//	"EXERCISE"	NUMBER(4)	DEFAULT 0	NULL,
//	"WEIGHT"	NUMBER(5, 2)	DEFAULT 0	NULL
	
	private Date ddate;
	private int mid;
	private int breakfast;
	private String breakfast_menu;
	private int snack1;
	private String snack1_menu;
	private int lunch;
	private String lunch_menu;
	private int snack2;
	private String snack2_menu;
	private int dinner;
	private String dinner_menu;
	private int snack3;
	private String snack3_menu;
	private int exercise;
	private int weight;
	
}
