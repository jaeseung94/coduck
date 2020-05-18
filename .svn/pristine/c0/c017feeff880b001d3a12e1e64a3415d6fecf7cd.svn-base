package kr.co.coduck.dao;

import java.util.List;

import kr.co.coduck.vo.Category;

public interface CategoryDao {
	
	//하위시험카테고리조회(시험명)
	List<Category> getCatesByMainCateNo(int parentCateNo);

	// 강의 카테고리 조회
	List<Category> getAllLectureCategories();
	Category getCategoryByCategoryNo(int cateNo);
	
	// 동영상 또는 시험 카테고리 조회하기
	List<Category> getLectureCategoryByAdmin();
	List<Category> getTestCategoryByAdmin();
}
