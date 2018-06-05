package com.example.service.impl;

import com.example.dao.userDAO;
import com.example.model.user;
import com.example.service.userService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service("userService")
public class userServiceImpl implements userService{
    @Autowired
    private userDAO UserDAO;

    @Override
    public List<user> findByLanguage(String language) {
        return UserDAO.findByLanguage(language);
    }

    @Override
    public List<user> findAll() {
        return this.UserDAO.findAll();
    }

    @Override
    public List<user> sortByStar() {
        return UserDAO.sortByStar();
    }
}
