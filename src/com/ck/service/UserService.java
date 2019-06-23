package com.ck.service;

import java.util.List;

import com.ck.po.User;
import com.github.pagehelper.PageInfo;

public interface UserService {
	public Integer add(User user); // 注册

	public Integer login(User user); // 登录

	public Integer changePwd(String newPwd, User user); // 修改密码

	public Integer change(User user); // 修改

	public User checkById(Integer id); // 查询通过id

	public PageInfo<User> check(User user, Integer page, Integer rows); // 查询(模糊)

	public List<User> download(); // 下载

}
