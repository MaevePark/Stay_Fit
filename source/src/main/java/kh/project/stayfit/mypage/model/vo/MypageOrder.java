package kh.project.stayfit.mypage.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class MypageOrder {
	private int oid;
	private int pid;
	private int mid;
	private int lmid;
	private String odate;
	private int ocount;
}
