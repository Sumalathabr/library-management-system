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
import com.library.entity.Author;
import com.library.entity.Book;

@WebServlet("/addBookAction")
public class AddBookAction extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HibernateDAO dao = new HibernateDAO();
        String title = req.getParameter("title");
        String isbn = req.getParameter("isbn");
        String authorName = req.getParameter("author");
        
        Author author = dao.getAuthorByName(authorName);
        if (author == null) {
            author = new Author();
            author.setName(authorName);
            dao.addAuthor(author); 
            
        }
        
        Book book = new Book();
        book.setTitle(title);
        book.setIsbn(isbn);
        book.setAuthor(author);
        
        dao.addBook(book);
        
        // Fetch updated list of books
        List<Book> books = dao.getBooks();
        req.setAttribute("books", books);
        
        // Forward to JSP
        RequestDispatcher dispatcher = req.getRequestDispatcher("listBooks.jsp");
        dispatcher.forward(req, resp);
    }
}

