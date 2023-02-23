package kh.project.stayfit.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;

import kh.project.stayfit.mypage.model.service.MyProductService;
import kh.project.stayfit.mypage.model.vo.MypageOrder;
import kh.project.stayfit.shop.model.vo.ShopProduct;

public class Paging {	
	
	//매개인자 정리
	// page : 현재 페이지  ( @RequestParam(name = "page", defaultValue = "1") int page )
	// totalCnt : 총 게시글 수
	// limits : 페이지당 표기할 개수
	// pageLimit : 페이징에 한번에 나타낼 개수 ( << < 3, 4, 5, 6, 7 > >> )
	public static Map<String, Object> paging(int page, int totalCnt, int limits, int pageLimit) {
		//int currentPageNum = Integer.parseInt(currentPageNumStr);
		
		
		
		//int page = Integer.parseInt(currentPageNumStr);
		
		int end = 0;
		int start = 0;
		
		// 1. 데이터 개수를 페이지당 표기 개수로 나누었을 때
		// 2. 나머지 유무를 통해 페이지를 하나 덜 표기할것인지 말것인지
		// 3. 이 경우 다른 방법으로 1의 경우에서 0.9를 더해 판별하는 방법도 있다. 
		int totalPageCnt = (totalCnt % limits == 0)? (totalCnt / limits) : (totalCnt / limits)+1;
		
		// 1. 한번에 표기할 페이지 수를 반으로 나누어 그보다 작을 경우
		// 2. 시작 페이지는 1이고,
		// 3. 그보다 클 경우
		// 4. 현재 페이지에서 반을 뺀 페이지를 시작 페이지로 한다.
		start = (page <= (pageLimit/2)+1) ? 1 :  page-2;
		
		// 1. 첫 접근으로 첫 end페이지는 반드시 현재 페이지의 +2로
		// 2. 이후 페이지 이동시 end페이지가 총 페이지에 도달했는지 여부를 체크
		// 4. 아니라면 현재 페이지+2 가 최대 페이지로 나오는지 체크
		// 5. 맞다면 최대 페이지로 표기
		// 6. 아니라면 현 페이지+2
		System.out.println("마지막 리스트1 : "+end);
		end = (end >= totalPageCnt)? totalPageCnt : ((page < (pageLimit/2)+1)? pageLimit :  page+2);
		
		System.out.println("-----------------------------------------------------");
		System.out.println("현재 페이지 : "+page);
		System.out.println("마지막 페이지 : "+totalPageCnt);
		System.out.println("마지막 리스트2 : "+end);
		
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("currentPage", page);
		pagingMap.put("totalPageCnt", totalPageCnt);
		pagingMap.put("end", end);
		pagingMap.put("start", start);
		
		return pagingMap;
	}
}
