package com.library.Manager;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import com.library.entity.Author;
import com.library.entity.Book;

public class HibernateDAO {
	
	
	private Session session;

	public HibernateDAO() {
		// TODO Auto-generated constructor stub
		session=new Configuration().configure().addAnnotatedClass(Book.class).addAnnotatedClass(Author.class)
		.buildSessionFactory().openSession();
	}
	
	public void addAuthor(Author a)
	{
		session.beginTransaction();
		session.persist(a);
		session.getTransaction().commit();
	}
	public void addBook(Book b)
	{
		session.beginTransaction();
		session.persist(b);
		session.getTransaction().commit();
	}
	 public Author getAuthorById(int id)
	 {
		 	session.beginTransaction();
			Author a = session.get(Author.class, id);
			session.getTransaction().commit();
			return a;
	 }
	public List<Author> getAuthors()
	{
		session.beginTransaction();
		Query<Author> query = session.createQuery("from Author",Author.class);
		List<Author> authorslist=query.getResultList();
		session.getTransaction().commit();
		return authorslist;
	}
	
	public List<Book> getBooks()
	{
		session.beginTransaction();
		Query<Book> query=session.createQuery("from Book",Book.class);
		List<Book> booklist=query.getResultList();
		session.getTransaction().commit();
		return booklist;
	}
	
	public void deleteAuthor(int id)
	{
		session.beginTransaction();
		Author a=session.get(Author.class,id);
		if(a!=null)
		{
			session.remove(a);
		}
		else {
			System.out.println("author not found");
		}
		session.getTransaction().commit();
	}
	
	public void deleteBook(int id)
	{
		session.beginTransaction();
		Book b=session.get(Book.class,id);
		if(b!=null)
		{
			session.remove(b);
		}
		else {
			System.out.println("booknot found");
		}
		session.getTransaction().commit();
	}
	
	public void updateAuthor(int authorid, String newName, String newBio)
	{
		session.beginTransaction();
		Author author = session.get(Author.class, authorid);
		if(author!=null)
		{
			author.setName(newName);
			author.setBio(newBio);
			
			session.update(author);
		}
		else {
			System.out.println("Author not found");
		}
		session.getTransaction().commit();
	}
	
	public Author getAuthorByName(String authorName) {
	    Author author = null;
	    try {
	        session.beginTransaction();
	        String hql = "FROM Author WHERE name = :authorName";
	        author = (Author) session.createQuery(hql)
	                                  .setParameter("authorName", authorName)
	                                  .uniqueResult();
	        session.getTransaction().commit();
	    } catch (Exception e) {
	        if (session.getTransaction() != null) {
	            session.getTransaction().rollback();
	        }
	        e.printStackTrace();
	    }
	    return author;
	}

	public void updateBooks(int bookId,String newTitle,String newISbn)
	{
		session.beginTransaction();
		Book b=session.get(Book.class, bookId);
		if(b!=null)
		{
			b.setTitle(newTitle);
			b.setIsbn(newISbn);
			session.update(b);
		}
		else {
			System.out.println("Book not found");
		}
		session.getTransaction().commit();
	}
	
	public Book getBookById(int id)
	{
		session.beginTransaction();
		Book b=session.get(Book.class, id);
		return b;
		
	}

	
}
