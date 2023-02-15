package utils;

public class BoardPage {
	public static String pagingStr(int totalCount, int pageSize, int blockPage, int pageNum, String reqURL) {
		String pagingStr = "";

		int totalPages = (int) (Math.ceil((double) totalCount / pageSize));

		int pageTemp = (((pageNum - 1) / blockPage) * blockPage) + 1;
		if (pageTemp != 1) {
			pagingStr += "<a href='" + reqURL + "?pageNum=" + (pageTemp - 1) + "'><img src=" + "'../img/leftEnd.png'" + "style="+"'width:20px; height:20px;'"+ "/></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqURL + "?pageNum=" + (pageTemp - 1) + "'><img src=" + "'../img/left.png'" + "style="+"'width:20px; height:20px;'"+ "/></a>";
		}

		int blockCount = 1;
		while (blockCount <= blockPage && pageTemp <= totalPages) {
			if (pageTemp == pageNum) {
				pagingStr += "&nbsp;" + pageTemp + "&nbsp;";
			} else {
				pagingStr += "&nbsp;<a href='" + reqURL + "?pageNum=" + pageTemp + "'>" + pageTemp + "</a>&nbsp;";
			}
			pageTemp++;
			blockCount++;
		}

		if (pageTemp <= totalPages) {
			pagingStr += "<a href='" + reqURL + "?pageNum=" + pageTemp + "'><img src=" + "'../img/right.png'" + "style="+"'width:20px; height:20px;'"+ "/></a>";
			pagingStr += "&nbsp;";
			pagingStr += "<a href='" + reqURL + "?pageNum=" + pageTemp + "'><img src=" + "'../img/rightEnd.png'" + "style="+"'width:20px; height:20px;'"+ "/></a>";
		}

		return pagingStr;
	}

}
