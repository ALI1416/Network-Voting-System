package com.ck.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ck.dao.OptionDao;
import com.ck.po.Option;
import com.ck.service.OptionService;

@Service
public class OptionServiceImpl implements OptionService {
	@Autowired
	private OptionDao optionDao;

	public Integer add(Option option) {
		option.setOptionState(0);
		try {
			return optionDao.insert(option);
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer delete(Integer id) {
		try {
			Option option = new Option();
			option.setOptionState(1);
			return optionDao.update(option);
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer change(Option option) {
		try {
			return optionDao.update(option);
		} catch (Exception e) {
			return 0;
		}
	}

	public List<Option> checkByPostId(Integer id) {
		try {
			return optionDao.selectByPostId(id);
		} catch (Exception e) {
			return null;
		}
	}

	public Option checkById(Integer id) {
		try {
			return optionDao.selectById(id);
		} catch (Exception e) {
			return null;
		}
	}

	public Integer addNum(Option option) {
		try {
			return optionDao.addNum(option);
		} catch (Exception e) {
			return null;
		}
	}

}
