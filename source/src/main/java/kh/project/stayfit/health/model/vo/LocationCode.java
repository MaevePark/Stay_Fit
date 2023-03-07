package kh.project.stayfit.health.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class LocationCode {
//	LID   NOT NULL NUMBER(2)    
//	LNAME NOT NULL VARCHAR2(60) 
	
	private int lid; // 지역 ID
	private String lname; // 지역명

}
