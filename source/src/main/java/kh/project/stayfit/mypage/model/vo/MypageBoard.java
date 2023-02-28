package kh.project.stayfit.mypage.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class MypageBoard {
	private int bid;
	private int bcid;
	private int mid;
	private String btitle;
	private String bcontent;
	private int bpick;
	private String bcreate;
	private String bupdate;
	private char bstate;
	private int bviewcount;
}
