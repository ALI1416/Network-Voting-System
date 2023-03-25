package com.ck.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ck.po.Option;
import com.ck.po.Post;
import com.ck.service.OptionService;
import com.ck.service.PostService;
import com.github.pagehelper.PageInfo;

@Service
@RequestMapping("/post")
public class PostController {

	@Autowired
	private PostService postService;
	@Autowired
	private OptionService optionService;

	@PostMapping("/add")
	@ResponseBody
	public Integer add(@RequestBody Post post) throws Exception {
		post.setPostState(0);
		postService.add(post);
		for (Option option : post.getOption()) {
			option.setPostId(post.getId());
			option.setOptionNum(0);
			optionService.add(option);
		}
		return 1;
	}

	@GetMapping("/delete/{id}")
	@ResponseBody
	public Integer delete(@PathVariable Integer id) {
		Integer ok = postService.delete(id);
		if (ok != 0) {
			return 1;
		} else {
			return 0;
		}
	}

	@GetMapping("/edit/{id}")
	public String change(Model model, @PathVariable Integer id) {
		Post post = postService.checkById(id);
		List<Option> option = optionService.checkByPostId(id);
		post.setOption(option);
		model.addAttribute("post", post);
		return "/poll_edit.jsp";
	}

	@PostMapping("/change")
	@ResponseBody
	public Integer change(@RequestBody Post post) {
		try {
			List<Option> list = post.getOption();
			post.setOption(null);
			postService.change(post);
			for (Option option : list) {
				optionService.change(option);
			}
			return 1;
		} catch (Exception e) {
			return 0;
		}
	}

	@GetMapping("/check/{id}")
	public String check(Model model, @PathVariable Integer id) {
		Post post = postService.checkById(id);
		List<Option> option = optionService.checkByPostId(id);
		post.setOption(option);
		model.addAttribute("post", post);
		return "/poll_info.jsp";
	}

	@GetMapping("/check")
	public String checkAll(Model model, String title, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows) {
		Post post = new Post();
		if (title != null) {
			post.setTitle(title);
		}
		post.setPostState(0);
		PageInfo<Post> pageInfo = postService.check(post, page, rows);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("title", title);
		return "/poll.jsp";
	}

	@GetMapping("/myPost/{id}")
	public String checkMeAll(Model model, @PathVariable Integer id, String title,
			@RequestParam(defaultValue = "1") Integer page, @RequestParam(defaultValue = "5") Integer rows) {
		Post post = new Post();
		if (title != null) {
			post.setTitle(title);
		}
		post.setUserId(id);
		post.setPostState(0);
		PageInfo<Post> pageInfo = postService.check(post, page, rows);
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("title", title);
		return "/post.jsp";
	}

}
