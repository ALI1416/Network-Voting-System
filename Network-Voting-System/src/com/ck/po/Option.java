package com.ck.po;

/**
 * 投票选项持久类
 * 
 * @author ALI
 *
 */
public class Option {
	private Integer id;
	private Integer postId; // 发布投票id
	private String optionText; // 选项描述
	private Integer optionNum; // 被投票数量
	private Integer optionState; // 选项状态 0正常 1已删除

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getPostId() {
		return postId;
	}

	public void setPostId(Integer postId) {
		this.postId = postId;
	}

	public String getOptionText() {
		return optionText;
	}

	public void setOptionText(String optionText) {
		this.optionText = optionText;
	}

	public Integer getOptionNum() {
		return optionNum;
	}

	public void setOptionNum(Integer optionNum) {
		this.optionNum = optionNum;
	}

	public Integer getOptionState() {
		return optionState;
	}

	public void setOptionState(Integer optionState) {
		this.optionState = optionState;
	}

	@Override
	public String toString() {
		return "Option [id=" + id + ", postId=" + postId + ", optionText=" + optionText + ", optionNum=" + optionNum
				+ ", optionState=" + optionState + "]";
	}

}
