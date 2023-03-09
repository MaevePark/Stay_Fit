package kh.project.stayfit.shop.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.time.Duration;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.By;
import org.openqa.selenium.JavascriptExecutor;
import org.openqa.selenium.Keys;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.openqa.selenium.support.ui.WebDriverWait;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;

import kh.project.stayfit.common.Crawling;
import kh.project.stayfit.common.Paging;
import kh.project.stayfit.mypage.model.service.MyProductService;
import kh.project.stayfit.mypage.model.vo.MypageCart;
import kh.project.stayfit.mypage.model.vo.MypageWish;
import kh.project.stayfit.seller.model.service.ProductService;
import kh.project.stayfit.shop.model.service.ShopService;
import kh.project.stayfit.shop.model.service.ShopServiceImpl;
import kh.project.stayfit.shop.model.vo.Nutrition;
import kh.project.stayfit.shop.model.vo.ShopCart;
import kh.project.stayfit.shop.model.vo.ShopProduct;


@Controller
@RequestMapping("/shop")
public class ShopController {
	@Autowired
	private ShopService shopService;
	
	@GetMapping({"", "/"})
	public ModelAndView shopMainPage(
			ModelAndView mv
			, @RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name="productCategory", defaultValue = "0") int productCategory
			, @RequestParam(name="searchProduct", defaultValue = "") String searchProduct
			) {
		int limits = 12;
		int pageLimit = 5;
		
		Map<String, Object> searchMap = new HashMap<String, Object>();
		searchMap.put("productCategory", productCategory);
		searchMap.put("searchProduct", searchProduct);
		
		try {
			int totalCnt = shopService.selectProductTotalCnt(searchMap);
			Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
			
			
			mv.addObject("categoryList", shopService.selectCategory());
			mv.addObject("productList", shopService.selectProductList(searchMap, page, limits));
			mv.addObject("pagingMap", pagingMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("urlpattern", "shop");
		mv.addObject("sectionName", "shop/main.jsp");
		//페이징
		//인기상품
		//일반상품
		//추천상품
		mv.setViewName("index");
		return mv;
	}
	
	//찜목록 추가
	@GetMapping("/insertwish")
	public void insertWish(
			HttpServletResponse response
			, @RequestParam("mid") int mid
			, @RequestParam("pid") int pid
			) {
		int result = 0;
		ShopCart vo = new ShopCart();
		vo.setMid(mid);
		vo.setPid(pid);
		try {
			result = shopService.insertWish(vo);

			PrintWriter out = response.getWriter();
			out.append(new GsonBuilder().create().toJson(result));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	//장바구니 추가
	@GetMapping("/insertcart")
	public void insertCart(
			HttpServletResponse response
			, @RequestParam("mid") int mid
			, @RequestParam("pid") int pid
			) {
		int result = 0;
		ShopCart vo = new ShopCart();
		vo.setMid(mid);
		vo.setPid(pid);
		try {
			result = shopService.insertCart(vo);

			PrintWriter out = response.getWriter();
			out.append(new GsonBuilder().create().toJson(result));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
//	@GetMapping("/go")
//	public ModelAndView crawl(ModelAndView mv) {
//		List<String> urlList = new ArrayList<String>();
//		urlList.add("https://dshop.dietshin.com/goods/goods_list.asp?pc_idx=52"); // ok
//		urlList.add("https://dshop.dietshin.com/goods/goods_list.asp?pc_idx=117"); // ok
//		urlList.add("https://dshop.dietshin.com/goods/goods_list.asp?pc_idx=129"); // ok
//		urlList.add("https://dshop.dietshin.com/goods/goods_list.asp?pc_idx=101"); // ok
//		urlList.add("https://dshop.dietshin.com/goods/goods_list.asp?pc_idx=130");
//		urlList.add("https://dshop.dietshin.com/goods/goods_list.asp?pc_idx=131");
//		urlList.add("https://dshop.dietshin.com/goods/goods_list.asp?pc_idx=51");
//		urlList.add("https://dshop.dietshin.com/goods/goods_list.asp?pc_idx=53");
//		for(int i=0; i<urlList.size(); i++) {
//			//crawl2(urlList.get(i), i+1);
//		}
//		
//		
//		return mv;
//	}
	
//	private void crawl() {
//		WebDriver driver = null;
//		WebDriverWait wait = null;
//		try {
//			DecimalFormat df = new DecimalFormat("#.##"); 
//			// drvier 설정 - 저는 d드라이브 work 폴더에 있습니다.
//			System.setProperty("webdriver.chrome.driver", "D:\\chrome_driver\\chromedriver.exe");
//			ChromeOptions options = new ChromeOptions();
////			options.addArguments("user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/110.0.0.0 Safari/537.36");
////			options.addArguments("lang=ko_KR");
//			options.addArguments("headless");
////			options.setExperimentalOption("excludeSwitches", Collections.singletonList("enable-automation"));
////			options.setExperimentalOption("useAutomationExtension", false);
//
//			// Chrome 드라이버 인스턴스 설정
//			driver = new ChromeDriver(options);
//			//driver = new ChromeDriver();
//			wait = new WebDriverWait(driver, Duration.ofSeconds(10));
//
//			// WebElement firstResult = new WebDriverWait(driver, Duration.ofSeconds(10)).until(ExpectedConditions.elementToBeClickable(By.xpath("//a/h3")));
//			// 스크립트를 사용하기 위한 캐스팅
//			JavascriptExecutor js = (JavascriptExecutor) driver;
//
//			// URL 접속
//			driver.get("https://www.fatsecret.kr/%EC%B9%BC%EB%A1%9C%EB%A6%AC-%EC%98%81%EC%96%91%EC%86%8C/");
//			
//			WebElement element = null;
//			Thread.sleep(1000);
//			element = driver.findElement(By.xpath("//*[@id=\"ctl12_ctl04_ByFood\"]"));
//			element.click();
//			element.sendKeys("다신샵");
//			Thread.sleep(1000);
//			element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[2]/div/div[1]/table/tbody/tr[2]/td/div/img"));
//			element.click();
//			Thread.sleep(1000);
//			
//			Map<String, ArrayList> allParams = new HashMap<String, ArrayList>();
//			
//			ArrayList<String> locbrandList = new ArrayList<String>();
//			ArrayList<String> productList = new ArrayList<String>();
//			ArrayList<Double> sersizeList = new ArrayList<Double>();
//			ArrayList<String> capunitList = new ArrayList<String>();
//			ArrayList<Double> kcalList = new ArrayList<Double>();
//			ArrayList<Double> proteingList = new ArrayList<Double>();
//			ArrayList<Double> fatgList = new ArrayList<Double>();
//			ArrayList<Double> carbogList = new ArrayList<Double>();
//			
//			Boolean loop = true;
//			int z = 0;
//			while(loop) {
//				Thread.sleep(3000);
//				element = driver.findElement(By.cssSelector("#content > table > tbody > tr > td.leftCell > div > div.searchResultsPaging > a.strong"));
//				System.out.println("페이지 : "+element.getText());
//				List<WebElement> elements = driver.findElements(By.cssSelector("a.prominent"));
//				// 마지막 페이지를 제외한 나머지 페이지는 10개
//				int n = elements.size();
//				System.out.println("------------------------------------------------------------------------");
//				System.out.println("이 페이지에서 추출할 상품 개수 : "+n+"개");
//				for (int i=0; i<n; i++) {
//					z = i;
//					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr[" + (z + 1) + "]/td/a[1]"));
//					element.sendKeys(Keys.ENTER);
//					Thread.sleep(3000);
//					
//					System.out.println("******************************************************************");
//					System.out.println(i);
//					//브랜드
//					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/div/div/table/tbody/tr/td/div[2]/h2/a"));
//					Thread.sleep(500);
//					System.out.println("상품 브랜드 : "+element.getText());
//					locbrandList.add(element.getText());
//					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/div/div/table/tbody/tr/td/div[2]/h1"));
//					System.out.println("상품 명 : "+element.getText());
//					productList.add(element.getText());
//					Thread.sleep(500);
//					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[1]/div[1]/div[4]"));
//					Thread.sleep(500);
//					
//					if(element.getText().contains("(") && element.getText().contains(")")) { //1인분 (140 g) 형식으로 제공되는 경우
//						System.out.println("---4");
//						int idx1 = element.getText().indexOf("(");
//						int idx2 = element.getText().indexOf(")");
//						if(element.getText().substring(idx2-1, idx2).equals("g")) {
//							sersizeList.add(Double.parseDouble(element.getText().substring(idx1 + 1, idx2 - 2)));
//							capunitList.add(element.getText().substring(idx2-1, idx2));
//						} else { 
//							sersizeList.add(Double.parseDouble(element.getText().substring(idx1 + 1, idx2 - 3)));
//							capunitList.add(element.getText().substring(idx2-2, idx2));
//						}
//					} else { //단품 상품으로, 1회 제공량이 따로 명시되지 않은 경우
//						System.out.println("---5");
//						if(element.getText().contains("g")) {
//							int idx1 = element.getText().indexOf("g");
//							sersizeList.add(Double.parseDouble(element.getText().substring(0, idx1 - 1)));
//							capunitList.add(element.getText().substring(idx1, idx1+1));
//						} else if(element.getText().contains("ml")) {
//							int idx1 = element.getText().indexOf("ml");
//							sersizeList.add(Double.parseDouble(element.getText().substring(0, idx1 - 2)));
//							capunitList.add(element.getText().substring(idx1 - 1, idx1+1));
//						}
//					}
//					System.out.println("---6");
//					Thread.sleep(500);
//					
//					//칼로리
//					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[3]/div/table[1]/tbody/tr/td[1]/div[2]"));
//					kcalList.add(Double.parseDouble(df.format(Double.parseDouble(element.getText()))));
//					Thread.sleep(500);
//					
//					//탄수화물
//					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[3]/div/table[1]/tbody/tr/td[5]/div[2]"));
//					int idx = element.getText().indexOf("g");
//					carbogList.add(Double.parseDouble(df.format(Double.parseDouble(element.getText().substring(0, idx)))));
//					Thread.sleep(500);
//					
//					//단백질
//					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[3]/div/table[1]/tbody/tr/td[7]/div[2]"));
//					idx = element.getText().indexOf("g");
//					proteingList.add(Double.parseDouble(df.format(Double.parseDouble(element.getText().substring(0, idx)))));
//					Thread.sleep(500);
//					
//					//지방
//					element = driver.findElement(By.xpath("//*[@id=\"content\"]/table/tbody/tr/td[1]/div/table/tbody/tr/td[3]/div/table[1]/tbody/tr/td[3]/div[2]"));
//					idx = element.getText().indexOf("g");
//					fatgList.add(Double.parseDouble(df.format(Double.parseDouble(element.getText().substring(0, idx)))));
//					Thread.sleep(500);
//					driver.navigate().back();
//					System.out.println("---7");
//					Thread.sleep(3000);
//				}
//				System.out.println("---8");
//				Thread.sleep(1000);
//				elements = driver.findElements(By.cssSelector("span.next > a"));
//				if(elements.size() < 1) {
//					loop = false;
//				} else {
//					elements.get(0).sendKeys(Keys.ENTER);
//				}
//			}
//			
//			allParams.put("locbrand", locbrandList);
//			allParams.put("product", productList);
//			allParams.put("sersize", sersizeList);
//			allParams.put("capunit", capunitList);
//			allParams.put("kcal", kcalList);
//			allParams.put("proteing", proteingList);
//			allParams.put("fatg", fatgList);
//			allParams.put("carbog", carbogList);
//			
//			List<Nutrition> nvoList = new ArrayList<Nutrition>(); 
//			
//			for(int j = 0; j<locbrandList.size(); j++) {
//				System.out.println(allParams.get("locbrand").get(j));
//				System.out.println(allParams.get("product").get(j));
//				System.out.println(allParams.get("sersize").get(j));
//				System.out.println(allParams.get("capunit").get(j));
//				System.out.println(allParams.get("kcal").get(j));
//				System.out.println(allParams.get("proteing").get(j));
//				System.out.println(allParams.get("fatg").get(j));
//				System.out.println(allParams.get("carbog").get(j));
//				
//				Nutrition nvo = new Nutrition();
//				nvo.setLocbrand(locbrandList.get(j));
//				nvo.setProduct(productList.get(j));
//				nvo.setSersize(sersizeList.get(j));
//				nvo.setCapunit(capunitList.get(j));
//				nvo.setKcal(kcalList.get(j));
//				nvo.setProteing(proteingList.get(j));
//				nvo.setFatg(fatgList.get(j));
//				nvo.setCarbog(carbogList.get(j));
//				
//				nvoList.add(nvo);
//			}
//			System.out.println(service.insertNutrition(nvoList));
//			
//		} catch (Throwable e) {
//			e.printStackTrace();
//		} finally {
//			driver.close();
//			driver.quit();
//		}
//	}
//	
//	private void crawl2(String url, int pcid) {
//		WebDriver driver = null;
//		WebDriverWait wait = null;
//		try {
//			DecimalFormat df = new DecimalFormat("#.##"); 
//			// drvier 설정 - 저는 d드라이브 work 폴더에 있습니다.
//			System.setProperty("webdriver.chrome.driver", "D:\\chrome_driver\\chromedriver.exe");
//			ChromeOptions options = new ChromeOptions();
//			options.addArguments("headless");
//
//			driver = new ChromeDriver(options);
//			wait = new WebDriverWait(driver, Duration.ofSeconds(10));
//
//			// WebElement firstResult = new WebDriverWait(driver, Duration.ofSeconds(10)).until(ExpectedConditions.elementToBeClickable(By.xpath("//a/h3")));
//			// 스크립트를 사용하기 위한 캐스팅
//			JavascriptExecutor js = (JavascriptExecutor) driver;
//
//			// URL 접속
//			driver.get(url);
//			WebElement element = null;
//			
//			Map<String, List> allParams = new HashMap<String, List>();
//			List<Integer> cidList = new ArrayList<Integer>();
//			List<String> pnameList = new ArrayList<String>();
//			List<String> pimageList = new ArrayList<String>();
//			List<Integer> ppriceList = new ArrayList<Integer>();
//			List<Integer> pstockList = new ArrayList<Integer>(); Random random = new Random();
//			List<Integer> psaleList = new ArrayList<Integer>();
//			List<String> plinkList = new ArrayList<String>();
//			
//			Boolean loop = true;
//			while(loop) {
//				Thread.sleep(3000);
//				List<WebElement> elements = driver.findElements(By.cssSelector(".tb_mw_wrap"));
//				// 마지막 페이지를 제외한 나머지 페이지는 10개
//				int n = elements.size();
//				System.out.println("------------------------------------------------------------------------");
//				System.out.println("이 페이지에서 추출할 상품 개수 : "+n+"개");
//				for (int i=1; i<n+1; i++) {
//					System.out.println("******************************************************************");
//					System.out.println("i번째 : " +i);
//					Thread.sleep(2000);
//					//카테고리명
//					cidList.add(pcid);   
//					//상품명
//					element = driver.findElement(By.cssSelector("#container > div > div.main_tit_wrap > div.newp_list_wrap > ul > li:nth-child("+i+") > a > div > div > span"));
//					pnameList.add(element.getText());
//					Thread.sleep(1000);
//					//상품 이미지
//					String src = "";
//					elements = driver.findElements(By.cssSelector("#container > div > div.main_tit_wrap > div.newp_list_wrap > ul > li:nth-child("+i+") > a > div > p > img"));
//					if(elements.size() > 0) {
//						element = driver.findElement(By.cssSelector("#container > div > div.main_tit_wrap > div.newp_list_wrap > ul > li:nth-child("+i+") > a > div > p > img"));
//						src = element.getAttribute("src");
//					} else {
//						element = driver.findElement(By.cssSelector("#container > div > div.main_tit_wrap > div.newp_list_wrap > ul > li:nth-child("+i+") > a > div > div.c_thum_soldoutimg_w > p > img"));
//						src = element.getAttribute("src");
//					}
//					pimageList.add(src);
//					Thread.sleep(1000);
//					
//					elements = driver.findElements(By.cssSelector("#container > div > div.main_tit_wrap > div.newp_list_wrap > ul > li:nth-child("+i+") > a > div > div > p.best_n_price_w > span"));
//					System.out.println("------------------------------------------------------------------------");
//					System.out.println(elements.size());
//					//*[@id="container"]/div/div[1]/div[2]/ul/li[1]/a/div/div[2]/p[1]/span[2]
//					//*[@id="container"]/div/div[1]/div[2]/ul/li[2]/a/div/div[2]/p[1]/span[2]
//					if(elements.size() < 3) {
//						//원가
//						element = elements.get(0);
//						String price = element.getText();
//						price = price.replace("원", "");
//						price = price.replace(",", "");
//						ppriceList.add(Integer.parseInt(price));
//						Thread.sleep(1000);
//						//할인율
//						psaleList.add(0);
//						Thread.sleep(1000);
//					} else {
//						//원가
//						element = elements.get(1);
//						String price = element.getText();
//						price = price.replace("원", "");
//						price = price.replace(",", "");
//						ppriceList.add(Integer.parseInt(price));
//						Thread.sleep(1000);
//						//할인율
//						element = elements.get(2);
//						String sale = element.getText();
//						sale = sale.replace("%", "");
//						psaleList.add(Integer.parseInt(sale));
//						Thread.sleep(1000);
//					}
//					
//					//링크
//					element = driver.findElement(By.cssSelector("#container > div > div.main_tit_wrap > div.newp_list_wrap > ul > li:nth-child("+i+") > a"));
//					plinkList.add(element.getAttribute("href"));
//					//재고량
//					int randomStock = random.nextInt(45) + 5;
//					pstockList.add(randomStock);
//				}
//				
//				System.out.println("---8");
//				Thread.sleep(1000);
//				elements = driver.findElements(By.cssSelector("#container > div > div.module_n_page > ul > li.btn_n_next > a"));
//				if(elements.size() < 1) {
//					loop = false;
//				} else {
//					elements.get(0).sendKeys(Keys.ENTER);
//				}
//			}
//			System.out.println("---9");
//			allParams.put("cid", cidList);
//			allParams.put("pname", pnameList);
//			allParams.put("pimage", pimageList);
//			allParams.put("pprice", ppriceList);
//			allParams.put("pstock", pstockList);
//			allParams.put("psale", psaleList);
//			allParams.put("plink", plinkList);
//			
//			System.out.println("---10");
//			List<ShopProduct> spvoList = new ArrayList<ShopProduct>();
//			for(int j = 0; j<pnameList.size(); j++) {
//				System.out.println("---10_"+j);
//				System.out.println(allParams.get("cid").get(j));
//				System.out.println(allParams.get("pname").get(j));
//				System.out.println(allParams.get("pimage").get(j));
//				System.out.println(allParams.get("pprice").get(j));
//				System.out.println(allParams.get("pstock").get(j));
//				System.out.println(allParams.get("psale").get(j));
//				System.out.println(allParams.get("plink").get(j));
//				
//				ShopProduct spvo = new ShopProduct();
//				spvo.setCid(cidList.get(j));
//				spvo.setPname(pnameList.get(j));
//				spvo.setPimage(pimageList.get(j));
//				spvo.setPprice(ppriceList.get(j));
//				spvo.setPstock(pstockList.get(j));
//				spvo.setPsale(psaleList.get(j));
//				spvo.setPlink(plinkList.get(j));
//				
//				spvoList.add(spvo);
//			}
//			System.out.println("---11");
//			System.out.println(service.insertProduct(spvoList));
//			
//		} catch (Throwable e) {
//			e.printStackTrace();
//		} finally {
//			driver.close();
//			driver.quit();
//		}
//	}
	
}
