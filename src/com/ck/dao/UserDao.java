package com.ck.dao;

import java.util.List;

import com.ck.po.User;

public interface UserDao {
	public Integer login(User user); // 用户登录

	public List<User> select(User user); // 查询用户(模糊)

	public User selectById(Integer id); // 查询用户通过id

	public Integer insert(User user); // 新增用户

	public Integer update(User user); // 修改用户

	public Integer delete(Integer id); // 删除用户

}
