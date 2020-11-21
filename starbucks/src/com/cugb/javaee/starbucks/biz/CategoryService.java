package com.cugb.javaee.starbucks.biz;

import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Category;
import com.cugb.javaee.starbucks.dao.CategoryDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;
import com.cugb.javaee.starbucks.utils.PageModel;
public class CategoryService {
	private CategoryDAO categorydao;
	public CategoryDAO getCategorydao() {
		return categorydao;
	}

	public void setCategorydao(CategoryDAO categorydao) {
		this.categorydao = categorydao;
	}
	
	/**
	 * @param pageNO
	 * @param pageSize
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public PageModel<Category> findCategory4PageList(int pageNO,int pageSize) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		categorydao = (CategoryDAO) DAOFactory.newInstance("CategoryDAO");
		String strsql = "select categoryid Categoryid,categoryname Categoryname from Category limit ?,?";
		int actualpageNO = (pageNO-1)*pageSize;
		Object[] params = {actualpageNO,pageSize};
		ArrayList<Category> dishlist =categorydao.findCategorys(strsql, params);
		PageModel<Category> pagemodel = new PageModel<Category>(pageSize,pageNO,getTotalCategorys(),dishlist);
		return pagemodel;
	}
	
//	public PageModel<Category> findDish5PageList(int pageNO,int pageSize,String str) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
//		categorydao = (CategoryDAO) DAOFactory.newInstance("CategoryDAO");
//		String strsql = "select dishid Dishid, dishname Dishname, price Price, description Descri, imgurl Imgurl, discount Discount from Dish where dishname like '%"+str+"%' limit ?, ?";
//		int actualpageNO = (pageNO-1)*pageSize;
//		Object[] params = {actualpageNO, pageSize};
//		ArrayList<Category> dishlist = categorydao.findDishs(strsql, params);
//		System.out.println(dishlist.size());
//		PageModel<Category> pagemodel = new PageModel<Dish>(pageSize,pageNO,getPerDishs(str),dishlist);
//		return pagemodel;
//	}

	public int getTotalCategorys() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		categorydao = (CategoryDAO) DAOFactory.newInstance("CategoryDAO");
		String strsql = "select count(*) from Dish";
		return categorydao.getTotalCategorys(strsql);
	}
	
	public int getPerCategorys(String str) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		categorydao = (CategoryDAO) DAOFactory.newInstance("CategoryDAO");
		String strsql = "select count(*) from Dish where dishname like '%"+str+"%'";
		return categorydao.getTotalCategorys(strsql);
	}
}
