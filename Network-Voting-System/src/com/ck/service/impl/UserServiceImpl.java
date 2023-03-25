package com.ck.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ck.dao.UserDao;
import com.ck.po.User;
import com.ck.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserDao userDao;

	public Integer add(User user) {
		try {
			return userDao.insert(user);
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer login(User user) {
		try {
			Integer id = userDao.login(user);
			return id == null ? 0 : id;
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer changePwd(String newPwd, User user) {
		try {
			if (userDao.selectById(user.getId()).getPwd().equals(user.getPwd())) {
				// 根据id查询用户的密码，和用户填的密码进行对比
				user.setPwd(newPwd);
				userDao.update(user);
				return 1;
			}
			return 0;
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer change(User user) {
		try {
			return userDao.update(user);
		} catch (Exception e) {
			return 0;
		}
	}

	public User checkById(Integer id) {
		try {
			return userDao.selectById(id);
		} catch (Exception e) {
			return null;
		}
	}

	public PageInfo<User> check(User user, Integer page, Integer rows) {
		try {
			PageHelper.startPage(page, rows);
			List<User> list = userDao.select(user);
			PageInfo<User> pageInfo = new PageInfo<User>(list);
			return pageInfo;
		} catch (Exception e) {
			return null;
		}
	}

	public List<User> download() {
		try {
			return userDao.select(null);
		} catch (Exception e) {
			return null;
		}
	}

}
