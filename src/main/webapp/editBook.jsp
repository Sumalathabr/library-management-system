<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.entity.Book" %>
<%@ page import="com.library.Manager.HibernateDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Book</title>
    <link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
    <div class="container">
        <h1>Edit Book</h1>

        <%
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                int bookId = Integer.parseInt(idParam);
                HibernateDAO dao = new HibernateDAO();
                Book book = dao.getBookById(bookId);
                
                if (book != null) {
        %>

        <form action="updateBook" method="post">
            <input type="hidden" name="id" value="<%= book.getId() %>">
            
            <div>
                <label for="title">Title:</label>
                <input type="text" id="title" name="title" value="<%= book.getTitle() %>" required>
            </div>
            
            <div>
                <label for="isbn">ISBN:</label>
                <input type="text" id="isbn" name="isbn" value="<%= book.getIsbn() %>" required>
            </div>
            
          <!--   <div>
                <label for="author">Author:</label>
                <input type="text" id="author" name="author" value="<%= book.getAuthor() != null ? book.getAuthor().getName() : "" %>" required>
            </div>--> 
            
            <div>
                <input type="submit" value="Update Book" class="btn btn-edit">
            </div>
        </form>

        <% 
                } else {
        %>
        <p>Book not found.</p>
        <% 
                }
            } else {
        %>
        <p>Invalid book ID.</p>
        <% 
            }
        %>

        <a href="listBooks.jsp" class="btn btn-back">Back to Book List</a>
    </div>
    
    <style>
    
    /* General Reset */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f0f0f0;
    padding: 20px;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
}

.container {
    background-color: #ffffff;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    width: 100%;
}

h1 {
    font-size: 24px;
    color: #333333;
    margin-bottom: 20px;
    text-align: center;
}

form {
    width: 100%;
}

form div {
    margin-bottom: 15px;
}

label {
    font-weight: bold;
    color: #555555;
    display: block;
    margin-bottom: 5px;
}

input[type="text"] {
    width: 100%;
    padding: 10px;
    font-size: 16px;
    border: 1px solid #ccc;
    border-radius: 4px;
    transition: border-color 0.3s;
}

input[type="text"]:focus {
    border-color: #007BFF;
    outline: none;
}

input[type="submit"] {
    width: 100%;
    background-color: #28a745;
    color: white;
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    transition: background-color 0.3s;
}

input[type="submit"]:hover {
    background-color: #218838;
}

a.btn-back {
    display: block;
    text-align: center;
    margin-top: 20px;
    text-decoration: none;
    background-color: #007BFF;
    color: white;
    padding: 12px 20px;
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s;
}

a.btn-back:hover {
    background-color: #0056b3;
}
    
    
    
    
    </style>
</body>
</html>
