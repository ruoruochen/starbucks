package com.cugb.javaee.starbucks.utils;

import java.util.ArrayList;
import java.util.List;

public class PageModel<T> {
	
	//记录数目
	private int totalrecords;
	//每页记录数
	private int pageSize;
	//当前页号
	private int pageNO;
	//结果集
	private List<T> list;
	
	/**
	 * 总页数
	 * @return
	 */
	public int getTotalPages(){
		return (totalrecords+pageSize-1)/pageSize;
	}

	/**
	 * 第一页
	 * @return
	 */
	public int getTopPageNO(){
		return 1;
	}

	/**
	 * 上一页
	 * @return
	 */
	public int getPrevPageNO(){
		if(pageNO <= 1){
			return 1;
		}
		return pageNO-1;
	}

	/**
	 * 下一页
	 * @return
	 */
	public int getNextPageNO(){
		if(pageNO >= getTotalPages()){
			return getTotalPages();
		}
		return pageNO+1;
	}

	/**
	 * 最后一页
	 * @return
	 */
	public int getBottomPageNO(){
		if(getTotalPages()>=1)
		return getTotalPages();
		else return 1;
	}

	public int getTotalrecords() {
		return totalrecords;
	}
	public void setTotalrecords(int totalrecords) {
		this.totalrecords = totalrecords;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getPageNO() {
		return pageNO;
	}
	public void setPageNO(int pageNO) {
		this.pageNO = pageNO;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}
	
	public PageModel(int pageSize,int pageNo,int totalrecords,List list){
		this.pageNO = pageNo;
		this.pageSize = pageSize;
		this.totalrecords = totalrecords;
		this.list = list;
	}
}
