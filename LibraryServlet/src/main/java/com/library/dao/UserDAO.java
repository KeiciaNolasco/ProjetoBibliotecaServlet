package com.library.dao;

import com.library.model.User;

public class UserDAO extends GenericDAO<User, Integer> {

    public UserDAO() {
        super(User.class);
    }

}
