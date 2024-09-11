<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.library.entity.Book" %>
<%@ page import="com.library.Manager.HibernateDAO" %>
<%
    HibernateDAO dao = new HibernateDAO();
    List<Book> books = dao.getBooks();
    request.setAttribute("books", books);
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Books</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>List of Books</h1>
        <a href="addBook.jsp" class="btn btn-add">Add Book</a>
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>ISBN</th>
                    <th>Author</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Book> bookslist = (List<Book>)request.getAttribute("books");
                if (bookslist != null && !bookslist.isEmpty()) {
                    for (Book book : bookslist) {
                %>
                <tr>
                    <td><%= book.getId() %></td>
                    <td><%= book.getTitle() %></td>
                    <td><%= book.getIsbn() %></td>
                    <td><%= book.getAuthor() != null ? book.getAuthor().getName() : "Unknown" %></td>
                    <td>
                        <a href="editBook.jsp?id=<%= book.getId() %>" class="btn btn-edit">Edit</a>
                        <a href="deleteBook?id=<%= book.getId() %>" class="btn btn-delete">Delete</a>
                    </td>
                </tr>
                <% 
                    }
                } else {
                %>
                <tr>
                    <td colspan="5">No books found.</td>
                </tr>
                <% 
                }
                %>
            </tbody>
        </table>
        <a href="index.jsp">Back to Home</a>
    </div>
    
    <style>
    /* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.container {
    width: 80%;
    max-width: 1200px;
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h1 {
    color: #333;
    text-align: center;
}

a.btn {
    display: inline-block;
    padding: 10px 20px;
    font-size: 16px;
    text-decoration: none;
    border-radius: 5px;
    color: #fff;
    margin: 10px 0;
    text-align: center;
}

a.btn-add {
    background-color: #4CAF50; /* Green */
}

a.btn-edit {
    background-color: #2196F3; /* Blue */
}

a.btn-delete {
    background-color: #f44336; /* Red */
}

a.btn:hover {
    opacity: 0.8;
}

/* Table Styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: left;
}

thead {
    background-color: #f2f2f2;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}

th {
    background-color: #4CAF50;
    color: white;
}
    
    </style>
</body>
</html>
