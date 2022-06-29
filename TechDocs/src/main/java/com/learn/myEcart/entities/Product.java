package com.learn.myEcart.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;

@Entity
public class Product {
    
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int pId;
    private String pTitle;
    @Column(length = 300000)
    private String pDesc;
    private String pPhoto;
    @ManyToOne
    private Category category;
    private String userType;
    
    
	public String getUserType() {
		return userType;
	}
	public void setUserType(String userType) {
		this.userType = userType;
	}
	public int getpId() {
		return pId;
	}
	public void setpId(int pId) {
		this.pId = pId;
	}
	public String getpTitle() {
		return pTitle;
	}
	public void setpTitle(String pTitle) {
		this.pTitle = pTitle;
	}
	public String getpDesc() {
		return pDesc;
	}
	public void setpDesc(String pDesc) {
		this.pDesc = pDesc;
	}
	public String getpPhoto() {
		return pPhoto;
	}
	public void setpPhoto(String pPhoto) {
		this.pPhoto = pPhoto;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	
	@Override
	public String toString() {
		return "Product [pId=" + pId + ", pTitle=" + pTitle + ", pDesc=" + pDesc + ", pPhoto=" + pPhoto + ", category="
				+ category + ", userType=" + userType + "]";
	}
	
	
	public Product(int pId, String pTitle, String pDesc, String pPhoto, Category category,String userType) {
		super();
		this.pId = pId;
		this.pTitle = pTitle;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.category = category;
		this.userType=userType;
	}
	public Product(String pTitle, String pDesc, String pPhoto, Category category,String userType) {
		super();
		this.pTitle = pTitle;
		this.pDesc = pDesc;
		this.pPhoto = pPhoto;
		this.category = category;
		this.userType=userType;
	}
	public Product() {
		super();
	}

    
   

      
    
}


