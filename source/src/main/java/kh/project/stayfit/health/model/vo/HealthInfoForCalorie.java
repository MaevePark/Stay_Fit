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
	private String bmr;
	private String activityMetabolicRate;
	private String digestionEnergy;
	private String age;
	private String sex;
	private String stature;
	private String weight;
	private String goal_weight;
}
