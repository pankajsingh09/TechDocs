package com.learn.myEcart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import com.learn.myEcart.Dao.CategoryDao;
import com.learn.myEcart.Dao.ProductDao;
import com.learn.myEcart.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;



public class Contribute_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public Contribute_Servlet() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */
			
			try {
				
				String op = request.getParameter("operation");
				String cID=request.getParameter("catID");
				int id = Integer.parseInt(cID.trim());
				
				ProductDao dao = new ProductDao(FactoryProvider.getFactory());
				CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
				
				if (op.trim().equals("valid")) {
					
					dao.saveProductNormalType(id);
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "Article Validated Successfully...");
					response.sendRedirect("index.jsp");
					return;
				}
				else if (op.trim().equals("delete"))
				{
					dao.deleteProductNormalType(id);
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "Article deleted Successfully...");
					response.sendRedirect("index.jsp");
					return;
				}
				else if (op.trim().equals("validCat"))
				{
					cdao.saveCategoryNormalType(id);
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "Category Added Successfully...");
					response.sendRedirect("index.jsp");
					return;
				}
				else if (op.trim().equals("deleteCat"))
				{
					cdao.deleteCategoryNormalType(id);
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "Category deleted Successfully...");
					response.sendRedirect("index.jsp");
					return;
				}
				
				
			}
			catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		
	}

}
