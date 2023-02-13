package kh.project.stayfit.common;

import java.util.List;
import java.util.concurrent.TimeUnit;

import org.openqa.selenium.*;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;

public class Crawling {
	public static void crawl() {
		WebDriver driver = null;
		try {
			// drvier 설정 - 저는 d드라이브 work 폴더에 있습니다.
			System.setProperty("webdriver.chrome.driver", "D:\\chrome_driver\\chromedriver.exe");
			ChromeOptions options = new ChromeOptions();
			options.addArguments("--headless", "--disable-gpu","-no-sandbox");
			options.addArguments("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36");
			options.addArguments("lang=ko_KR");
			
			
			// Chrome 드라이버 인스턴스 설정
			driver = new ChromeDriver();
			
//			driver.execute_cdp_cmd
//			("Page.addScriptToEvaluateOnNewDocument"
//					, {"source": """ Object.defineProperty(navigator, 'webdriver', { get: () => undefined }) """});
			
			// 스크립트를 사용하기 위한 캐스팅
			JavascriptExecutor js = (JavascriptExecutor) driver;
			
			js.executeScript("", "");
			
			
			// 블로그 URL로 접속
			//driver.get("https://www.coupang.com/np/categories/194276");
			driver.get("https://www.coupang.com/np/categories/432482?listSize=60&brand=&offerCondition=&filterType=&isPriceRange=false&minPrice=&maxPrice=&page=1&channel=user&fromComponent=Y&selectedPlpKeepFilter=&sorter=bestAsc&filter=&component=432382&rating=0");
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			
			// 대기 설정
			//driver.manage().timeouts().implicitlyWait(2, TimeUnit.SECONDS);
			// xpath로 element를 찾는다. 이 xpath는 명월 일지 블로그의 왼쪽 메뉴의 Dev note의 Javascript, Jquery,
			// Css 카테고리다.
			
			//WebElement element = driver.findElement(By.xpath("//*[@id='category432381']/li[1]/label"));
			// 클릭한다. 사실 element.click()로도 클릭이 가능한데 가끔 호환성 에러가 발생하는 경우가 있다.
			//js.executeScript("arguments[0].click();", element);
			
			
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
