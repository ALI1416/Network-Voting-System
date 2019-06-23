package com.ck.dao;

import java.util.List;

import com.ck.po.Option;

public interface OptionDao {
	public List<Option> select(Option option); // 查询选项(模糊)

	public List<Option> selectByPostId(Integer id); // 查询选项通过发布id

	public Option selectById(Integer id); // 查询选项通过id

	public Integer insert(Option option); // 新增选项

	public Integer update(Option option); // 更新选项

	public Integer delete(Integer id); // 删除选项

	public Integer addNum(Option option); // 增加投票数量
}
