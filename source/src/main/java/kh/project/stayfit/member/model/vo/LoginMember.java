package kh.project.stayfit.member.model.vo;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class LoginMember {
//	클래스맵핑 파일에 로그인, 회원가입 등 각각의 vo로 만들어져 있어서 합치지않고 member table 를 중복으로 일단 넣음, 담당자가 추후 변경  -mjpark	
	
//	"MID"	NUMBER		NOT NULL,
//	"MROLE"	CHAR(1)	DEFAULT 'M'	NOT NULL,
//	"MEMAIL"	VARCHAR2(100)		NOT NULL,
//	"MPW"	VARCHAR2(50)		NOT NULL,
//	"MNAME"	VARCHAR2(50)		NOT NULL,
//	"MCREATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NOT NULL,
//	"MUPDATE"	TIMESTAMP	DEFAULT CURRENT_TIMESTAMP	NULL,
//	"MSTATE"	CHAR(1)	DEFAULT 'A'	NOT NULL,
//	"PROFIMG"	VARCHAR2(1000)	DEFAULT '/resources/profile/img/기본이미지.jpg' NOT NULL
	
	private int mid;
	private char mrole;
	private String memail;
	private String mpw;
	private String mname;
	private Timestamp mcreate; //일단 timestamp 그대로
	private Timestamp mupdate; //일단 timestamp 그대로
	private char mstate;
	private String profimg;
}
