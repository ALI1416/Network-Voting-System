package com.ck.service;

import java.util.List;

import com.ck.po.Option;

public interface OptionService {
	public Integer add(Option option); // 新增

	public Integer delete(Integer id); // 删除通过id

	public Integer change(Option option); // 修改

	public List<Option> checkByPostId(Integer id); // 查询通过发布id

	public Option checkById(Integer id);

	public Integer addNum(Option option); // 增加投票数量
}
