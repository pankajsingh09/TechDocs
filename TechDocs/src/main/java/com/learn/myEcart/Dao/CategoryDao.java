package com.learn.myEcart.Dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.myEcart.entities.Category;
import com.mysql.cj.Query;

public class CategoryDao {
	
	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}
	
	public int saveCategory(Category cat)
	{
		Session session=factory.openSession();
		
		Transaction tx=session.beginTransaction();
		
		int catId=(int)session.save(cat);
		
		tx.commit();
		
		session.close();
		
		return catId;
	}
	
	public List<Category> getCategories(){
		
		Session s=this.factory.openSession();
		org.hibernate.query.Query q= s.createQuery("from Category where userType=:u");
		q.setParameter("u", "admin");	
		List<Category> list=q.list();
		
		return list;
		
	}
	
	public Category getCategoryById(int cid)
	{
		Category cat=null;
		try {
			
			Session session=this.factory.openSession();
			cat=session.get(Category.class,cid);
			session.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cat;
	}
	
	// ---------------Normal -----------------------------------------------
	
public List<Category> getCategoriesNormalType(){
		
		Session s=this.factory.openSession();
		org.hibernate.query.Query q= s.createQuery("from Category where userType=:u");
		q.setParameter("u", "normal");	
		List<Category> list=q.list();
		
		return list;
		
	}

public void saveCategoryNormalType(int catID)
{
	Session session=factory.openSession();
	
	Transaction tx=session.beginTransaction();
	
	Category cat=session.get(Category.class, catID);
	
	cat.setUserType("admin");
	
	session.save(cat);
	
	tx.commit();
	
	session.close();
	
	return ;
}


public void deleteCategoryNormalType(int catID)
{
	Session session=factory.openSession();
	
	Transaction tx=session.beginTransaction();
	
	Category cat=session.get(Category.class, catID);
	
	cat.setUserType("admin");
	
	session.delete(cat);
	
	tx.commit();
	
	session.close();
	
	return ;
}

}
