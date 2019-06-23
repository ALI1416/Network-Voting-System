package com.ck.service;

import com.ck.po.Record;
import com.github.pagehelper.PageInfo;

public interface RecordService {
	public Integer add(Record record); // 新增

	public Integer delete(Integer id); // 删除通过id

	public Integer change(Record record); // 修改

	public PageInfo<Record> checkByUserId(Integer id, Integer page, Integer rows); // 查询通过用户id

	public PageInfo<Record> check(Record record, Integer page, Integer rows); // 查询(模糊)
}
