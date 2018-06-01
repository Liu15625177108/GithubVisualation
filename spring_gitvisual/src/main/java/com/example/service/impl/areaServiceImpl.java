package com.example.service.impl;

import com.example.dao.areaDAO;
import com.example.model.area;
import com.example.service.areaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("areaService")
public class areaServiceImpl implements areaService{
    @Autowired
    private  areaDAO AreaDao;
    @Override
    public List<area> findAll() {
        return  AreaDao.findAll();
    }
}
