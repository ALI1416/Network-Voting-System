package com.ck.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.util.ArrayList;
import java.util.List;

import com.ck.po.User;

public class UserCSVUtils {

	public static List<User> read(String file) {
		List<User> list = new ArrayList<User>();
		BufferedReader br = null;
		try {
			br = new BufferedReader(new FileReader(file));
			String line = "";
			String[] cell = null;
			br.readLine(); // 去除首行
			while ((line = br.readLine()) != null) {
				cell = line.split(",");
				User u = new User();
				u.setName(cell[0]);
				u.setPwd(cell[1]);
				u.setGender(Integer.parseInt(cell[2]));
				u.setYear(Integer.parseInt(cell[3]));
				list.add(u);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (br != null) {
				try {
					br.close();
					br = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}

	public static boolean write(String path, List<User> list) {
		boolean isSucess = false;
		FileOutputStream out = null;
		OutputStreamWriter osw = null;
		BufferedWriter bw = null;
		try {
			out = new FileOutputStream(path);
			osw = new OutputStreamWriter(out, "GBK");
			bw = new BufferedWriter(osw);
			if (list != null && !list.isEmpty()) {
				bw.append("编号,姓名,密码,性别,出生年\r\n");
				for (User user : list) {
					bw.append(user.getId() + "," + user.getName() + "," + user.getPwd() + "," + user.getGender() + ","
							+ user.getYear() + "\r\n");
				}
			}
			isSucess = true;
		} catch (Exception e) {
			e.printStackTrace();
			isSucess = false;
		} finally {
			if (bw != null) {
				try {
					bw.close();
					bw = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (osw != null) {
				try {
					osw.close();
					osw = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			if (out != null) {
				try {
					out.close();
					out = null;
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
		return isSucess;
	}

	public static void main(String[] args) {
		List<User> list1 = read("D:/3.csv");
		System.out.println(list1);
		List<User> list = new ArrayList<User>();
		User u = new User();
		u.setId(1);
		u.setName("ck");
		u.setPwd("ewew");
		u.setGender(1);
		u.setYear(1998);
		list.add(u);
		User u2 = new User();
		u2.setId(2);
		u2.setName("kk");
		u2.setPwd("erwe");
		u2.setGender(0);
		u2.setYear(2000);
		list.add(u2);
		// System.out.println(list);
		// write("D:/2.csv", list);
	}
}
