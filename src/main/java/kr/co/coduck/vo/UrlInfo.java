package kr.co.coduck.vo;

import org.apache.ibatis.type.Alias;

@Alias("UrlInfo")
public class UrlInfo {
	
	private String url;
	private String requiredLogin;
	private String requiredGrade;
	
	public UrlInfo() {}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getRequiredLogin() {
		return requiredLogin;
	}

	public void setRequiredLogin(String requiredLogin) {
		this.requiredLogin = requiredLogin;
	}

	public String getRequiredGrade() {
		return requiredGrade;
	}

	public void setRequiredGrade(String requiredGrade) {
		this.requiredGrade = requiredGrade;
	}

	@Override
	public String toString() {
		return "UrlInfo [url=" + url + ", requiredLogin=" + requiredLogin + ", requiredGrade=" + requiredGrade + "]";
	}
}
