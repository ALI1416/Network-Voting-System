package com.ck.po;

import java.util.Date;

/**
 * 投票记录持久类
 * 
 * @author ALI
 *
 */
public class Record {
	private Integer id;
	private Integer userId; // 投此票用户的id
	private Integer optionId; // 投票选项id
	private Integer pollNum; // 投票数量
	private Date pollDate; // 投票时间
	private Integer pollIp; // 投票的IP地址
	private String pollMac; // 投票的MAC地址
	private Integer pollState; // 投票的状态 0正常 1取消

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getOptionId() {
		return optionId;
	}

	public void setOptionId(Integer optionId) {
		this.optionId = optionId;
	}

	public Integer getPollNum() {
		return pollNum;
	}

	public void setPollNum(Integer pollNum) {
		this.pollNum = pollNum;
	}

	public Date getPollDate() {
		return pollDate;
	}

	public void setPollDate(Date pollDate) {
		this.pollDate = pollDate;
	}

	public Integer getPollIp() {
		return pollIp;
	}

	public void setPollIp(Integer pollIp) {
		this.pollIp = pollIp;
	}

	public String getPollMac() {
		return pollMac;
	}

	public void setPollMac(String pollMac) {
		this.pollMac = pollMac;
	}

	public Integer getPollState() {
		return pollState;
	}

	public void setPollState(Integer pollState) {
		this.pollState = pollState;
	}

	@Override
	public String toString() {
		return "Record [id=" + id + ", userId=" + userId + ", optionId=" + optionId + ", pollNum=" + pollNum
				+ ", pollDate=" + pollDate + ", pollIp=" + pollIp + ", pollMac=" + pollMac + ", pollState=" + pollState
				+ "]";
	}

}
