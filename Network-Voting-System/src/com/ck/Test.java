package com.ck;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.ck.po.Option;
import com.ck.po.Post;
import com.ck.po.Record;
import com.ck.po.User;
import com.ck.service.OptionService;
import com.ck.service.PostService;
import com.ck.service.RecordService;
import com.ck.service.UserService;

public class Test {

	public static void main(String[] args) {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");

		UserService userService = ac.getBean(UserService.class);
		PostService postService = ac.getBean(PostService.class);
		OptionService optionService = ac.getBean(OptionService.class);
		RecordService recordService = ac.getBean(RecordService.class);

		User u = new User();
		u.setName("ck1");
		u.setPwd("666");
//		System.out.println(userService.login(u));
		 u.setGender(1);
		 u.setYear(1998);
		 System.out.println(userService.add(u));
		// System.out.println(userService.deleteById(3));
		u.setId(1);
		// System.out.println(userService.changePwd("888", u));
		// System.out.println(userService.change(u));
		// System.out.println(userService.checkById(1));
		// System.out.println(userService.check(u));

		Post p = new Post();
		p.setUserId(1);
		p.setTitle("123");
		p.setIntroduce("ckckck");
		p.setPollType(1);
		p.setOpenShow(1);
		p.setOpenPoll(1);
		p.setOpenResult(1);
		p.setMaxPoll(0);
		p.setPostState(0);
		// System.out.println(postService.add(p));
		p.setId(1);
		// System.out.println(postService.change(p));
		// System.out.println(postService.checkByUserId(1));
		// System.out.println(postService.check(p));
		// System.out.println(postService.deleteById(3));

		Option o = new Option();
		o.setPostId(1);
		o.setOptionText("eyeyeyeyyeeeee");
		o.setOptionState(0);
		// System.out.println(optionService.add(o));
		o.setId(1);
		// System.out.println(optionService.change(o));
		// System.out.println(optionService.checkByPostId(1));
		// System.out.println(optionService.deleteById(3));
		// System.out.println(optionService.checkOptionCount(1));

		Record r = new Record();
		r.setUserId(1);
		r.setOptionId(1);
		r.setPollNum(100);
		r.setPollIp(11111111);
		r.setPollMac("abcdef");
		// System.out.println(recordService.add(r));
		r.setId(1);
		// System.out.println(recordService.change(r));
		// System.out.println(recordService.checkByUserId(1));
		// System.out.println(recordService.check(r));
		// System.out.println(recordService.deleteById(4));

		((ConfigurableApplicationContext) ac).close();
	}

}
