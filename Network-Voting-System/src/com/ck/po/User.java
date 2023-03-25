package com.ck.po;

import java.util.List;

/**
 * 用户持久类
 * 
 * @author ALI
 *
 */
public class User {
	private Integer id;
	private String name; // 用户名
	private String pwd; // 密码
	private Integer gender; // 性别 0女 1男
	private Integer year; // 出生年
	private List<Post> post; // 发布的投票
	private List<Record> record; // 投票的记录

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Integer getYear() {
		return year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public List<Post> getPost() {
		return post;
	}

	public void setPost(List<Post> post) {
		this.post = post;
	}

	public List<Record> getRecord() {
		return record;
	}

	public void setRecord(List<Record> record) {
		this.record = record;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", pwd=" + pwd + ", gender=" + gender + ", year=" + year
				+ ", post=" + post + ", record=" + record + "]";
	}

}
