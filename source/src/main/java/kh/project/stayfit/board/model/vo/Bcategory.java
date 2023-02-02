package kh.project.stayfit.board.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Bcategory {
	//게시판 카테고리
//	"BCID"	NUMBER		NOT NULL,
//	"BCNAME"	VARCHAR2(30)		NOT NULL
	private int bcid;
	private String bcname;
}
