package com.library.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.Manager.HibernateDAO;


@WebServlet("/updateAuthor")
public class UpdateAuthor extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name=req.getParameter("name");
		String bio = req.getParameter("bio");
		int id =Integer.parseInt(req.getParameter("id"));
		HibernateDAO dao = new HibernateDAO();
		dao.updateAuthor(id, name, bio);
		resp.sendRedirect("listAuthors.jsp");
		
	}
}
