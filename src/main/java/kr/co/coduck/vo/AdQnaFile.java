package kr.co.coduck.vo;

import org.apache.ibatis.type.Alias;

@Alias("AdQnaFile")
public class AdQnaFile {

	private String fileName;
	private int AdQnaNo;
	
	public AdQnaFile() {}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public int getAdQnaNo() {
		return AdQnaNo;
	}

	public void setAdQnaNo(int adQnaNo) {
		AdQnaNo = adQnaNo;
	}

	@Override
	public String toString() {
		return "AdQndImage [fileName=" + fileName + ", AdQnaNo=" + AdQnaNo + "]";
	}
	
}
