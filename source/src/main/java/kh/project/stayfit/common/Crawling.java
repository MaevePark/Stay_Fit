package kh.project.stayfit.common;

import java.time.Duration;
import java.util.Collections;
import java.util.List;
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
			options.setExperimentalOption("excludeSwitches", Collections.singletonList("enable-automation"));
			options.setExperimentalOption("useAutomationExtension", false);

			// Chrome 드라이버 인스턴스 설정
			driver = new ChromeDriver(options);
			wait = new WebDriverWait(driver, Duration.ofSeconds(10));

			// WebElement firstResult = new WebDriverWait(driver, Duration.ofSeconds(10)).until(ExpectedConditions.elementToBeClickable(By.xpath("//a/h3")));
			// 스크립트를 사용하기 위한 캐스팅
			JavascriptExecutor js = (JavascriptExecutor) driver;

			// URL로 접속
			driver.get("https://login.coupang.com/login/login.pang?rtnUrl=https%3A%2F%2Fwww.coupang.com%2Fnp%2Fpost%2Flogin%3Fr%3Dhttps%253A%252F%252Fwww.coupang.com%252Fnp%252Fcategories%252F432482%253FlistSize%253D60%2526brand%253D%2526offerCondition%253D%2526filterType%253D%2526isPriceRange%253Dfalse%2526minPrice%253D%2526maxPrice%253D%2526page%253D1%2526channel%253Duser%2526fromComponent%253DY%2526selectedPlpKeepFilter%253D%2526sorter%253DbestAsc%2526filter%253D%2526component%253D432382%2526rating%253D0");
			
			Thread.sleep(1000);
			WebElement element = driver.findElement(By.xpath("//*[@id=\'login-email-input\']"));
			element.sendKeys("qudwn980226@naver.com");
			Thread.sleep(1000);
			element = driver.findElement(By.xpath("//*[@id=\'login-password-input\']"));
			element.sendKeys("chzh10424!");
			Thread.sleep(1000);
			element = driver.findElement(By.cssSelector("body > div.member-wrapper.member-wrapper--flex > div > div > form > div.login__content.login__content--trigger > button"));
			element.sendKeys(Keys.ENTER);
			
			//WebElement element = driver.findElement(By.xpath("//*[@id='category432381']/li[1]/label"));
			// 클릭한다. 사실 element.click()로도 클릭이 가능한데 가끔 호환성 에러가 발생하는 경우가 있다.
			//js.executeScript("arguments[0].click();", element);
//			WebElement element = driver.findElement(By.xpath("//*[@id=\'login\']/a"));
//			element.sendKeys(Keys.ENTER);
			
			
			
			
			
			
			
			
			
			
			

//			while (true) {
//				try {
//					// css selector로 element를 찾는다.
//					element = driver.findElement(By.cssSelector("[href^='/626']"));
//					// 클릭
//					js.executeScript("arguments[0].click();", element);
//					// 루프 정지
//					break;
//				} catch (Throwable e) {
//					// 해당 element가 없으면 아래의 다음 페이지 element를 찾는다.
//					System.out.println(driver.findElement(By.cssSelector(".page-warpper a.selected+a")));
////					if() {
//						element = driver.findElement(By.cssSelector(".page-warpper a.selected+a"));
////					} else {
////						element = driver.findElement(By.cssSelector(".page-warpper a.selected+a"));
////					}
// 					
//					// 클릭
//					js.executeScript("arguments[0].click();", element);
//				}
//			}
//			// id가 promptEx인 데이터를 찾는다.
//			element = driver.findElement(By.xpath("//*[@id='promptEx']"));
//			// 버튼은 클릭이 되는데 link 계열은 script로 클릭해야 한다.
//			element.click();
//			// xpath로 팝업의 dom를 찾는다.
//			element = driver.findElement(By.xpath("/html/body/div[6]/div/div/div[2]/div/form/input"));
//			// input text에 test의 값을 넣는다.
//			element.sendKeys("test");
//			// 5초 기다린다.
//			Thread.sleep(5000);
//			// xpath로 팝업의 dom를 찾는다.
//			element = driver.findElement(By.xpath("/html/body/div[6]/div/div/div[2]/div/form/input"));
//			// 속성 value를 출력한다.
//			System.out.println(element.getAttribute("value"));
//			// .article의 글에 p 태그의 속성을 전부 가져온다.
//			List<WebElement> elements = driver.findElements(By.cssSelector(".article p"));
//			for (WebElement ele : elements) {
//				// 속성의 NodeText를 전부 출력한다.
//				System.out.println(ele.getText());
//			}
		} catch (Throwable e) {
			e.printStackTrace();
		} finally {
//			driver.close();
		}
	}
	
	
}
