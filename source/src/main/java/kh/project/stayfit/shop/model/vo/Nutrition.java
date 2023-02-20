package kh.project.stayfit.shop.model.vo;

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
	
	public Nutrition() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Nutrition(int id, String product, String locbrand, Double sersize, String capunit, Double kcal,
			Double proteing, Double fatg, Double carbog) {
		super();
		this.id = id;
		this.product = product;
		this.locbrand = locbrand;
		this.sersize = sersize;
		this.capunit = capunit;
		this.kcal = kcal;
		this.proteing = proteing;
		this.fatg = fatg;
		this.carbog = carbog;
	}
	@Override
	public String toString() {
		return "Nutrition [id=" + id + ", product=" + product + ", locbrand=" + locbrand + ", sersize=" + sersize
				+ ", capunit=" + capunit + ", kcal=" + kcal + ", proteing=" + proteing + ", fatg=" + fatg + ", carbog="
				+ carbog + "]";
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getProduct() {
		return product;
	}
	public void setProduct(String product) {
		this.product = product;
	}
	public String getLocbrand() {
		return locbrand;
	}
	public void setLocbrand(String locbrand) {
		this.locbrand = locbrand;
	}
	public Double getSersize() {
		return sersize;
	}
	public void setSersize(Double sersize) {
		this.sersize = sersize;
	}
	public String getCapunit() {
		return capunit;
	}
	public void setCapunit(String capunit) {
		this.capunit = capunit;
	}
	public Double getKcal() {
		return kcal;
	}
	public void setKcal(Double kcal) {
		this.kcal = kcal;
	}
	public Double getProteing() {
		return proteing;
	}
	public void setProteing(Double proteing) {
		this.proteing = proteing;
	}
	public Double getFatg() {
		return fatg;
	}
	public void setFatg(Double fatg) {
		this.fatg = fatg;
	}
	public Double getCarbog() {
		return carbog;
	}
	public void setCarbog(Double carbog) {
		this.carbog = carbog;
	}
	
	
}
