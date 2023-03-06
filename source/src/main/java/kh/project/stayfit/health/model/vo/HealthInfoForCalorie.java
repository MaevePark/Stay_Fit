package kh.project.stayfit.health.model.vo;

import org.springframework.stereotype.Component;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
@Component
public class HealthInfoForCalorie {
	private String gender; // 성별 (여,남)
	private int stature; // 키
	private int weight; // 체중
	private int goal_weight; // 목표 체중
	private String age; // 연령
	private int goal_term; // 체중 감량 기간
	private String goal_term_type; // 체중 감량 기간 타입 (개월,일)
	private String st_weight_float; // 표준 체중
	private String be_Weight_float; // 미용 체중
	private String bmr; // 기초대사량
	private String amr; // 활동대사량
	private String digestionEnergy; // 소화를 위한 에너지
}
