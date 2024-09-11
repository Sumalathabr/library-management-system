package com.library.servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.library.Manager.HibernateDAO;
import com.library.entity.Book;


@WebServlet("/deleteBook")
public class DeleteBook extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        HibernateDAO dao = new HibernateDAO();
        dao.deleteBook(id);
        
        List<Book> books = dao.getBooks();
        req.setAttribute("books", books);
        RequestDispatcher dispatcher = req.getRequestDispatcher("listBooks.jsp");
        dispatcher.forward(req, resp);
    }
}

