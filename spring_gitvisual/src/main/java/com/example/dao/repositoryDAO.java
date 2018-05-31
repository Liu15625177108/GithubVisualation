package com.example.dao;
import com.example.model.repository;

import java.util.List;

public interface repositoryDAO {
   List <repository> findByLanguage(String language);
    List<repository> findAll();
    List<repository> sortByStar();
}
