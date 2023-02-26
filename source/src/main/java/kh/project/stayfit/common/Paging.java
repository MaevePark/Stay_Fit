package kh.project.stayfit.common;

import java.util.HashMap;
import java.util.Map;

public class Paging {	
	
	//매개인자 정리
	// page : 현재 페이지  ( @RequestParam(name = "page", defaultValue = "1") int page )
	// totalCnt : 총 게시글 수
	// limits : 페이지당 표기할 개수
	// pageLimit : 페이징에 한번에 나타낼 개수 ( << < 3, 4, 5, 6, 7 > >> )
	
	// ModelAndView를 사용하고 있다면
	// mv.addObject("pagingMap", pagingMap);
	// 로 
	
	
	// 다음과 같이 HTML 요소 작성
//	<div class="product__pagination blog__pagination">
//		<c:if test="${pagingMap.start != 1}">
//			<a href="<%=request.getContextPath()%>/mypage/mywish?page=1"> << </a>
//		</c:if>
//		<c:if test="${pagingMap.currentPage != 1}">
//			<a href="<%=request.getContextPath()%>/mypage/mywish?page=${pagingMap.currentPage -1}"> < </a>
//		</c:if>
//		
//		
//		<c:forEach begin="${pagingMap.start }" end="${pagingMap.end }" var="num">                                
//			<a href="<%=request.getContextPath()%>/mypage/mywish?page=${num}">${num}</a>
//		</c:forEach>
//		
//		
//		<c:if test="${pagingMap.currentPage != pagingMap.totalPageCnt}">
//			<a href="<%=request.getContextPath()%>/mypage/mywish?page=${pagingMap.currentPage +1}"> > </a>
//		</c:if>
//		<c:if test="${pagingMap.end != pagingMap.totalPageCnt}">
//			<a href="<%=request.getContextPath()%>/mypage/mywish?page=${pagingMap.totalPageCnt }"> >> </a>
//		</c:if>
//	</div>
	
	// *** 만약 검색 조건이 포함되어 있는 경우 ***
	// 위 HTML 요소의 a태그 이동 경로에 파라미터 값으로 검색 조건과 내용을 포함시켜 컨트롤러로 넘겨주면 된다.
	
	
	public static Map<String, Object> paging(int page, int totalCnt, int limits, int pageLimit) {
		
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
		
		// 1. 현재 페이지 범위가 마지막 페이지에 도달했는가 체크
		// 2. 도달했다면 마지막 페이지 숫자를 end로 지정
		// 3. 아니라면 다른 조건 탐색
		// 4. 현재 페이지가 pageLimit 보다 작다면 (페이지가 극 초반, 즉 1, 2, 3페이지라면)
		// 5. end에 pageLimit을 대입
		// 6. 아니라면 현재 페이지에 2만큼 더한 값을 end에 대입
		System.out.println("마지막 리스트1 : "+end);
		end = (page+2 >= totalPageCnt)? totalPageCnt : ((page < (pageLimit/2)+1)? pageLimit :  page+2);
		
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
