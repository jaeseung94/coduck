package kr.co.coduck.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coduck.dao.AdminLectIncomeDao;
import kr.co.coduck.dao.AdminTestIncomeDao;

@Service
public class AdminIncomeServiceImpl implements AdminIncomeService {
	
	@Autowired
	private AdminLectIncomeDao adminLectIncomeDao;
	@Autowired
	private AdminTestIncomeDao adminTestIncomeDao;
	
	@Override
	public int getLectIncomeByDay() {
		return adminLectIncomeDao.getLectIncomeByDay();
	}
	@Override
	public int getLectIncomeByThree() {
		return adminLectIncomeDao.getLectIncomeByThree();
	}
	@Override
	public int getLectIncomeByWeek() {
		return adminLectIncomeDao.getLectIncomeByWeek();
	}
	
	@Override
	public int getTestIncomeByDay() {
		return adminTestIncomeDao.getTestIncomeByDay();
	}
	@Override
	public int getTestIncomeByThree() {
		return adminTestIncomeDao.getTestIncomeByThree();
	}
	@Override
	public int getTestIncomeByWeek() {
		return adminTestIncomeDao.getTestIncomeByWeek();
	}
	@Override
	public Map<String, Object> getIncomeRate() {
		return adminLectIncomeDao.getIncomeRate();
	}
}
