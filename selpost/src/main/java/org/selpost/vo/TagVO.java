package org.selpost.vo;

public class TagVO {
	private int t_no;
	private String tag_codeID;
	private String t_name;
	
	public int getT_no() {
		return t_no;
	}
	public void setT_no(int t_no) {
		this.t_no = t_no;
	}
	public String getTag_codeID() {
		return tag_codeID;
	}
	public void setTag_codeID(String tag_codeID) {
		this.tag_codeID = tag_codeID;
	}
	public String getT_name() {
		return t_name;
	}
	public void setT_name(String t_name) {
		this.t_name = t_name;
	}
	@Override
	public String toString() {
		return "TagVO [t_no=" + t_no + ", tag_codeID=" + tag_codeID
				+ ", t_name=" + t_name + "]";
	}
	
	
}	
