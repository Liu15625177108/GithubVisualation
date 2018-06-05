package com.example.service;
import com.example.model.user;
import java.util.List;


public interface userService {
    List<user> findByLanguage(String language);
    List<user> findAll();
    List<user> sortByStar();
}
