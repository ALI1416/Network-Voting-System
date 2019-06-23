package com.ck.dao;

import java.util.List;

import com.ck.po.Post;

public interface PostDao {

	public List<Post> select(Post post); // 查询发布(模糊)

	public List<Post> selectByUserId(Integer id); // 查询发布通过用户id

	public Post selectById(Integer id); // 查询发布通过id

	public Integer insert(Post post); // 新增发布

	public Integer update(Post post); // 修改发布

	public Integer delete(Integer id); // 删除发布

}
