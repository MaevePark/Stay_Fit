package kh.project.stayfit.diary.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Exercise{
	
	private int exid;
	private String exercise;
	private int five_m_kcal;
	private int ten_m_kcal;
	private int thirty_m_kcal;
	private int one_h_kcal;
	
}
