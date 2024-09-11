package com.library.entity;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.Manager.HibernateDAO;

@WebServlet("/deleteAuthor")
public class DeleteAuthor extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		HibernateDAO dao = new HibernateDAO();
		dao.deleteAuthor(id);
		resp.sendRedirect("listAuthors.jsp");
	}
	
}
