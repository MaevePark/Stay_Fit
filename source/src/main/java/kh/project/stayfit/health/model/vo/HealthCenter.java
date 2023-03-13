package kh.project.stayfit.health.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class HealthCenter {
//	"HPNUM"	VARCHAR2(15)		NOT NULL,
//	"HPLACE"	VARCHAR2(50)		NOT NULL,
//	"HADDR"	VARCHAR2(100)		NOT NULL
//	"LID"	NUMBER		NOT NULL

	private String hpnum; // 전화번호
	private String hplace; // 측정장소
	private String haddr; // 주소
	private int lid; // 지역 ID
	private String lname; // LOCATIONCODE 테이블의 LNAME
}
