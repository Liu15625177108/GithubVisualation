package com.example.dao;

import  com.example.model.area;

import java.util.List;

public interface areaDAO {
    List <area> findAll();
    List <area> sortByUsernums();
}
