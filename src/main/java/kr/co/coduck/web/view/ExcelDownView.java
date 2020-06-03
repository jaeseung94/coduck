package kr.co.coduck.web.view;

import java.net.URLEncoder;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.CreationHelper;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kr.co.coduck.dto.TestQtDto;
import kr.co.coduck.vo.Test;
import kr.co.coduck.vo.TestQt;

public class ExcelDownView extends AbstractXlsView{

	@SuppressWarnings("unchecked")
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		
		//컨트롤러가 전달한 데이터를 모델에서 획득하기
		Test test = (Test) model.get("test");
		List<TestQtDto> qts = (List<TestQtDto>)model.get("qts");
		
		//엑셀시트 생성하기
		Sheet sheet = workbook.createSheet(test.getName() + " " + test.getEp());
		
		//제목행 생성하기
		Row titleRow = sheet.createRow(0);
		titleRow.createCell(0).setCellValue(test.getName() + " > " + test.getEp());
		
		//제목행 셀 병합하기
		sheet.addMergedRegion(new CellRangeAddress(
				//0행부터 1행까지 병합, 0열부터 7열까지 병합
				0,	//first-row
				1,	//last-row
				0,	//first-column
				7	//last-column
		));
		
		Row headerRow = sheet.createRow(2);
		headerRow.createCell(0).setCellValue("문제번호");
		headerRow.createCell(1).setCellValue("문제명");
		headerRow.createCell(2).setCellValue("배점");
		headerRow.createCell(3).setCellValue("보기1");
		headerRow.createCell(4).setCellValue("보기2");
		headerRow.createCell(5).setCellValue("보기3");
		headerRow.createCell(6).setCellValue("보기4");
		headerRow.createCell(7).setCellValue("정답");
		headerRow.createCell(8).setCellValue("정답률");
		headerRow.createCell(9).setCellValue("이미지명");
		headerRow.createCell(10).setCellValue("과목번호");
		
		int dataRowIndex = 3;
		for(TestQtDto e : qts) {
			Row dataRow = sheet.createRow(dataRowIndex++);
			
			dataRow.createCell(0).setCellValue(e.getQtNum());
			dataRow.createCell(1).setCellValue(e.getContents());
			dataRow.createCell(2).setCellValue(e.getScore());
			dataRow.createCell(3).setCellValue(e.getV1());
			dataRow.createCell(4).setCellValue(e.getV2());
			dataRow.createCell(5).setCellValue(e.getV3());
			dataRow.createCell(6).setCellValue(e.getV4());
			dataRow.createCell(7).setCellValue(e.getAns());
			dataRow.createCell(8).setCellValue(e.getTrueRate());
			dataRow.createCell(9).setCellValue(e.getImg());
			dataRow.createCell(10).setCellValue(e.getSubjNo());
			
		}
		
		sheet.setColumnWidth(1, 256*50);
		sheet.setColumnWidth(7, 256*12);
		
		//바이너리 데이터(사진, 영상, 압축파일, 각종 문서들)를 응답컨텐츠로 제공할 때 
		//설정하는 응답컨텐츠 타입
		String title = 	test.getName() + " " + test.getEp();
		title = URLEncoder.encode(title, "UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/octet-stream");
		//attachment를 설정하면 무조건 다운로드됨.(새창이 뜨는게 아니라)
		response.setHeader("Content-Disposition", "attachment; filename="+title + ".xls");
	}
	
	//날짜를 표현하는 셀 스타일을 반환하는 메소드
	private CellStyle getDateCellStyle(Workbook workbook) {
		CreationHelper createheHelper = workbook.getCreationHelper();
		CellStyle cellStyle = workbook.createCellStyle();
		cellStyle.setDataFormat(createheHelper.createDataFormat().getFormat("yyyy-mm-dd"));
		
		return cellStyle;
	}

}
