package com.learn.myEcart.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.learn.myEcart.Dao.UserDao;
import com.learn.myEcart.entities.User;
import com.learn.myEcart.helper.FactoryProvider;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public class Register_Servlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public Register_Servlet() {

	}

	protected void doPost(jakarta.servlet.http.HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			/* TODO output your page here. You may use following sample code. */

			try {

				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String userNumber = request.getParameter("user_number");
				String userAddress = request.getParameter("user_address");
				String userGender = request.getParameter("user_Gender");

				// Check if Email id Already Exist

				UserDao userDao = new UserDao(FactoryProvider.getFactory());
				User userByEmail = userDao.getUserByEmail(userEmail);

				if (userByEmail != null) {
					HttpSession httpSession = request.getSession();
					httpSession.setAttribute("message", "User Already Exists with this Email !! Try Again with another Email");
					response.sendRedirect("register.jsp");
					return;
				}

//	                validation

				if (userName.isEmpty()) {
					HttpSession httpsession = request.getSession();
					httpsession.setAttribute("message", "User Name is Empty, Try again");
					response.sendRedirect("register.jsp");
					return;

				}
				if (userAddress.isEmpty()) {
					HttpSession httpsession = request.getSession();
					httpsession.setAttribute("message", "User Address is Empty, Try again");
					response.sendRedirect("register.jsp");
					return;

				}
				if (userNumber.length()<10 || userNumber.length() > 10) {
					HttpSession httpsession = request.getSession();
					httpsession.setAttribute("message", "Invalid Mobile Number, Try again");
					response.sendRedirect("register.jsp");
					return;
				}

//	                creating object of user
				User user = new User(userName, userEmail, userPassword, userNumber, "default.jpg", userAddress,
						userGender, "normal");

				int userId;
				try (Session s = FactoryProvider.getFactory().openSession()) {
					Transaction tx = s.beginTransaction();
					userId = (int) s.save(user);
					tx.commit();
				}

				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("message", "Registration Successfull !! ");
				response.sendRedirect("login.jsp");
				return;

			} catch (Exception e) {

				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("message", "Oops you made a mistake, Try again");
				response.sendRedirect("register.jsp");
				return;

			}

		}
	}

}