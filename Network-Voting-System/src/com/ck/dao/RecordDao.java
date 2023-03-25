package com.ck.dao;

import java.util.List;

import com.ck.po.Record;

public interface RecordDao {
	public List<Record> select(Record record); // 查询投票记录(模糊)

	public List<Record> selectByUserId(Integer id); // 查询投票记录通过用户id

	public List<Record> selectByOptionId(Integer id); // 查询投票记录通过选项id

	public Record selectById(Integer id); // 查询投票记数通过id

	public Integer insert(Record record); // 新增投票记录

	public Integer update(Record record); // 更新投票记录

	public Integer delete(Integer id); // 删除投票记录

}
