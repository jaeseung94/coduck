package kr.co.coduck.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.CategoryDao;
import kr.co.coduck.vo.Category;

@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	private CategoryDao categoryDao;
	
	@Override
	public List<Category> getAllLectureCategories() {

		return categoryDao.getAllLectureCategories();
	}
	
	@Override
	public List<Category> getCatesByMainNo(int mainCateNo) {
		return categoryDao.getCatesByMainCateNo(mainCateNo);
	}
	
	@Override
	public Category getCategoryByCategoryNo(int cateNo) {

		return categoryDao.getCategoryByCategoryNo(cateNo);
	}

	@Override
	public List<Category> getLectureCategoryByAdmin() {
		return categoryDao.getLectureCategoryByAdmin();
	}

	@Override
	public List<Category> getTestCategoryByAdmin() {
		return categoryDao.getTestCategoryByAdmin();
	}
}
