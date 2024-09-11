package com.library.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.Manager.HibernateDAO;

@WebServlet("/updateBook")
public class UpdateBook extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int id=Integer.parseInt(req.getParameter("id"));
		String title=req.getParameter("title");
		String isbn=req.getParameter("isbn");
		HibernateDAO dao = new HibernateDAO();
		dao.updateBooks(id, title, isbn);
		resp.sendRedirect("listBooks.jsp");
	}

}
