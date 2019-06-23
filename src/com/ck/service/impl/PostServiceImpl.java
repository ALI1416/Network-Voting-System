package com.ck.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ck.dao.PostDao;
import com.ck.po.Post;
import com.ck.service.PostService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class PostServiceImpl implements PostService {
	@Autowired
	private PostDao postDao;

	public Integer add(Post post) {
		try {
			return postDao.insert(post);
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer delete(Integer id) {
		try {
			Post post = new Post();
			post.setPostState(2);
			return postDao.update(post);
		} catch (Exception e) {
			return 0;
		}
	}

	public Integer change(Post post) {
		try {
			return postDao.update(post);
		} catch (Exception e) {
			return 0;
		}
	}

	public Post checkById(Integer id) {
		try {
			return postDao.selectById(id);
		} catch (Exception e) {
			return null;
		}
	}

	public PageInfo<Post> checkByUserId(Integer id, Integer page, Integer rows) {
		try {
			PageHelper.startPage(page, rows);
			List<Post> list = postDao.selectByUserId(id);
			PageInfo<Post> pageInfo = new PageInfo<Post>(list);
			return pageInfo;
		} catch (Exception e) {
			return null;
		}
	}

	public PageInfo<Post> check(Post post, Integer page, Integer rows) {
		try {
			PageHelper.startPage(page, rows);
			List<Post> list = postDao.select(post);
			PageInfo<Post> pageInfo = new PageInfo<Post>(list);
			return pageInfo;
		} catch (Exception e) {
			return null;
		}
	}

}
