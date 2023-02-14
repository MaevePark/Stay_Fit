package kh.project.stayfit.admin.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class AdminReport {

	private String reason;
	private int rid;
	private String rcontent;
	private int poster;
	private String rcreate;
	private int cnt;
	private int reporter;
}
