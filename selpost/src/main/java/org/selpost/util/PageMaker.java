package org.selpost.util;

public class PageMaker {
	private int totalCount;
	private int first;
	private int last;
	private int prev;
	private int next;
	

	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getFirst() {
		return first;
	}
	public void setFirst(int first) {
		this.first = first;
	}
	public int getLast() {
		return last;
	}
	public void setLast(int last) {
		this.last = last;
	}
	public int getPrev() {
		return prev;
	}
	public void setPrev(int prev) {
		this.prev = prev;
	}
	public int getNext() {
		return next;
	}
	public void setNext(int next) {
		this.next = next;
	}
	public PageMaker calcPage(Criteria cri){
		int page = cri.getPage();
		double perPageNum = cri.getPerPageNum();
		double disPlayPageNum = cri.getDisplayPageNum();
		
		double tempLast = Math.ceil(page/(double) disPlayPageNum)*disPlayPageNum;
		
		first = (int)(tempLast - disPlayPageNum)+1;
		
		last = (int)(totalCount < tempLast * perPageNum ? Math.ceil(totalCount/(double)perPageNum): tempLast);
		
		prev = first > 1 ? first -1 :0;
		next = totalCount > last * perPageNum ? last +1 : 0;
		
		return this;
	}
	
}
