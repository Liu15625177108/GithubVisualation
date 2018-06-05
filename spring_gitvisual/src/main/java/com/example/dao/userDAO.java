package com.example.dao;

import com.example.model.user;

import java.util.List;

public interface userDAO {
    List<user> findByLanguage(String language);
    List<user> findAll();
    List<user> sortByStar();

}
