package com.ck.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ck.dao.RecordDao;
import com.ck.po.Record;
import com.ck.service.RecordService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class RecordServiceImpl implements RecordService {
	@Autowired
	private RecordDao recordDao;

	public Integer add(Record record) {
		try {
			record.setPollNum(1);
			record.setPollIp(111222333);
			record.setPollMac("mac");
			return recordDao.insert(record);
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer delete(Integer id) {
		try {
			Record record = new Record();
			record.setPollState(1);
			return recordDao.update(record);
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer change(Record record) {
		try {
			return recordDao.update(record);
		} catch (Exception e) {
			return 0;
		}
	}

	public PageInfo<Record> checkByUserId(Integer id, Integer page, Integer rows) {
		try {
			PageHelper.startPage(page, rows);
			List<Record> list = recordDao.selectByUserId(id);
			PageInfo<Record> pageInfo = new PageInfo<Record>(list);
			return pageInfo;
		} catch (Exception e) {
			return null;
		}
	}

	public PageInfo<Record> check(Record record, Integer page, Integer rows) {
		try {
			PageHelper.startPage(page, rows);
			List<Record> list = recordDao.select(record);
			PageInfo<Record> pageInfo = new PageInfo<Record>(list);
			return pageInfo;
		} catch (Exception e) {
			return null;
		}
	}

}
