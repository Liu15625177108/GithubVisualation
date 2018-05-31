package com.example.service.impl;


import com.example.dao.repositoryDAO;
import com.example.model.repository;
import com.example.service.repositoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("repositoryService")
public class repositoryServiceImpl implements repositoryService{
    @Autowired
    private  repositoryDAO repDAO;
    @Override
    public List<repository> findByLanguage(String language) {
        return repDAO.findByLanguage(language);
    }

    @Override
    public List<repository> findAll() {
        return repDAO.findAll();
    }

    @Override
    public List<repository> sortByStar() {
        return  repDAO.sortByStar();
    }
}
