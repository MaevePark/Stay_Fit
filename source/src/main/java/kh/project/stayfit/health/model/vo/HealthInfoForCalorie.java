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
	private String bmr; // 기초대사량
	private String activityMetabolicRate; // 활동대사량
	private String digestionEnergy; // 소화를 위한 에너지
	private String age; // 나이
	private String sex; // 성별
	private String stature; // 키
	private String weight; // 몸무게
	private String goal_weight; // 목표 체중
}
