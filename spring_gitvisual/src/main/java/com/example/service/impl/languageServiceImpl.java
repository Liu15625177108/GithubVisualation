package com.example.service.impl;

import com.example.dao.languageDAO;
import com.example.model.language;
import com.example.service.languageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("languageService")
public class languageServiceImpl implements languageService {
    @Autowired
    private languageDAO lanDAO;
    @Override
    public language findByType(String type) {
        return lanDAO.findByType(type);
    }
    @Override
    public List<language> findAll() {
        return lanDAO.findAll();
    }


}
