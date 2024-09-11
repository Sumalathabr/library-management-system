package com.library.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.Manager.HibernateDAO;
import com.library.entity.Author;


@WebServlet("/addauthor")
public class AddAuthor extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String name=req.getParameter("name");
		String bio=req.getParameter("bio");
		Author a =new Author();
		a.setName(name);
		a.setBio(bio);
		HibernateDAO dao = new HibernateDAO();
		dao.addAuthor(a);
		resp.sendRedirect("listAuthors.jsp");
		
		
	}
}
