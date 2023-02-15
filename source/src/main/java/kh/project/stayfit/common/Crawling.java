package kh.project.stayfit.common;

import java.time.Duration;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.ExpectedConditions;
import org.openqa.selenium.support.ui.WebDriverWait;

public class Crawling {
	public static void crawl() {
		WebDriver driver = null;
		WebDriverWait wait = null;
		try {
			// drvier 설정 - 저는 d드라이브 work 폴더에 있습니다.
			System.setProperty("webdriver.chrome.driver", "D:\\chrome_driver\\chromedriver.exe");
			ChromeOptions options = new ChromeOptions();
			options.addArguments("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36");
			options.addArguments("lang=ko_KR");
//			options.setExperimentalOption("excludeSwitches", Collections.singletonList("enable-automation"));
//			options.setExperimentalOption("useAutomationExtension", false);

			// Chrome 드라이버 인스턴스 설정
			driver = new ChromeDriver(options);
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
			
			Map<String, Object> allParams = new HashMap<>();
			
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
				List<WebElement> elements = driver.findElements(By.cssSelector("a.prominent"));
				int n = elements.size();
				
				for (int i = 0; i < n; i++) {
					Thread.sleep(1000);
					z = i;
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr[" + (z + 1) + "]/td/a[1]"));
					element.click();
					Thread.sleep(1000);
					
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/div/div/table/tbody/tr/td/div[2]/h2/a"));
					locbrandList.add(element.getText());
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/div/div/table/tbody/tr/td/div[2]/h1"));
					productList.add(element.getText());
					
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[1]/div[1]/div[4]"));
					if(element.getText().contains("(") && element.getText().contains(")")) { //1인분 (140 g) 형식으로 제공되는 경우
						int idx1 = element.getText().indexOf("(");
						int idx2 = element.getText().indexOf(")");
						if(element.getText().substring(idx2-1, idx2).equals("g")) {
							sersizeList.add(Double.parseDouble(element.getText().substring(idx1 + 1, idx2 - 2)));
							capunitList.add(element.getText().substring(idx2-1, idx2));
						} else {
							sersizeList.add(Double.parseDouble(element.getText().substring(idx1 + 1, idx2 - 3)));
							capunitList.add(element.getText().substring(idx2-2, idx2));
						}
					} else {
						
						
						
						if(element.getText().contains("g")) {
							int idx1 = element.getText().indexOf("g");
							sersizeList.add(Double.parseDouble(element.getText().substring(0, idx1 - 1)));
							capunitList.add(element.getText().substring(idx1 - 1, idx1));
						} else if(element.getText().contains("ml")) {
							int idx1 = element.getText().indexOf("ml");
							sersizeList.add(Double.parseDouble(element.getText().substring(0, idx1 - 2)));
							capunitList.add(element.getText().substring(idx1 - 2, idx1));
						}
						
						
					}
					
					
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[1]/div[1]/div[12]"));
					int idx = element.getText().indexOf(" kcal");
					kcalList.add(Double.parseDouble(element.getText().substring(0, idx)));
					
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[1]/div[1]/div[15]"));
					idx = element.getText().indexOf("g");
					proteingList.add(Double.parseDouble(element.getText().substring(0, idx)));
					
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[1]/div[1]/div[21]"));
					idx = element.getText().indexOf("g");
					fatgList.add(Double.parseDouble(element.getText().substring(0, idx)));
					
					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[1]/div[1]/div[24]"));
					idx = element.getText().indexOf("g");
					carbogList.add(Double.parseDouble(element.getText().substring(0, idx)));
					Thread.sleep(1000);
					driver.navigate().back();
				}
				
				element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/div[3]/span[2]/a"));
				
				if(driver.findElements(By.cssSelector("#content > table > tbody > tr > td.leftCell > div > div.searchResultsPaging > span.next")).size() < 1) {
					loop = false;
				} else {
					element.click();
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
			
			for(int j = 0; j<locbrandList.size(); j++) {
				System.out.println(locbrandList.get(j));
				System.out.println(productList.get(j));
				System.out.println(sersizeList.get(j));
				System.out.println(capunitList.get(j));
				System.out.println(kcalList.get(j));
				System.out.println(proteingList.get(j));
				System.out.println(fatgList.get(j));
				System.out.println(carbogList.get(j));
			}
			
			
		} catch (Throwable e) {
			e.printStackTrace();
		} finally {
			//driver.close();
			//driver.quit();
		}
	}
	
	
}
