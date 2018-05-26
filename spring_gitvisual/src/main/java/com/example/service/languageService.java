package com.example.service;

import com.example.model.language;

import java.util.List;

public interface languageService {
    language findByType(String type);
    List<language> findAll();
    List<language> sortByRep();
}
