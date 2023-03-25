package com.ck.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class RedirectController {

	@GetMapping("/")
	public String user(HttpSession session) {
		Integer id = (Integer) session.getAttribute("id");
		if (id != null) {
			if (id == 1) {
				return "/admin.jsp";
			} else {
				return "/main.jsp";
			}
		} else {
			return "/unlogin.jsp";
		}
	}

	@GetMapping("/user/register")
	public String register() {
		return "/register.jsp";
	}

	@GetMapping("/user/login")
	public String login() {
		return "/login.jsp";
	}

	@GetMapping("/user/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "/login.jsp";
	}

	@GetMapping("/post/newPost")
	public String newPost() {
		return "/new_post.jsp";
	}
}
