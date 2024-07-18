package com.biblioteca.dao;

import com.biblioteca.model.Book;

public class BookDAO extends GenericDAO<Book, String> {

    public BookDAO() {
        super(Book.class);
    }

}
