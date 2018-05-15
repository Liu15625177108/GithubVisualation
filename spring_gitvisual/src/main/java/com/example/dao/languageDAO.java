package com.example.dao;

import com.example.model.language;

import java.util.List;

//接口 languageDAO
public interface languageDAO {
    language findByType(String type);
    List<language> findAll();
}
