package com.library.dao;

import com.library.model.Book;

public class BookDAO extends GenericDAO<Book, String> {

    public BookDAO() {
        super(Book.class);
    }

}
