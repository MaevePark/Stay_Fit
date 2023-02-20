package kh.project.stayfit.shop.controller;

import java.text.DecimalFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.common.Crawling;
import kh.project.stayfit.shop.model.service.ShopService;
import kh.project.stayfit.shop.model.service.ShopServiceImpl;
import kh.project.stayfit.shop.model.vo.Nutrition;


@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	private ShopService service;
	
	@GetMapping({"", "/", "/main"})
	public ModelAndView shopMainPage(ModelAndView mv) {
		mv.addObject("sectionName", "shop/main.jsp?searchProduct=0");
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping({"/go"})
	public ModelAndView crawl(ModelAndView mv) {
		crawl();
		return mv;
	}
	
	
	private void crawl() {
		WebDriver driver = null;
		WebDriverWait wait = null;
		try {
			DecimalFormat df = new DecimalFormat("#.##"); 
			// drvier 설정 - 저는 d드라이브 work 폴더에 있습니다.
			System.setProperty("webdriver.chrome.driver", "D:\\chrome_driver\\chromedriver.exe");
			ChromeOptions options = new ChromeOptions();
//			options.addArguments("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36");
//			options.addArguments("lang=ko_KR");
			options.addArguments("headless");
//			options.setExperimentalOption("excludeSwitches", Collections.singletonList("enable-automation"));
//			options.setExperimentalOption("useAutomationExtension", false);

			// Chrome 드라이버 인스턴스 설정
			driver = new ChromeDriver(options);
			//driver = new ChromeDriver();
			wait = new WebDriverWait(driver, Duration.ofSeconds(10));

			// WebElement firstResult = new WebDriverWait(driver, Duration.ofSeconds(10)).until(ExpectedConditions.elementToBeClickable(By.xpath("//a/h3")));
			// 스크립트를 사용하기 위한 캐스팅
			JavascriptExecutor js = (JavascriptExecutor) driver;

			// URL로 접속
			driver.get("https://www.fatsecret.kr/%EC%B9%BC%EB%A1%9C%EB%A6%AC-%EC%98%81%EC%96%91%EC%86%8C/");
			
			Thread.sleep(1000);
			WebElement element = driver.findElement(By.xpath("//*[@id=\"ctl12_ctl04_ByFood\"]"));
			element.click();
			element.sendKeys("다신샵");
			Thread.sleep(1000);
			element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[2]/div/div[1]/table/tbody/tr[2]/td/div/img"));
			element.click();
			Thread.sleep(1000);
			
			Map<String, ArrayList> allParams = new HashMap<String, ArrayList>();
			
			ArrayList<String> locbrandList = new ArrayList<String>();
			ArrayList<String> productList = new ArrayList<String>();
			ArrayList<Double> sersizeList = new ArrayList<Double>();
			ArrayList<String> capunitList = new ArrayList<String>();
			ArrayList<Double> kcalList = new ArrayList<Double>();
			ArrayList<Double> proteingList = new ArrayList<Double>();
			ArrayList<Double> fatgList = new ArrayList<Double>();
			ArrayList<Double> carbogList = new ArrayList<Double>();
			
			Boolean loop = true;
			int z = 0;
			while(loop) {
				Thread.sleep(3000);
				List<WebElement> elements = driver.findElements(By.cssSelector("a.prominent"));
				// 마지막 페이지를 제외한 나머지 페이지는 10개
				int n = elements.size();
				System.out.println("------------------------------------------------------------------------");
				System.out.println("이 페이지에서 추출할 상품 개수 : "+n+"개");
				for (int i=0; i<n; i++) {
					z = i;
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr[" + (z + 1) + "]/td/a[1]"));
					element.sendKeys(Keys.ENTER);
					Thread.sleep(3000);
					
					System.out.println("******************************************************************");
					System.out.println(i);
					//브랜드
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/div/div/table/tbody/tr/td/div[2]/h2/a"));
					Thread.sleep(500);
					System.out.println("상품 브랜드 : "+element.getText());
					locbrandList.add(element.getText());
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/div/div/table/tbody/tr/td/div[2]/h1"));
					System.out.println("상품 명 : "+element.getText());
					productList.add(element.getText());
					Thread.sleep(500);
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[1]/div[1]/div[4]"));
					Thread.sleep(500);
					
					if(element.getText().contains("(") && element.getText().contains(")")) { //1인분 (140 g) 형식으로 제공되는 경우
						System.out.println("---4");
						int idx1 = element.getText().indexOf("(");
						int idx2 = element.getText().indexOf(")");
						if(element.getText().substring(idx2-1, idx2).equals("g")) {
							sersizeList.add(Double.parseDouble(element.getText().substring(idx1 + 1, idx2 - 2)));
							capunitList.add(element.getText().substring(idx2-1, idx2));
						} else { 
							sersizeList.add(Double.parseDouble(element.getText().substring(idx1 + 1, idx2 - 3)));
							capunitList.add(element.getText().substring(idx2-2, idx2));
						}
					} else { //단품 상품으로, 1회 제공량이 따로 명시되지 않은 경우
						System.out.println("---5");
						if(element.getText().contains("g")) {
							int idx1 = element.getText().indexOf("g");
							sersizeList.add(Double.parseDouble(element.getText().substring(0, idx1 - 1)));
							capunitList.add(element.getText().substring(idx1, idx1+1));
						} else if(element.getText().contains("ml")) {
							int idx1 = element.getText().indexOf("ml");
							sersizeList.add(Double.parseDouble(element.getText().substring(0, idx1 - 2)));
							capunitList.add(element.getText().substring(idx1 - 1, idx1+1));
						}
					}
					System.out.println("---6");
					Thread.sleep(500);
					
					//칼로리
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[3]/div/table[1]/tbody/tr/td[1]/div[2]"));
					kcalList.add(Double.parseDouble(df.format(Double.parseDouble(element.getText()))));
					Thread.sleep(500);
					
					//탄수화물
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[3]/div/table[1]/tbody/tr/td[5]/div[2]"));
					int idx = element.getText().indexOf("g");
					carbogList.add(Double.parseDouble(df.format(Double.parseDouble(element.getText().substring(0, idx)))));
					Thread.sleep(500);
					
					//단백질
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[3]/div/table[1]/tbody/tr/td[7]/div[2]"));
					idx = element.getText().indexOf("g");
					proteingList.add(Double.parseDouble(df.format(Double.parseDouble(element.getText().substring(0, idx)))));
					Thread.sleep(500);
					
					//지방
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[3]/div/table[1]/tbody/tr/td[3]/div[2]"));
					idx = element.getText().indexOf("g");
					fatgList.add(Double.parseDouble(df.format(Double.parseDouble(element.getText().substring(0, idx)))));
					Thread.sleep(500);
					driver.navigate().back();
					System.out.println("---7");
					Thread.sleep(3000);
				}
				System.out.println("---8");
				Thread.sleep(1000);
				elements = driver.findElements(By.cssSelector("span.next > a"));
				if(elements.size() < 1) {
					loop = false;
				} else {
					elements.get(0).sendKeys(Keys.ENTER);
				}
			}
			
			allParams.put("locbrand", locbrandList);
			allParams.put("product", productList);
			allParams.put("sersize", sersizeList);
			allParams.put("capunit", capunitList);
			allParams.put("kcal", kcalList);
			allParams.put("proteing", proteingList);
			allParams.put("fatg", fatgList);
			allParams.put("carbog", carbogList);
			
			List<Nutrition> nvoList = new ArrayList<Nutrition>(); 
			
			for(int j = 0; j<locbrandList.size(); j++) {
				System.out.println(allParams.get("locbrand").get(j));
				System.out.println(allParams.get("product").get(j));
				System.out.println(allParams.get("sersize").get(j));
				System.out.println(allParams.get("capunit").get(j));
				System.out.println(allParams.get("kcal").get(j));
				System.out.println(allParams.get("proteing").get(j));
				System.out.println(allParams.get("fatg").get(j));
				System.out.println(allParams.get("carbog").get(j));
				
				Nutrition nvo = new Nutrition();
				nvo.setLocbrand(locbrandList.get(j));
				nvo.setProduct(productList.get(j));
				nvo.setSersize(sersizeList.get(j));
				nvo.setCapunit(capunitList.get(j));
				nvo.setKcal(kcalList.get(j));
				nvo.setProteing(proteingList.get(j));
				nvo.setFatg(fatgList.get(j));
				nvo.setCarbog(carbogList.get(j));
				
				nvoList.add(nvo);
			}
			System.out.println(service.insertNutrition(nvoList));
			
		} catch (Throwable e) {
			e.printStackTrace();
		} finally {
			driver.close();
			driver.quit();
		}
	}
}
