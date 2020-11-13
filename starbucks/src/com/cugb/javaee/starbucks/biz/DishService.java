package com.cugb.javaee.starbucks.biz;

import java.util.ArrayList;

import com.cugb.javaee.starbucks.bean.Dish;
import com.cugb.javaee.starbucks.dao.DishDAO;
import com.cugb.javaee.starbucks.utils.DAOFactory;
import com.cugb.javaee.starbucks.utils.PageModel;

public class DishService {
	private DishDAO dishdao;

	public DishDAO getDishdao() {
		return dishdao;
	}

	public void setDishdao(DishDAO dishdao) {
		this.dishdao = dishdao;
	}
	
	/**
	 * @param pageNO
	 * @param pageSize
	 * @return
	 * @throws ClassNotFoundException 
	 * @throws IllegalAccessException 
	 * @throws InstantiationException 
	 */
	public PageModel<Dish> findDish4PageList(int pageNO,int pageSize) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
		String strsql = "select dishid Dishid, dishname Dishname, price Price, description Descri, imgurl Imgurl, discount Discount from Dish limit ?,?";
		int actualpageNO = (pageNO-1)*pageSize;
		Object[] params = {actualpageNO,pageSize};
		ArrayList<Dish> dishlist = dishdao.findDishs(strsql, params);
		PageModel<Dish> pagemodel = new PageModel<Dish>(pageSize,pageNO,getTotalDishs(),dishlist);
		return pagemodel;
	}
	
	public PageModel<Dish> findDish5PageList(int pageNO,int pageSize,String str) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
		String strsql = "select dishid Dishid, dishname Dishname, price Price, description Descri, imgurl Imgurl, discount Discount from Dish where dishname like '%"+str+"%' limit ?, ?";
		int actualpageNO = (pageNO-1)*pageSize;
		Object[] params = {actualpageNO, pageSize};
		ArrayList<Dish> dishlist = dishdao.findDishs(strsql, params);
		System.out.println(dishlist.size());
		PageModel<Dish> pagemodel = new PageModel<Dish>(pageSize,pageNO,getPerDishs(str),dishlist);
		return pagemodel;
	}

	public int getTotalDishs() throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
		String strsql = "select count(*) from Dish";
		return dishdao.getTotalDishs(strsql);
	}
	
	public int getPerDishs(String str) throws InstantiationException, IllegalAccessException, ClassNotFoundException{
		dishdao = (DishDAO) DAOFactory.newInstance("DishDAO");
		String strsql = "select count(*) from Dish where dishname like '%"+str+"%'";
		return dishdao.getTotalDishs(strsql);
	}
	
}