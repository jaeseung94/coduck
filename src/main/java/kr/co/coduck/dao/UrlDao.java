package kr.co.coduck.dao;

import kr.co.coduck.vo.UrlInfo;

public interface UrlDao {
	
	UrlInfo getUrlInfo(String url);
}
