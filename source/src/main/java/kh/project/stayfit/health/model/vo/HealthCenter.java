package kh.project.stayfit.health.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class HealthCenter {
//	"HPNUM"	VARCHAR2(15)		NOT NULL,
//	"HID"	NUMBER		NOT NULL,
//	"HPLACE"	VARCHAR2(50)		NOT NULL,
//	"HADDR"	VARCHAR2(100)		NOT NULL

	private String hpnum;
	private int hid;
	private String hplace;
	private String haddr;
	
}
