package org.selpost.vo;


import java.sql.Date;


public class NewsVO {
	
	private int n_no;
	private String n_category;
	private String n_title;	  
	private String n_writer;  
	private String n_content; 
	private String n_thumImg; 
	private Date n_regDate;	  
	private Date n_updateDate;	  
	private String n_summary;
	private int n_good;	      
	private String n_tag;	 
	private int n_views;
	
//	private MultipartFile Filedata;
//	
//	public MultipartFile getFiledata() {
//		return Filedata;
//	}
//	public void setFiledata(MultipartFile filedata) {
//		Filedata = filedata;
//	}
//	
	public int getN_no() {
		return n_no;
	}
	public void setN_no(int n_no) {
		this.n_no = n_no;
	}
	public String getN_category() {
		return n_category;
	}
	public void setN_category(String n_category) {
		this.n_category = n_category;
	}
	public String getN_title() {
		return n_title;
	}
	public void setN_title(String n_title) {
		this.n_title = n_title;
	}
	public String getN_writer() {
		return n_writer;
	}
	public void setN_writer(String n_writer) {
		this.n_writer = n_writer;
	}
	public String getN_content() {
		return n_content;
	}
	public void setN_content(String n_content) {
		this.n_content = n_content;
	}
	public String getN_thumImg() {
		return n_thumImg;
	}
	public void setN_thumImg(String n_thumImg) {
		this.n_thumImg = n_thumImg;
	}
	public Date getN_regDate() {
		return n_regDate;
	}
	public void setN_regDate(Date n_regDate) {
		this.n_regDate = n_regDate;
	}
	public Date getN_updateDate() {
		return n_updateDate;
	}
	public void setN_updateDate(Date n_updateDate) {
		this.n_updateDate = n_updateDate;
	}
	public String getN_summary() {
		return n_summary;
	}
	public void setN_summary(String n_summary) {
		this.n_summary = n_summary;
	}
	public int getN_good() {
		return n_good;
	}
	public void setN_good(int n_good) {
		this.n_good = n_good;
	}
	public String getN_tag() {
		return n_tag;
	}
	public void setN_tag(String n_tag) {
		this.n_tag = n_tag;
	}
	public int getN_views() {
		return n_views;
	}
	public void setN_views(int n_views) {
		this.n_views = n_views;
	}
	@Override
	public String toString() {
		return "EditVO [n_no=" + n_no + ", n_category=" + n_category
				+ ", n_title=" + n_title + ", n_writer=" + n_writer
				+ ", n_content=" + n_content + ", n_thumImg=" + n_thumImg
				+ ", n_regDate=" + n_regDate + ", n_updateDate=" + n_updateDate
				+ ", n_summary=" + n_summary + ", n_good=" + n_good
				+ ", n_tag=" + n_tag + ", n_views=" + n_views + "]";
	}	  
	
	
	
}
