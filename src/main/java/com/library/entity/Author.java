package com.library.entity;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="author")
public class Author {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	@Column(name="name")
	private String name;
	
	@Column(name="bio")
	private String bio;
	
	
	
	@OneToMany(mappedBy = "author", cascade = CascadeType.ALL)
	private List<Book> books;
	
	public List<Book> getBooks() {
		return books;
	}
	public void setBooks(List<Book> books) {
		this.books = books;
	}
	
	
	
	
	
	public Author(int id, String name, String bio, List<Book> books) {
		super();
		this.id = id;
		this.name = name;
		this.bio = bio;
		this.books = books;
	}
	public Author(String name, String bio, List<Book> books) {
		super();
		this.name = name;
		this.bio = bio;
		this.books = books;
	}
	public Author(int id, String name, String bio) {
		super();
		this.id = id;
		this.name = name;
		this.bio = bio;
	}
	public Author(String name, String bio) {
		super();
		this.name = name;
		this.bio = bio;
	}
	public Author() {
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBio() {
		return bio;
	}
	public void setBio(String bio) {
		this.bio = bio;
	}
	@Override
	public String toString() {
		return "Author [id=" + id + ", name=" + name + ", bio=" + bio + "]";
	}
	
	
	
}
