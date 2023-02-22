package kh.project.stayfit.shop.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@ToString
@Getter
@Setter
public class Nutrition {
	private int id;
	private String product;
	private String locbrand;
	private Double sersize;
	private String capunit;
	private Double kcal;
	private Double proteing;
	private Double fatg;
	private Double carbog;
	
}
