<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.entity.Author" %>
<%@ page import="com.library.Manager.HibernateDAO" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Author</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background: linear-gradient(135deg, #ece9e6, #ffffff);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            text-align: center;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 600px;
            width: 100%;
        }
        h1 {
            color: #333;
            font-size: 2rem;
            margin-bottom: 20px;
            font-weight: 600;
        }
        form {
            margin: 0 auto;
            display: inline-block;
            text-align: left;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            font-weight: 500;
        }
        input[type="text"], textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #008CBA;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        input[type="submit"]:hover {
            background-color: #005f73;
        }
        a {
            text-decoration: none;
            color: #007bff;
            font-size: 1rem;
            font-weight: 500;
            transition: color 0.3s ease;
        }
        a:hover {
            color: #0056b3;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Author</h1>
        
        <% 
            String idParam = request.getParameter("id");
            if (idParam != null && !idParam.isEmpty()) {
                int authorId = Integer.parseInt(idParam);
                HibernateDAO hdao = new HibernateDAO();
                Author author = hdao.getAuthorById(authorId);
                
                if (author != null) {
        %>
        
        <form action="updateAuthor" method="post">
            <input type="hidden" name="id" value="<%= author.getId() %>">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" value="<%= author.getName() %>" required>
            
            <label for="bio">Bio:</label>
            <textarea id="bio" name="bio" rows="4" cols="50"><%= author.getBio() %></textarea>
            
            <input type="submit" value="Update Author">
        </form>
        
        <% 
                } else {
        %>
        <p>Author not found.</p>
        <% 
                }
            } else {
        %>
        <p>Invalid author ID.</p>
        <% 
            }
        %>
        
        <a href="listAuthors.jsp">Back to List of Authors</a>
    </div>
</body>
</html>
