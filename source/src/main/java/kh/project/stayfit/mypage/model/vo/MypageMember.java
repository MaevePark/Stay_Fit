package kh.project.stayfit.mypage.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class MypageMember {
	private int mid;
	private char mrole;
	private String memail;
	private String mpw;
	private String mname;
	private String mcreate;
	private String mupdate;
	private char mstate;
	private String profimg;
}
