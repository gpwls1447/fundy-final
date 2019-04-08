package com.kh.fundy.common;

public class PageBarTemplate {

	public static String getPageBar(int totalCount, int cPage, int numPerPage, String url)
	{
		String pageBar = "";
		int totalPage = (int)Math.ceil((double)totalCount / numPerPage);
		int pageBarSize = 5;
		int pageNo = ((cPage-1) / pageBarSize) * pageBarSize+1;
		int pageEnd = pageNo + pageBarSize - 1;
	
		pageBar = "<div class='pagebar'>";
		
		if(pageNo == 1)
		{
			pageBar += "<div class='pagebar-unit'>";
			pageBar += "<img class='pagebar-nav' src='/fundy/resources/images/sharp_navigate_prev_black.png'>";
			pageBar += "</div>";
		}
		else
		{
			pageBar += "<div class='pagebar-unit'>";
			pageBar += "<a href='javascript:fn_paging("+(pageNo-1)+")'><img class='pagebar-nav' src='/fundy/resources/images/sharp_navigate_prev_black.png'></a>";
			pageBar += "</div>";
		}
		
		
		while(!(pageNo > pageEnd || pageNo > totalPage))
		{
			if(cPage == pageNo)
			{
				pageBar += "<div class='pagebar-unit pagebar-unit-active'>"+pageNo+"</div>";
			}
			else
			{
				pageBar += "<div class='pagebar-unit'><a href='javascript:fn_paging("+pageNo+")'>"+pageNo+"</a></div>";
			}
			pageNo++;
		}
		
		if(pageNo > totalPage)
		{
			pageBar += "<div class='pagebar-unit'>";
			pageBar += "<img class='pagebar-nav' src='/fundy/resources/images/sharp_navigate_prev_black.png'>";
			pageBar += "</div>";
		}
		else
		{
			pageBar += "<div class='pagebar-unit'>";
			pageBar += "<a href='javascript:fn_paging("+pageNo+")'><img class='pagebar-nav' src='/fundy/resources/images/sharp_navigate_next_black.png'></a>";
			pageBar += "</div>";
		}
		return pageBar;
	}
}
