<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.library.entity.Author"%>
<%@ page import="java.util.*"%>
<%@ page import="com.library.Manager.HibernateDAO"%>
<%
    HibernateDAO hdao = new HibernateDAO();
    List<Author> authors = hdao.getAuthors();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>List of Authors</title>
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
            max-width: 800px;
            width: 100%;
        }
        h1 {
            color: #333;
            font-size: 2rem;
            margin-bottom: 20px;
            font-weight: 600;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
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
        .btn {
            display: inline-block;
            padding: 10px 20px;
            margin: 10px;
            color: #fff;
            text-decoration: none;
            border-radius: 4px;
            font-size: 16px;
            background-color: #008CBA;
        }
        .btn-add {
            background-color: #4CAF50; /* Green */
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Authors</h1>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Bio</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for (Author author : authors) { %>
                <tr>
                    <td><%= author.getId() %></td>
                    <td><%= author.getName() %></td>
                    <td><%= author.getBio() %></td>
                    <td>
                        <a href="editAuthor.jsp?id=<%= author.getId() %>" class="btn btn-edit">Edit</a>
                        <a href="deleteAuthor?id=<%= author.getId() %>" class="btn btn-delete">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <a href="addAuthor.jsp" class="btn btn-add">Add New Author</a>
    </div>
</body>
</html>
