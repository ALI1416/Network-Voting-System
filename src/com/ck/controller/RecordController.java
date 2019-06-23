package com.ck.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ck.po.Option;
import com.ck.po.Post;
import com.ck.po.Record;
import com.ck.service.OptionService;
import com.ck.service.PostService;
import com.ck.service.RecordService;
import com.github.pagehelper.PageInfo;

@Service
@RequestMapping("/record")
public class RecordController {
	@Autowired
	private RecordService recordService;
	@Autowired
	private PostService postService;
	@Autowired
	private OptionService optionService;

	@RequestMapping("/add")
	@ResponseBody
	public Integer add(@RequestBody Record record) {
		Integer ok = recordService.add(record);
		if (ok != 0) {
			Option option = new Option();
			option.setId(record.getOptionId());
			option.setOptionNum(1);
			Integer ok2 = optionService.addNum(option);
			if (ok2 != 0) {
				return 1;
			} else {
				return 0;
			}
		} else {
			return 0;
		}
	}

	@GetMapping("/myRecord/{id}")
	public String myRecord(Model model, @PathVariable Integer id, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows) {
		List<Post> postList = new ArrayList<Post>();
		PageInfo<Record> recordPage = recordService.checkByUserId(id, page, rows);
		List<Record> list = recordPage.getList(); // 投票记录
		for (Record record : list) {
			Option option = optionService.checkById(record.getOptionId()); // 选项
			Post post = postService.checkById(option.getPostId()); // 发布
			Post my = new Post();
			my.setId(post.getId());
			my.setTitle(post.getTitle());
			my.setIntroduce(option.getOptionText());
			my.setPostDate(record.getPollDate());
			my.setMaxPoll(record.getPollNum());
			postList.add(my);
		}
		model.addAttribute("list", postList);
		model.addAttribute("pageNum", recordPage.getPageNum());
		model.addAttribute("pages", recordPage.getPages());
		return "/record.jsp";
	}

	@GetMapping("/check")
	public String check(Model model, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "5") Integer rows) {
		List<Post> postList = new ArrayList<Post>();
		PageInfo<Record> recordPage = recordService.check(null, page, rows);
		List<Record> list = recordPage.getList(); // 投票记录
		for (Record record : list) {
			Option option = optionService.checkById(record.getOptionId()); // 选项
			Post post = postService.checkById(option.getPostId()); // 发布
			Post my = new Post();
			my.setId(post.getId());
			my.setTitle(post.getTitle());
			my.setIntroduce(option.getOptionText());
			my.setPostDate(record.getPollDate());
			my.setMaxPoll(record.getPollNum());
			postList.add(my);
		}
		model.addAttribute("list", postList);
		model.addAttribute("pageNum", recordPage.getPageNum());
		model.addAttribute("pages", recordPage.getPages());
		return "/record.jsp";
	}

}