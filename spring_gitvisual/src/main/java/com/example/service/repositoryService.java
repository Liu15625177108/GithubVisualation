package com.example.service;
import com.example.model.repository;

import java.util.List;
public interface repositoryService {

    List<repository> findByLanguage(String language);
    List<repository> findAll();
    List<repository> sortByStar();
}
