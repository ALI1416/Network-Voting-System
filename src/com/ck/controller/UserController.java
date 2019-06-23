package com.ck.controller;

import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ck.po.User;
import com.ck.service.UserService;
import com.ck.util.FileUpDownLoad;
import com.ck.util.UserCSVUtils;
import com.github.pagehelper.PageInfo;

@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private UserService userService;

	@PostMapping("/register")
	@ResponseBody
	public Integer register(@RequestBody User user) {
		return userService.add(user);
	}

	@PostMapping("/login")
	@ResponseBody
	public Integer login(HttpSession session, @RequestBody User user) {
		Integer id = userService.login(user);
		if (id != 0) {// 登录成功
			session.setAttribute("id", id);
			session.setAttribute("name", user.getName());
			return id;
		} else {// 账号或密码错误
			return 0;
		}
	}

	@GetMapping("/myInfo/{id}")
	public String my(Model model, @PathVariable Integer id) {
		User user = userService.checkById(id);
		model.addAttribute("user", user);
		return "/my_info.jsp";
	}

	@PostMapping("/changePwd")
	@ResponseBody
	public Integer changePwd(@RequestBody User user) {
		// newPwd临时占用name字段
		String newPwd = user.getName();
		user.setName(null);
		return userService.changePwd(newPwd, user);
	}

	@PostMapping("/change")
	@ResponseBody
	public Integer change(@RequestBody User user) {
		return userService.change(user);
	}

	@GetMapping("/userInfo")
	public String checkAll(Model model, User user, @RequestParam(defaultValue = "1") Integer page,
			@RequestParam(defaultValue = "10") Integer rows) {
		PageInfo<User> pageInfo = userService.check(user, page, rows);
		model.addAttribute("pageInfo", pageInfo);
		return "/user_info.jsp";
	}

	@PostMapping("/upload")
	public String uploadExcel(@RequestParam("file") MultipartFile file) {
		String name = FileUpDownLoad.upload("D:/file/", file);
		if (name == null) {
			return "redirect:userInfo";
		} else {
			List<User> list = UserCSVUtils.read("D:/file/" + name);
			Integer count = 0;// 总数
			Integer ok = 0;// 成功个数
			for (User user : list) {
				count++;
				ok += userService.add(user);
			}
			System.out.println("总共" + count + "成功" + ok);
			return "redirect:userInfo";
		}
	}

	@GetMapping("/download")
	public ResponseEntity<byte[]> downloadExcel(HttpServletRequest request) {
		List<User> list = userService.download();
		String path = "D:/file/" + UUID.randomUUID() + ".csv";
		boolean ok = UserCSVUtils.write(path, list);
		if (ok) {
			ResponseEntity<byte[]> file = FileUpDownLoad.download(request, path);
			if (file == null) {
				return null;
			} else {
				return file;
			}
		} else {
			return null;
		}
	}
}
