package com.learn.myEcart.helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

public class Helper {
	
	
	public static String get10Words(String desc) {
		
		String str[]=desc.split(" ");
		if(str.length>20)
		{
			String res="";
			for(int i=0;i<20;i++)
			{
				res+=str[i]+" ";
			}
			
			return res+"...";
			
			
		}else {
			return desc+"...";
		}
	}
	
	public static Map<String, Long> getCount(SessionFactory factory )
	{
		Session session=factory.openSession();
		String q1="Select count(*) from User ";
		String q2="Select count(*) from Product";
		String q3="Select count(*) from Product where userType =:a";
		String q4="Select count(*) from Category where userType =:a";
		
		Query query1=session.createQuery(q1);
		Query query2=session.createQuery(q2);
		Query query3=session.createQuery(q3);
		Query query4=session.createQuery(q4);
		
		
		query3.setParameter("a", "normal");
		query4.setParameter("a", "normal");
		
		Long userCount=(Long) query1.list().get(0);
		Long productCount=(Long) query2.list().get(0);
		Long productCountNormal=(Long) query3.list().get(0);
		Long categoryCountNormal=(Long) query4.list().get(0);

		Map<String , Long> map=new HashMap<String, Long>();
		map.put("userCount", userCount);
		map.put("productCount", productCount);
		map.put("productCountNormal", productCountNormal);
		map.put("categoryCountNormal", categoryCountNormal);
		
		session.close();
		
		return map;
		
	}

}
