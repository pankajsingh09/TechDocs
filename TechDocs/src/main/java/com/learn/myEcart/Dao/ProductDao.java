package com.learn.myEcart.Dao;

import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.learn.myEcart.entities.Product;
import com.mysql.cj.Query;

import java.util.List;

import org.hibernate.Session;

public class ProductDao {
	private SessionFactory factory;

	public ProductDao(SessionFactory factory) {
		super();
		this.factory = factory;
	}

	public boolean saveProduct(Product product) {
		boolean f = false;
		try {

			Session session = this.factory.openSession();

			Transaction tx = session.beginTransaction();

			session.save(product);

			tx.commit();
			session.close();
			f = true;
		}

		catch (Exception e) {
			e.printStackTrace();
			f = false;

		}
		return f;
	}

//	get all products

	public List<Product> getAllProduct() {

		Session s = this.factory.openSession();
		org.hibernate.query.Query query = s.createQuery("from Product where userType=:u");
		query.setParameter("u", "admin");
		List<Product> list = query.list();
		return list;

	}

//	get all products by Id

	public List<Product> getAllProductById(int cid) {

		Session s = this.factory.openSession();
		org.hibernate.query.Query query = s
				.createQuery("from Product as p where p.category.categoryId =: id and userType=:u ");
		query.setParameter("id", cid);
		query.setParameter("u", "admin");
		List<Product> list = query.list();
		return list;

	}

	public Product getProductById(int id) {

		Session s = this.factory.openSession();
		org.hibernate.query.Query query = s.createQuery("from Product where pId =: pId and userType=:u  ");
		query.setParameter("pId", id);
		query.setParameter("u", "admin");
		Product list = (Product) query.getSingleResult();

		return list;

	}

	// ----------------------------normal User-------------------------------

	public List<Product> getAllProductNormalType() {

		Session s = this.factory.openSession();
		org.hibernate.query.Query query = s.createQuery("from Product where userType=:u");
		query.setParameter("u", "normal");
		List<Product> list = query.list();
		return list;

	}

	public List<Product> getAllProductByIdNormalType(int cid) {

		Session s = this.factory.openSession();
		org.hibernate.query.Query query = s
				.createQuery("from Product as p where p.category.categoryId =: id and userType=:u ");
		query.setParameter("id", cid);
		query.setParameter("u", "normal");
		List<Product> list = query.list();
		return list;

	}

	public Product getProductByIdNormalType(int id) {

		Session s = this.factory.openSession();
		org.hibernate.query.Query query = s.createQuery("from Product where pId =: pId and userType=:u  ");
		query.setParameter("pId", id);
		query.setParameter("u", "normal");
		Product list = (Product) query.getSingleResult();

		return list;

	}

	// Update Product

	public boolean saveProductNormalType(int productId) {
		boolean f = false;
		try {

			Session session = this.factory.openSession();

			Transaction tx = session.beginTransaction();

			Product prod = session.get(Product.class, productId);

			prod.setUserType("admin");

			session.save(prod);

			tx.commit();
			session.close();
			f = true;
			System.out.println("Article validated...");
		}

		catch (Exception e) {
			e.printStackTrace();
			f = false;

		}
		return f;
	}

	// Delete Product

	public boolean deleteProductNormalType(int productId) {
		boolean f = false;
		try {

			Session session = this.factory.openSession();

			Transaction tx = session.beginTransaction();

			Product prod = session.get(Product.class, productId);

			session.delete(prod);

			tx.commit();
			session.close();
			f = true;
			System.out.println("Article Deleted..");
		}

		catch (Exception e) {
			e.printStackTrace();
			f = false;

		}
		return f;
	}

}
