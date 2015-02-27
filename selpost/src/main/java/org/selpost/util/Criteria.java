package org.selpost.util;

public class Criteria {

	private int page = 1;
	private int perPageNum = 6;
	private int displayPageNum = 5;
	private int limitList;
	
	public int getLimitList() {
		return limitList;
	}
	public void setLimitList(int limitList) {
		this.limitList = limitList;
	}
	public int getPage() {
		return page;
	}
	public Criteria setPage(int page){
		this.page = page;
		setLimitList((int)(Math.ceil(page/10.0)*30)+1);
		return this;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public Criteria setPerPageNum(int perPageNum){
		this.perPageNum = perPageNum;
		return this;
	}
	public int getDisplayPageNum(){
		return displayPageNum;
	}
	public Criteria setDisplayPageNum(int displayPageNum){
		this.displayPageNum = displayPageNum;
		return this;
	}
	public int getPageStart(){
		return (this.page -1)* perPageNum;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum
				+ ", displayPageNum=" + displayPageNum + ", limitList="
				+ limitList + "]";
	}
	
}
