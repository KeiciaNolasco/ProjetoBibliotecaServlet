package com.library.service;

import com.library.dao.UserDAO;
import com.library.model.User;

import java.util.List;

public class AuthenticationService {

    private UserDAO userDAO;

    public AuthenticationService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public User authenticate(String email, String password) {
        List<User> users = userDAO.findAll();
        for (User user : users) {
            if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                return user;
            }
        }
        return null;
    }

    public void registerUser(User user) {
        userDAO.save(user);
    }

    public List<User> findAll() {
        return userDAO.findAll();
    }

}