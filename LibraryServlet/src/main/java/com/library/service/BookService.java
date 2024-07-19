package com.library.service;

import com.library.dao.BookDAO;
import com.library.model.Book;

import java.util.List;

public class BookService {

    private BookDAO bookDAO;

    public BookService(BookDAO bookDAO) {
        this.bookDAO = bookDAO;
    }

    public void save(Book book) {
        bookDAO.save(book);
    }

    public List<Book> findAll() {
        return bookDAO.findAll();
    }

    public Book findById(String isbn) {
        return bookDAO.findById(isbn);
    }

    public void update(Book book) {
        bookDAO.update(book);
    }

    public void delete(String isbn) {
        bookDAO.deleteById(isbn);
    }
}