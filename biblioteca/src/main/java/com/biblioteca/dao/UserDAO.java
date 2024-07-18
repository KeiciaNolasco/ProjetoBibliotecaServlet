package com.biblioteca.dao;

import com.biblioteca.model.User;

public class UserDAO extends GenericDAO<User, Integer> {

    public UserDAO() {
        super(User.class);
    }

}
