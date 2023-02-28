package kh.project.stayfit.mypage.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class MypageReply {
	private int rid;
	private int bid;
	private int mid;
	private String rcontent;
	private int rcase;
}
