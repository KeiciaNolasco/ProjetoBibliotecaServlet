package com.library.service;

import com.library.dao.UserDAO;
import com.library.model.User;

import java.util.List;

public class UserService {

    private UserDAO userDAO;

    public UserService(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    public void save(User user) {
        userDAO.save(user);
    }

    public List<User> findAll() {
        return userDAO.findAll();
    }

    public User findById(Integer id) {
        return userDAO.findById(id);
    }

    public void update(User user) {
        userDAO.update(user);
    }

    public void delete(Integer id) {
        userDAO.deleteById(id);
    }

}